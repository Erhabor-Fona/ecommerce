import 'package:flutter/material.dart';

class UnlikedIcon extends StatefulWidget {
  UnlikedIcon({Key key}) : super(key: key);
  @override
  _UnlikedIconState createState() => _UnlikedIconState();
}

class _UnlikedIconState extends State<UnlikedIcon> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_border,
      color: Colors.red[500],
    );
  }
}
