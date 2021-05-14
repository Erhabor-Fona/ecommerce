import 'package:flutter/material.dart';
import 'package:shop_app/components/splash_screen.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

class StartupScreen extends StatelessWidget {
  static String routeName = "/startup_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStartupScaffoldColor,
      body: AnimatedSplash(
        imagePath: 'assets/images/unsplash6.png',
        home: SplashScreen(),
        duration: 5000, //in milliseconds
        type: AnimatedSplashType.StaticDuration,
      ),
    );
  }
}
