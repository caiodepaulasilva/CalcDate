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
    {
      return Scaffold(
        floatingActionButton: new Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[]),
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Stack(children: <Widget>[
            Container(
              color: Colors.black,
            ),
            SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 30),
                      child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "lib/Assets/images/logo.png",
                            width: 180,
                            height: 180,
                          ))),
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
                  Calculate()
                ])),
          ]),
        ),
      );
    }
  }
}
