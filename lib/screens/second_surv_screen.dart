import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/components/re_useable_card.dart';
import 'package:shop_app/components/re_useable_column.dart';
import 'package:shop_app/components/survey_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/variables.dart';

enum Building { flat, duplex, bungalow, selfcontain, storybuilding, estate }

class SecondSurveyPage extends StatefulWidget {
  static String routeName = "/second_surv_screen.dart";
  @override
  _SecondSurveyPageState createState() => _SecondSurveyPageState();
}

class _SecondSurveyPageState extends State<SecondSurveyPage> {
  Color maleCardColor = kInactiveCardColour;
  Color femaleCardColor = kInactiveCardColour;
  Building selectBuilding;
  int selected = 0;
  bool remember = false;
  bool flat = false;
  bool duplex = false;
  bool bungalow = false;
  bool selfContain = false;
  bool storyBuilding = false;
  bool estate = false;
  List choices = <String>[];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                SingleChildScrollView(
                  child: Text(
                    'Help Us Know Your Preference',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: getProportionateScreenWidth(18),
                        letterSpacing: 1.5),
                  ),
                ),
                Text(
                  'Select Only 5 Choices',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: getProportionateScreenWidth(18),
                      letterSpacing: 1.5),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              flat = true;
                            });
                          },
                          child: ReusableCard(
                              cardChild: Column(
                                children: [
                                  UsableColum(
                                    icon: Icons.house,
                                    child: SvgPicture.asset(
                                        "assets/icons/balcony.svg"),
                                    text: 'FLAT',
                                    secondChild: Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.blue,
                                      value: this.flat,
                                      onChanged: (bool value) {
                                        setState(() {
                                          selected >= 5
                                              ? value = false
                                              : this.flat = value;
                                          if (flat == true) {
                                            selected++;
                                            choices.add('flat');
                                          } else
                                            selected--;
                                        });
                                        print(flat);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              colour: selectBuilding == Building.flat
                                  ? maleCardColor = kActiveCardColour
                                  : maleCardColor = kInactiveCardColour
                              // : maleCardColor = kInactiveCardColour,
                              ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              duplex = true;
                            });
                          },
                          child: ReusableCard(
                            cardChild: UsableColum(
                              icon: Icons.house,
                              child: SvgPicture.asset(
                                "assets/icons/bungalow.svg",
                                height: 100,
                                width: 100,
                                color: kBottomContainerColour,
                              ),
                              text: 'DUPLEX',
                              secondChild: Checkbox(
                                checkColor: Colors.white,
                                activeColor: Colors.blue,
                                value: this.duplex,
                                onChanged: (bool value) {
                                  setState(
                                    () {
                                      selected >= 5
                                          ? value = false
                                          : this.duplex = value;
                                      if (duplex == true) {
                                        choices.add('duplex');
                                        selected++;
                                        print(choices);
                                      } else
                                        selected--;
                                    },
                                  );
                                },
                              ),
                            ),
                            colour: selectBuilding == Building.duplex
                                ? femaleCardColor = kActiveCardColour
                                : femaleCardColor = kInactiveCardColour,
                            // : femaleCardColor = kInactiveCardColour,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selfContain == true;
                            });
                          },
                          child: ReusableCard(
                            cardChild: UsableColum(
                              child:
                                  SvgPicture.asset("assets/icons/bungalow.svg"),
                              icon: Icons.house,
                              text: 'SELF CONTAIN',
                              secondChild: Checkbox(
                                checkColor: Colors.white,
                                activeColor: Colors.blue,
                                value: this.selfContain,
                                onChanged: (bool value) {
                                  setState(() {
                                    selected >= 5
                                        ? value = false
                                        : this.selfContain = value;
                                    if (selfContain == true) {
                                      choices.add('selfcontain');
                                      selected++;
                                      print(choices);
                                    } else
                                      selected--;
                                  });
                                },
                              ),
                            ),
                            colour: selectBuilding == Building.selfcontain
                                ? maleCardColor = kActiveCardColour
                                : maleCardColor = kInactiveCardColour,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              storyBuilding == true;
                            });
                          },
                          child: ReusableCard(
                            cardChild: UsableColum(
                              child:
                                  SvgPicture.asset("assets/icons/bungalow.svg"),
                              icon: Icons.house,
                              text: 'STORY BUILDING',
                              secondChild: Checkbox(
                                checkColor: Colors.white,
                                activeColor: Colors.blue,
                                value: this.storyBuilding,
                                onChanged: (bool value) {
                                  setState(() {
                                    selected >= 5
                                        ? value = false
                                        : this.storyBuilding = value;
                                    if (storyBuilding == true) {
                                      choices.add('storyBuilding');
                                      selected++;
                                      print(choices);
                                    } else
                                      selected--;
                                  });
                                },
                              ),
                            ),
                            colour: selectBuilding == Building.storybuilding
                                ? femaleCardColor = kActiveCardColour
                                : femaleCardColor = kInactiveCardColour,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              estate = true;
                            });
                          },
                          child: ReusableCard(
                            cardChild: UsableColum(
                              child:
                                  SvgPicture.asset("assets/icons/bungalow.svg"),
                              icon: Icons.house,
                              text: 'ESTATE',
                              secondChild: Checkbox(
                                checkColor: Colors.white,
                                activeColor: Colors.blue,
                                value: this.estate,
                                onChanged: (bool value) {
                                  setState(() {
                                    selected >= 5
                                        ? value = false
                                        : this.estate = value;
                                    if (estate == true) {
                                      choices.add('estate');
                                      selected++;
                                    } else
                                      selected--;
                                  });
                                },
                              ),
                            ),
                            colour: selectBuilding == Building.estate
                                ? maleCardColor = kActiveCardColour
                                : maleCardColor = kInactiveCardColour,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            bungalow == true;
                          },
                          child: ReusableCard(
                            cardChild: UsableColum(
                              icon: Icons.house,
                              child:
                                  SvgPicture.asset("assets/icons/bungalow.svg"),
                              text: 'BUNGALOW',
                              secondChild: Checkbox(
                                checkColor: Colors.white,
                                activeColor: Colors.blue,
                                value: this.bungalow,
                                onChanged: (bool value) {
                                  setState(() {
                                    selected >= 5
                                        ? value = false
                                        : this.bungalow = value;
                                    if (bungalow == true) {
                                      choices.add('bungalow');
                                      selected++;
                                    } else
                                      selected--;
                                  });
                                },
                              ),
                            ),
                            colour: selectBuilding == Building.bungalow
                                ? femaleCardColor = kActiveCardColour
                                : femaleCardColor = kInactiveCardColour,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: DefaultButton(
                    text: "Submit",
                    press: () {
                      // if (_formKey.currentState.validate()) {
                      //   _formKey.currentState.save();
                      // }
                      print(choices);
                      Navigator.pop(context);
// Navigator.pushNamed(
                      _makePostRequest();
                      _makeGetRequest();
//     context, LoginSuccessScreen.routeName);
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // SizedBox(
  // width: getProportionateScreenHeight(0),
  // height: getProportionateScreenHeight(50),
  // child: FlatButton(
  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
  // color: kPrimaryColor,
  // onPressed: press,
  // child: Text(
  // text,
  // style: TextStyle(
  // fontSize: getProportionateScreenWidth(18),
  // color: Colors.white,
  // ),
  // ),
  // ),
  // )

  _makePostRequest() async {
    SharedPreferences accesstoken = await SharedPreferences.getInstance();
    String authorization = accesstoken.getString('accessToken');
    // set up POST request arguments
    //String url = 'https://test.davidsmiles.xyz/users/603e554a7cf3b16fdf6e3655';
    String secondSurvey = '/users/603e554a7cf3b16fdf6e3655';
    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    Map toJson() => {'tags_of_interest': choices};
    String send = jsonEncode(toJson());
    // make POST request
    Response response = await put(
      url + secondSurvey,
      headers: headers,
      body: send,
    );
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

_makeGetRequest() async {
  // make GET request
  String properties = '/properties';
  Response response = await get(url + properties);
  // sample info available in response
  int statusCode = response.statusCode;
  Map<String, String> headers = response.headers;
  String contentType = headers['content-type'];
  String json = response.body;
  print(json);
  print(statusCode);
  // TODO convert json to object...
}

// // Sending a GET request
// const url = 'http://some-api.com/users';
// const response = await http.get(url);
// print(response.body);
//
// // Sending a GET request using .read
// const data = await http.read(url);
// print(data);
