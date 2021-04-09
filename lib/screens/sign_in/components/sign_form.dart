import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/components/bottom_nav_bar.dart';
import 'package:shop_app/components/custom_surfix_icon.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/components/loading.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/variables.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  bool invisible = true;
  bool loading = false;
  String userId = "";
  String accessToken = "";
  String authorization;
  var isLoggedInTrue;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  void inContact(TapDownDetails details) {
    setState(() {
      invisible = false;
    });
  }

  void outContact(TapUpDetails details) {
    setState(() {
      invisible = true;
    });
  }

  // user defined function
  @override
  void initState() {
    userID();
    stayLoggedIn();
    authorizationToken();

    // TODO: implement initState
  }

  void stayLoggedIn() {
    if (accessToken != true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CustomNavBar();
          },
        ),
      );
    }
  }

  void userID() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    SharedPreferences accesstoken = await SharedPreferences.getInstance();
    setState(() {
      userId = pref.getString('userId');
      accessToken = accesstoken.getString('accessToken');
    });
  }

  void authorizationToken() async {
    SharedPreferences accesstoken = await SharedPreferences.getInstance();
    setState(() {
      authorization = accesstoken.getString('accessToken');
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Form(
            key: _formKey,
            child: Column(
              children: [
                buildEmailFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildPasswordFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                Row(
                  children: [
                    Checkbox(
                      value: remember,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {
                        setState(() {
                          remember = value;
                        });
                      },
                    ),
                    Text("Remember me"),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, ForgotPasswordScreen.routeName),
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                FormError(errors: errors),
                SizedBox(height: getProportionateScreenHeight(20)),
                DefaultButton(
                    text: "Continue",
                    press: () {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        _formKey.currentState.save();
                        // if all are valid then go to success screen
                        KeyboardUtil.hideKeyboard(context);
                      }

                      Future<int> st1 = _makePostRequest();
                    }),
              ],
            ),
          );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: invisible,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GestureDetector(
          onTapUp: outContact,
          onTapDown: inContact,
          child: CustomSurffixIcon(
            svgIcon: "assets/icons/Lock.svg",
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  Future<int> _makePostRequest() async {
    // set up POST request arguments
    // String url = 'https://test.davidsmiles.xyz/account/login';
    String extension = '/account/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    Map toJson() => {
          'email': email,
          'password': password,
        };
    String send = jsonEncode(toJson());
    print(email + password);
    // make POST request
    Response response =
        await post(url + extension, headers: headers, body: send);
    // check the status code for the result
    int statusCode = response.statusCode;

    // this API passes back the id of the new item added to the body
    String body = response.body;
    var access_token = jsonDecode(body)['access_token'];
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    // }
    print(body);
    print(userId);
    print(accessToken);
    if (statusCode == 200) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('accessToken', access_token);

      setState(() {
        loading = true;
        isLoggedInTrue = sp.setBool('isLoggedIn', true);
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CustomNavBar();
          },
        ),
      );
      // Navigator.pushNamed(context, HomeScreen.routeName);

      print("success");
      print(accessToken);
      removeError(error: kWrongEmailError);
    }
    // if (statusCode == 200) {
    //   SharedPreferences pref = await SharedPreferences.getInstance();
    //   pref.setString('userId', id);
    // }
    else {
      // Navigator.pushNamed(context, SignUpScreen.routeName);
      print("failed");
      addError(error: kWrongEmailError);
      setState(() {
        loading = false;
      });
    }
    return statusCode;
  }
}
