import 'package:flutter/material.dart';
import 'package:shop_app/screens/Notification/components/body.dart';

class NotificationPage extends StatefulWidget {
  static String routeName = "/notification";
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
