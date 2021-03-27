import 'package:flutter/material.dart';
import 'package:shop_app/screens/See More/componeny/body.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopularProducts(),
    );
  }
}
