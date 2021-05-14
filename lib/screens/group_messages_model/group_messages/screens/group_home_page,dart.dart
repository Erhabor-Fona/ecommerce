import 'package:flutter/material.dart';
import 'package:shop_app/screens/group_messages_model/group_messages/components/body.dart';

class GroupHomePage extends StatefulWidget {
  static String routeName = "/group_home_page.dart";
  @override
  _GroupHomePageState createState() => _GroupHomePageState();
}

class _GroupHomePageState extends State<GroupHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body()
        //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.message),
        );
  }
}
