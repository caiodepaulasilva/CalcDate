import 'package:CalcDate/pages/menus/aboutMenu.dart';
import 'package:CalcDate/pages/components/inputDate.dart';
import 'package:flutter/material.dart';
import 'package:CalcDate/localization/localizations.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 5),
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    _settingModalBottomSheet(context);
                  },
                )),
          ]),
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
                          "lib/images/logo.png",
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

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 340,
            color: Colors.yellowAccent[400],
            // foregroundDecoration: BoxDecoration(color: Colors.yellowAccent[400]),
            child: new ListView(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(
                      Icons.date_range,
                      color: Colors.black,
                    ),
                    title: new Text(
                      'Date',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    subtitle: Text(
                      'calculate in days, months and years',
                    ),
                    trailing: DecoratedBox(
                        child: Icon(Icons.check), decoration: BoxDecoration()),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.access_time, color: Colors.black45),
                  title: new Text(
                    'Time',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  subtitle: Text(
                    'calculate in hours, minutes and seconds',
                  ),
                  trailing:
                      DecoratedBox(child: null, decoration: BoxDecoration()),
                  onTap: () => {},
                ),
                new ListTile(
                  leading: new Icon(Icons.event_busy),
                  title: new Text(
                    'Work days',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  subtitle: Text(
                    'calculate any work days',
                  ),
                  trailing:
                      DecoratedBox(child: null, decoration: BoxDecoration()),
                  onTap: () => {},
                ),
                new ListTile(
                  leading: new Icon(Icons.filter_7),
                  title: new Text(
                    'Weeks',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  subtitle: Text(
                    'calculate based in a day of week',
                  ),
                  trailing:
                      DecoratedBox(child: null, decoration: BoxDecoration()),
                  onTap: () => {},
                ),
                new ListTile(
                  leading: new Icon(Icons.help_outline),
                  title: new Text(
                    'About application',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    showDialog(
                        context: context, builder: (context) => AboutMenu());
                  },
                ),
              ],
            ),
          );
        });
  }
}
