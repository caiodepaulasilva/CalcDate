import 'package:flutter/material.dart';
import 'package:calcdate/views/menus/calendarMenu.dart';
import 'package:calcdate/configuration/localization/localizations.dart';

class ChoiceMenu extends StatefulWidget {
  final position;
  ChoiceMenu({Key key, int position}) : this.position = position;

  @override
  _ChoiceMenuState createState() => _ChoiceMenuState(position: this.position);
}

class _ChoiceMenuState extends State<ChoiceMenu> {
  int position;

  @override
  _ChoiceMenuState({this.position});

  Widget build(BuildContext context) {
    void inputData(int precision) async {
      DateTime date;

      date = await showDialog(
        context: context,
        builder: (
          context,
        ) =>
            DatePickerMenu(precision: precision, position: position),
      );

      Navigator.pop(context, {'precision': precision, 'date': date});
    }

    return AlertDialog(
        title: Text(
          MyLocalizations.of(context).trans("Text - DialogPrecision"),
        ),
        content: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                SizedBox(
                    width: 148,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        disabledColor: Colors.yellowAccent[400],
                        hoverColor: Colors.yellowAccent[400],
                        focusColor: Colors.yellowAccent[400],
                        highlightColor: Colors.yellowAccent[400],
                        disabledTextColor: Colors.black,
                        disabledElevation: 5,
                        child: Text(
                            MyLocalizations.of(context)
                                .trans("Button 1 - DialogPrecision"),
                            style: TextStyle(fontSize: 11)),
                        onPressed: () {
                          inputData(1);
                        })),
                Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Ex: 2019",
                      style: (TextStyle(fontSize: 11)),
                    ))
              ]),
              Row(children: <Widget>[
                SizedBox(
                  width: 148,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      disabledColor: Colors.yellowAccent[400],
                      hoverColor: Colors.yellowAccent[400],
                      focusColor: Colors.yellowAccent[400],
                      highlightColor: Colors.yellowAccent[400],
                      disabledTextColor: Colors.black,
                      disabledElevation: 5,
                      child: Text(
                          MyLocalizations.of(context)
                              .trans("Button 2 - DialogPrecision"),
                          style: TextStyle(fontSize: 11)),
                      onPressed: () {
                        inputData(2);
                      }),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Ex: 11/2019",
                      style: (TextStyle(fontSize: 11)),
                    )),
              ]),
              Row(children: <Widget>[
                SizedBox(
                    width: 148,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        disabledColor: Colors.yellowAccent[400],
                        hoverColor: Colors.yellowAccent[400],
                        focusColor: Colors.yellowAccent[400],
                        highlightColor: Colors.yellowAccent[400],
                        disabledTextColor: Colors.black,
                        disabledElevation: 5,
                        child: Text(
                            MyLocalizations.of(context)
                                .trans("Button 3 - DialogPrecision"),
                            style: TextStyle(fontSize: 11)),
                        onPressed: () {
                          inputData(3);
                        })),
                Padding(padding: EdgeInsets.symmetric(horizontal: 3.0)),
                Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Ex: 10/11/2019",
                      style: (TextStyle(fontSize: 11)),
                    ))
              ])
            ]));
  }
}
