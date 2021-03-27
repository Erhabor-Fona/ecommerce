import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/before_second_survey_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/variables.dart';

class FirstSurveyPage extends StatefulWidget {
  static String routeName = "/survey.dart";

  @override
  _FirstSurveyPageState createState() => _FirstSurveyPageState();
}

class _FirstSurveyPageState extends State<FirstSurveyPage> {
  bool _loading = false;
  String firstname;
  String lastname;
  String dob;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    "Flat Mate",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 0.3,
                  ),
                  Text(
                    ' Let\'s Get To Know You!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: getProportionateScreenWidth(18),
                        letterSpacing: 1.5),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (newValue) => firstname = newValue,
                      onChanged: (value) {
                        firstname = value;
                      },
                      maxLength: 12,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (newValue) => lastname = newValue,
                      onChanged: (value) {
                        lastname = value;
                      },
                      maxLength: 12,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: ' Last Name',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (newValue) => dob = newValue,
                      onChanged: (value) {
                        dob = value;
                      },
                      maxLength: 12,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'Date of Birth',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultButton(
                      text: "Next",
                      press: () {
                        // if (_formKey.currentState.validate()) {
                        //   _formKey.currentState.save();
                        // }
                        _makePostRequest();
                        Navigator.pop(context);
                        print(firstname + lastname + dob);
                        Navigator.pushNamed(
                            context, BeforeSecondSurveyPage.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _makePostRequest() async {
    // set up POST request arguments
    // String url = 'https://test.davidsmiles.xyz/users/603e554a7cf3b16fdf6e3655';
    String firstSurvey = '/users/603e554a7cf3b16fdf6e3655';
    Map<String, String> headers = {"Content-type": "application/json"};
    Map toJson() => {
          'firstname': firstname,
          'lastname': lastname,
          'dob': dob,
        };
    String send = jsonEncode(toJson());
    // make POST request
    Response response =
        await put(url + firstSurvey, headers: headers, body: send);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    // }
    print(statusCode);
    if (statusCode == 200) {
      print("success");
    } else {
      // Navigator.pushNamed(context, SignUpScreen.routeName);
      print("failed");
    }
  }
}
