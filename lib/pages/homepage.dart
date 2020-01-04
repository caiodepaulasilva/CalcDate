import 'package:CalcDate/pages/components/inputDate.dart';
import 'package:flutter/material.dart';
import 'package:CalcDate/localization/localizations.dart';
import 'package:CalcDate/pages/components/services.dart';
import 'package:CalcDate/pages/menus/aboutMenu.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedItem = '';
  List<Widget> checkTile =  [Icon(Icons.check), null, null, null];

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
                    _onButtonPressed();
                  },
                )),
            Container(
                padding: EdgeInsets.only(bottom: 12),
                alignment: Alignment.bottomCenter,
                child: Text(_selectedItem,
                    style: TextStyle(fontSize: 20, color: Colors.white)))
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

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.yellowAccent[400],
            height: 350,
            child: Container(
              child: _buildBottomNavigationMenu(),
              decoration: BoxDecoration(
                color: Colors.yellowAccent[400],
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
              ),
            ),
          );
        });
  }

  Column _buildBottomNavigationMenu() {
    if (_selectedItem ==
        MyLocalizations.of(context).trans('Menu Title - Date')) {
      checkTile = [Icon(Icons.check), null, null, null];
    }
    if (_selectedItem ==
        MyLocalizations.of(context).trans('Menu Title - Time')) {
      checkTile = [null, Icon(Icons.check), null, null];
    }
    if (_selectedItem ==
        MyLocalizations.of(context).trans('Menu Title - Work day')) {
      checkTile = [null, null, Icon(Icons.check), null];
    }
    if (_selectedItem ==
        MyLocalizations.of(context).trans('Menu Title - Week day')) {
      checkTile = [null, null, null, Icon(Icons.check)];
    }

    return Column(
      children: <Widget>[
        new ListTile(
            leading: new Icon(
              Icons.date_range,
              color: Colors.black,
            ),
            title: new Text(
              MyLocalizations.of(context).trans('Menu Title - Date'),
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            subtitle: Text(
              MyLocalizations.of(context).trans('Menu Subtitle - Date'),
            ),
            trailing:
                DecoratedBox(child: checkTile[0], decoration: BoxDecoration()),
            onTap: () => {
                  _selectItem(
                      MyLocalizations.of(context).trans('Menu Title - Date'))
                }),
        new ListTile(
          leading: new Icon(Icons.access_time, color: Colors.black45),
          title: new Text(
            MyLocalizations.of(context).trans('Menu Title - Time'),
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          subtitle: Text(
            MyLocalizations.of(context).trans('Menu Subtitle - Time'),
          ),
          trailing:
              DecoratedBox(child: checkTile[1], decoration: BoxDecoration()),
          onTap: () => {
            _selectItem(MyLocalizations.of(context).trans('Menu Title - Time'))
          },
        ),
        new ListTile(
          leading: new Icon(Icons.event_busy),
          title: new Text(
            MyLocalizations.of(context).trans('Menu Title - Work day'),
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          subtitle: Text(
            MyLocalizations.of(context).trans('Menu Subtitle - Work day'),
          ),
          trailing:
              DecoratedBox(child: checkTile[2], decoration: BoxDecoration()),
          onTap: () => {
            _selectItem(
                MyLocalizations.of(context).trans('Menu Title - Work day'))
          },
        ),
        new ListTile(
          leading: new Icon(Icons.filter_7),
          title: new Text(
            MyLocalizations.of(context).trans('Menu Title - Week day'),
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          subtitle: Text(
            MyLocalizations.of(context).trans('Menu Subtitle - Week day'),
          ),
          trailing:
              DecoratedBox(child: checkTile[3], decoration: BoxDecoration()),
          onTap: () => {
            _selectItem(
                MyLocalizations.of(context).trans('Menu Title - Week day'))
          },
        ),
        new ListTile(
          leading: new Icon(Icons.help_outline),
          title: new Text(
            MyLocalizations.of(context).trans('Menu Title - About'),
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          onTap: () {
            _selectItem('');
            showDialog(context: context, builder: (context) => AboutMenu());
          },
        ),
      ],
    );
  }

  void _selectItem(String name) {
    Navigator.pop(context);
    setState(() {
      _selectedItem = name;
    });
  }
}
