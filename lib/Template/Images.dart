import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 50, bottom: 30),
        child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              "lib/Assets/images/logo.png",
              width: 180,
              height: 180,
            )));
  }
}
