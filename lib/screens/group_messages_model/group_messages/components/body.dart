import 'package:flutter/material.dart';
import 'package:shop_app/screens/group_messages_model/group_messages/components/group_chat.dart';

class Body extends StatefulWidget {
  final List<String> list = List.generate(10, (index) => "Text $index");
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          // CategorySelector(),
          SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  // CategorySelector(),
                  RecentGroupChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
