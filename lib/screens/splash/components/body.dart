import 'dart:convert';

//import 'package:shop_app/screens/sign_in/components/sign_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/components/bottom_nav_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/variables.dart';

import '../../../components/default_button.dart';
// This is the best practice
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  String authorization;
  bool next;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Flat Mate, Let’s Find you a building!",
      "image": "assets/images/undraw1.png"
    },
    {
      "text": "We help people conect with properties \naround Nigeria",
      "image": "assets/images/undraw2.png"
    },
    {
      "text":
          "We show the easy way to get a new building. \nJust stay at home with us",
      "image": "assets/images/undraw3.png"
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    getData();
    sk();
  }

  void getData() async {
    SharedPreferences accesstoken = await SharedPreferences.getInstance();
    setState(() {
      authorization = accesstoken.getString('accessToken');
    });
  }

  void sk() {
    if (next == true) {
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

  Future<void> shared() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      sp.setBool('next', true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        shared();
                        // makeGetRequestForProperties();
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

Future getProperties() async {
  String properties = '/properties';
  Response response = await get(url + properties);
  if (response.statusCode == 200) {
    String data = response.body;
    return jsonDecode(data);
  } else {
    print(response.statusCode);
  }
}
