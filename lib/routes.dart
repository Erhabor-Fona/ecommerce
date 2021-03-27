import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/Notification/natification.dart';
import 'package:shop_app/screens/Startup Screen/startup_screen.dart';
import 'package:shop_app/screens/Story%20Building/details_screen.dart';
import 'package:shop_app/screens/before_second_survey_screen.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/group_messages_model/group_messages/screens/group_home_page,dart.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/pledge/pledge.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/second_surv_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/screens/survey.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  StartupScreen.routeName: (context) => StartupScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  //LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  StoryDetailsScreen.routeName: (context) => StoryDetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  FirstSurveyPage.routeName: (context) => FirstSurveyPage(),
  SecondSurveyPage.routeName: (context) => SecondSurveyPage(),
  PledgeScreen.routeName: (context) => PledgeScreen(),
  GroupHomePage.routeName: (context) => GroupHomePage(),
  NotificationPage.routeName: (context) => NotificationPage(),
  BeforeSecondSurveyPage.routeName: (context) => BeforeSecondSurveyPage(),
  //MyHomePage.routeName: (context) => MyHomePage()
};
