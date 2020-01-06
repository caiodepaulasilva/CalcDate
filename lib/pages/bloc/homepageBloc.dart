import 'dart:async';
import 'package:flutter/material.dart';
import 'package:CalcDate/localization/localizations.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:CalcDate/pages/view/components/aboutMenu.dart';

class MenuController implements BlocBase {
  String resource = '';
  List<Widget> checkTile = [Icon(Icons.check), null, null, null];

  var _resourceController = StreamController();
  Sink get input => _resourceController.sink;
  Stream get output => _resourceController.stream;

  void onButtonPressed(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.yellowAccent[400],
            height: 350,
            child: Container(
              child: buildBottomNavigationMenu(context),
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

  Column buildBottomNavigationMenu(context) {
    if (resource == MyLocalizations.of(context).trans('Menu Title - Date')) {
      checkTile = [Icon(Icons.check), null, null, null];
    } else if (resource ==
        MyLocalizations.of(context).trans('Menu Title - Time')) {
      checkTile = [null, Icon(Icons.check), null, null];
    } else if (resource ==
        MyLocalizations.of(context).trans('Menu Title - Work day')) {
      checkTile = [null, null, Icon(Icons.check), null];
    } else if (resource ==
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
                  selectItem(context,
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
            selectItem(
                context, MyLocalizations.of(context).trans('Menu Title - Time'))
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
            selectItem(context,
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
            selectItem(context,
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
            selectItem(context, '');
            showDialog(context: context, builder: (context) => AboutMenu());
          },
        ),
      ],
    );
  }

  void selectItem(context, String name) {
    Navigator.pop(context);
    resource = name;
    input.add(resource);
  }

  @override
  void dispose() => _resourceController.close();

  @override
  void addListener(listener) {}

  @override
  bool get hasListeners => null;

  @override
  void notifyListeners() {}

  @override
  void removeListener(listener) {}
}
