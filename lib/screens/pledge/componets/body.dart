import 'package:flutter/material.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                child: CircleAvatar(
                  radius: 55.0,
                  backgroundImage: AssetImage('assets/icons/favourite.png'),
                ),
              ),
            ),
            Text(
              'Your Favourite Property Will Appear Here',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
