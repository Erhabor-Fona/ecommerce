import 'package:flutter/material.dart';
import 'package:shop_app/screens/profile/components/profile_menu.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ProfileMenu(
              text: "a new buyer just joined in on this purchase",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "this user declined you interest  to collaborate",
              icon: "assets/icons/bell.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
