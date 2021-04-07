import 'package:flutter/material.dart';

class LikedIcon extends StatefulWidget {
  LikedIcon({Key key}) : super(key: key);
  @override
  _LikedIconState createState() => _LikedIconState();
}

class _LikedIconState extends State<LikedIcon> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: Colors.red[500],
    );
  }
}
