import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class UsableColum extends StatefulWidget {
  final IconData icon;
  final Widget child;
  final String text;
  final Widget secondChild;
  UsableColum(
      {this.icon, this.text, @required this.child, @required this.secondChild});

  @override
  _UsableColumState createState() => _UsableColumState();
}

class _UsableColumState extends State<UsableColum> {
  bool flat = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          widget.icon,
          color: kPrimaryLightColor,
          size: 90.0,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                widget.text,
                style: kLabelTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            widget.secondChild
          ],
        ),
      ],
    );
  }
}
