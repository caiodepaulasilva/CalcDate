import 'package:calcdate/Template/Localization/Localizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMenu extends StatefulWidget {
  @override
  _AboutMenuState createState() => _AboutMenuState();
}

class _AboutMenuState extends State<AboutMenu> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        elevation: 40,
        contentPadding:
            EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
        content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Container(
              child: Text(Translate.of(context).key("Text - TitleAbout"),
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              alignment: Alignment.topLeft),
          Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  child: Text(Translate.of(context).key("Text - DialogAbout"),
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
                            onPressed: () => _launchCoffee()))),
                Container(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                        child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            iconSize: 20,
                            icon: new Icon(FontAwesomeIcons.github),
                            onPressed: () => (_launchGithub())))),
                Container(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                        child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            iconSize: 20,
                            icon: new Icon(FontAwesomeIcons.twitter),
                            onPressed: () => (_launchTwitter())))),
              ])
        ]));
  }

  _launchTwitter() async {
    const url = "https://twitter.com/devcaiosilva";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchCoffee() async {
    const url = "https://www.buymeacoffee.com/caiosilva";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchGithub() async {
    const url = "https://github.com/caiodepaulasilva";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
