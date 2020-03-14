import 'package:flutter/material.dart';
import 'package:CalcDate/localization/localizations.dart';
import 'package:CalcDate/pages/view/components/aboutMenu.dart';

void services(context) {
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
                    MyLocalizations.of(context).trans('Menu Title - Date'),
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  subtitle: Text(
                    MyLocalizations.of(context).trans('Menu Subtitle - Date'),
                  ),
                  trailing: DecoratedBox(
                      child: Icon(Icons.check), decoration: BoxDecoration()),
                  onTap: () => {}),
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
                    DecoratedBox(child: null, decoration: BoxDecoration()),
                onTap: () => {},
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
                    DecoratedBox(child: null, decoration: BoxDecoration()),
                onTap: () => {},
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
                    DecoratedBox(child: null, decoration: BoxDecoration()),
                onTap: () => {},
              ),
              new ListTile(
                leading: new Icon(Icons.help_outline),
                title: new Text(
                  MyLocalizations.of(context).trans('Menu Title - About'),
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
