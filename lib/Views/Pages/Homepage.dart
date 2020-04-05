import 'package:calcdate/views/components/inputDate.dart';
import 'package:calcdate/views/Menus/FeatureMenu.dart';
import 'package:flutter/material.dart';
import 'package:calcdate/configuration/localization/localizations.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      floatingActionButton: featureMenu(context),
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
                          "lib/configuration/assets/images/logo.png",
                          width: 180,
                          height: 180,
                        ))),
                Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                    child: Text(
                        MyLocalizations.of(context).trans('Text - HomePage'),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
                InputDate(),
              ])),
        ]),
      ),
    );
  }
}
