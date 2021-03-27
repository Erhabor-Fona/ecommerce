import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/second_surv_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/variables.dart';

class BeforeSecondSurveyPage extends StatefulWidget {
  static String routeName = "/before_second_survey_screen.dart";

  @override
  _BeforeSecondSurveyPageState createState() => _BeforeSecondSurveyPageState();
}

class _BeforeSecondSurveyPageState extends State<BeforeSecondSurveyPage> {
  String maritalStatus;
  String stateOfOrigin;
  String religion;
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
                      onSaved: (newValue) => maritalStatus = newValue,
                      onChanged: (value) {
                        maritalStatus = value;
                      },
                      maxLength: 12,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'Marital Status',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (newValue) => stateOfOrigin = newValue,
                      onChanged: (value) {
                        stateOfOrigin = value;
                      },
                      maxLength: 12,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: ' State of Origin',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (newValue) => religion = newValue,
                      onChanged: (value) {
                        religion = value;
                      },
                      maxLength: 12,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'Religion',
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
                        print(maritalStatus + stateOfOrigin + religion);
                        Navigator.pushNamed(
                            context, SecondSurveyPage.routeName);
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
    //String url = 'https://test.davidsmiles.xyz/users/603e554a7cf3b16fdf6e3655';
    String beforeSecondSurvey = '/users/603e554a7cf3b16fdf6e3655';
    Map<String, String> headers = {"Content-type": "application/json"};
    Map toJson() => {
          'marital_status': maritalStatus,
          'state_of_origin': stateOfOrigin,
          'religion': religion,
        };
    String send = jsonEncode(toJson());
    // make POST request
    Response response =
        await put(url + beforeSecondSurvey, headers: headers, body: send);
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
  }
}
