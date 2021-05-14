import 'package:flutter/material.dart';
import 'package:shop_app/screens/Account/Components/body.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainProfile(),
    );
  }
}
