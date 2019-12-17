import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dateCalculator/localization/localizations.dart';

class AboutMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 40,
      contentPadding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              child: Text(MyLocalizations.of(context).trans("Text - TitleAbout"),
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              alignment: Alignment.topLeft),
          Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  child: Text(
                      MyLocalizations.of(context).trans("Text - DialogAbout"),
                      style: TextStyle(color: Colors.black, fontSize: 16.0)),
                  padding: EdgeInsets.only(top: 20))),
          Padding(padding: EdgeInsets.only(bottom: 1)),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                        child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            iconSize: 20,
                            // Use the FontAwesomeIcons class for the IconData
                            icon: new Icon(FontAwesomeIcons.coffee),
                            onPressed: () {}))),
                Container(
                    alignment: Alignment.bottomLeft,
                    child: InkWell(
                        child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      iconSize: 20,
                      // Use the FontAwesomeIcons class for the IconData
                      icon: new Icon(FontAwesomeIcons.instagram),
                      onPressed: () {},
                    ))),
                Container(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                        child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            iconSize: 20,
                            // Use the FontAwesomeIcons class for the IconData
                            icon: new Icon(FontAwesomeIcons.github),
                            onPressed: () {}))),
              ]),
        ],
      ),
    );
  }
}
