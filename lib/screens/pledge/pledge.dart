import 'package:flutter/material.dart';
// import 'package:shop_app/screens/pledge/componets/body.dart';
import 'package:shop_app/screens/pledge/componets/popular_product.dart';

class PledgeScreen extends StatefulWidget {
  static String routeName = "/pledge.dart";
  @override
  _PledgeScreenState createState() => _PledgeScreenState();
}

class _PledgeScreenState extends State<PledgeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopularProducts(),
      //Body(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
