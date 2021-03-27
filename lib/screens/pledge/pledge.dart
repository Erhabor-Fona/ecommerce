import 'package:flutter/material.dart';
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/screens/pledge/componets/body.dart';

class PledgeScreen extends StatefulWidget {
  static String routeName = "/pledge.dart";
  @override
  _PledgeScreenState createState() => _PledgeScreenState();
}

class _PledgeScreenState extends State<PledgeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
