import 'package:calcdate/Template/Images.dart';
import 'package:calcdate/Template/InfoMenu.dart';
import 'package:calcdate/Template/Localization/Localizations.dart';
import 'package:calcdate/Views/Home/Components/Calculate.dart';
import 'package:calcdate/Views/Home/Components/InputOne.dart';
import 'package:calcdate/Views/Home/Components/InputTwo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Logo(),
              Padding(
                  padding: EdgeInsets.only(left: 30.0, bottom: 10.0),
                  child: Text(Translate.of(context).key('Text - HomePage'),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
              InputOne(),
              InputTwo(),
              Calculate(),
              InfoMenu(),
            ]));
  }
}
