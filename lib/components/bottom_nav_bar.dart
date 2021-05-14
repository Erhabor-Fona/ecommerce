/// Flutter code sample for BottomNavigationBar
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/group_messages_model/group_messages/screens/group_home_page,dart.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/pledge/pledge.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';

class CustomNavBar extends StatefulWidget {
  static String routeName = "/bottom_nav_bar.dart";
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  PageController _pageController = PageController();
  List<Widget> _screen = [
    HomeScreen(),
    PledgeScreen(),
    GroupHomePage(),
    ProfileScreen()
  ];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimaryColor,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              color: _selectedIndex == 0 ? kPrimaryColor : Colors.black45,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Heart Icon.svg",
              color: _selectedIndex == 1 ? kPrimaryColor : Colors.black45,
            ),
            label: 'Pledge',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Chat bubble Icon.svg",
              color: _selectedIndex == 2 ? kPrimaryColor : Colors.black45,
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              color: _selectedIndex == 3 ? kPrimaryColor : Colors.black45,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
