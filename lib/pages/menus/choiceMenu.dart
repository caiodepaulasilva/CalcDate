import 'package:flutter/material.dart';
import 'package:dateCalculator/pages/menus/calendarMenu.dart';
import 'package:dateCalculator/localization/localizations.dart';

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
                Expanded(
                  flex: 1,
                  child: Container(
                      width: 170,
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
                              style: TextStyle(fontSize: 12.25)),
                          onPressed: () {
                            inputData(1);
                          })),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                Container(
                    width: 100,
                    child: Text(
                      "Ex: 2019",
                      style: (TextStyle(fontSize: 12)),
                    ))
              ]),
              Row(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 170,
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
                            style: TextStyle(fontSize: 12.25)),
                        onPressed: () {
                          inputData(2);
                        }),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                Container(
                    width: 100,
                    child: Text(
                      "Ex: 12/2019",
                      style: (TextStyle(fontSize: 12)),
                    )),
              ]),
              Row(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                      width: 170,
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
                              style: TextStyle(fontSize: 12.25)),
                          onPressed: () {
                            inputData(3);
                          })),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                Container(
                    width: 100,
                    child: Text(
                      "Ex: 10/12/2019",
                      style: (TextStyle(fontSize: 12)),
                    ))
              ])
            ]));
  }
}
