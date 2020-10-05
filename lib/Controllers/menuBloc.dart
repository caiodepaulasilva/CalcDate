import 'dart:async';
import 'package:flutter/material.dart';
import 'package:calcdate/configuration/localization/localizations.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:calcdate/views/menus/aboutMenu.dart';

class MenuController implements BlocBase {
  String resource = '';
  List<Widget> checkResource = [Icon(Icons.check), null, null, null];

  var _menuController = StreamController();
  Sink get input => _menuController.sink;
  Stream get output => _menuController.stream;

  void onButtonPressed(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.yellowAccent[400],
            height: 290,
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
      checkResource = [Icon(Icons.check), null, null, null];
    } else if (resource ==
        MyLocalizations.of(context).trans('Menu Title - Time')) {
      checkResource = [null, Icon(Icons.check), null, null];
    } else if (resource ==
        MyLocalizations.of(context).trans('Menu Title - Work day')) {
      checkResource = [null, null, Icon(Icons.check), null];
    } else if (resource ==
        MyLocalizations.of(context).trans('Menu Title - Week day')) {
      checkResource = [null, null, null, Icon(Icons.check)];
    }

    return Column(
      children: <Widget>[
        Container(
          height: 57,
          child: ListTile(
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
              trailing: DecoratedBox(
                  child: checkResource[0], decoration: BoxDecoration()),
              onTap: () => {
                    selectItem(context,
                        MyLocalizations.of(context).trans('Menu Title - Date'))
                  }),
        ),
        Container(
          height: 57,
          child: ListTile(
            leading: new Icon(Icons.access_time, color: Colors.black45),
            title: new Text(
              MyLocalizations.of(context).trans('Menu Title - Time'),
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            subtitle: Text(
              MyLocalizations.of(context).trans('Menu Subtitle - Time'),
            ),
            trailing: DecoratedBox(
                child: checkResource[1], decoration: BoxDecoration()),
            onTap: () => {
              selectItem(context,
                  MyLocalizations.of(context).trans('Menu Title - Time'))
            },
          ),
        ),
        Container(
            height: 57,
            child: new ListTile(
              leading: new Icon(Icons.event_busy),
              title: new Text(
                MyLocalizations.of(context).trans('Menu Title - Work day'),
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              subtitle: Text(
                MyLocalizations.of(context).trans('Menu Subtitle - Work day'),
              ),
              trailing: DecoratedBox(
                  child: checkResource[2], decoration: BoxDecoration()),
              onTap: () => {
                selectItem(context,
                    MyLocalizations.of(context).trans('Menu Title - Work day'))
              },
            )),
        Container(
            height: 57,
            child: ListTile(
              leading: new Icon(Icons.filter_7),
              title: new Text(
                MyLocalizations.of(context).trans('Menu Title - Week day'),
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              subtitle: Text(
                MyLocalizations.of(context).trans('Menu Subtitle - Week day'),
              ),
              trailing: DecoratedBox(
                  child: checkResource[3], decoration: BoxDecoration()),
              onTap: () => {
                selectItem(context,
                    MyLocalizations.of(context).trans('Menu Title - Week day'))
              },
            )),
        Container(
          height: 57,
          child: ListTile(
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
        )
      ],
    );
  }

  void selectItem(context, String name) {
    Navigator.pop(context);
    resource = name;
    input.add(resource);
  }

  @override
  void dispose() => _menuController.close();

  @override
  void addListener(listener) {}

  @override
  bool get hasListeners => null;

  @override
  void notifyListeners() {}

  @override
  void removeListener(listener) {}
}
