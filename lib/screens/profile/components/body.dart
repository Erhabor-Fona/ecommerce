import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/Account/account.dart';
import 'package:shop_app/screens/Policy/policy.dart';
import 'package:shop_app/screens/survey.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool switchState = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Account();
                  },
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                  shape: BoxShape.rectangle),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/Bell.svg",
                    color: kPrimaryColor,
                    width: 22,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Notification',
                  ),
                  SizedBox(
                    width: 135,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Switch(
                      activeColor: Colors.blue,
                      value: switchState,
                      onChanged: (value) {
                        setState(() {
                          switchState = value;
                          print(switchState);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PolicyPage();
                  },
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FirstSurveyPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
