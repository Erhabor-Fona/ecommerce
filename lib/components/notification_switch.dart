import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';

class Notification extends StatefulWidget {
  const Notification({
    @required this.icon,
  });

  final String icon;

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  bool switchState = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            widget.icon,
            color: kPrimaryColor,
            width: 22,
          ),
          SizedBox(width: 20),
          Expanded(
            child: SwitchListTile(
              activeColor: kPrimaryColor,
              value: switchState,
              onChanged: (value) {
                setState(
                  () {
                    switchState = value;
                    print(switchState);
                  },
                );
              },
              title: Text(
                'Notification',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
