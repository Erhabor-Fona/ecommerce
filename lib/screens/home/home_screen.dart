import 'package:flutter/material.dart';

import './components/popular_product.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopularProducts(),
      //  bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
