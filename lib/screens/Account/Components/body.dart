import 'package:flutter/material.dart';
import 'package:shop_app/components/password_fields.dart';
import 'package:shop_app/components/rounded_input_field.dart';

class MainProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Source sans pro',
            letterSpacing: 3.5,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 90.0,
              ),
              RoundedInputField(
                hintText: "Fona",
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "08185415188",
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "osaofonaerhabor@gmail.com",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
            ]),
      ),
    );
  }
}
