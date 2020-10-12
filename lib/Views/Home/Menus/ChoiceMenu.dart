import 'package:calcdate/Business/homeBusiness.dart';
import 'package:calcdate/Template/Colors.dart';
import 'package:calcdate/Template/Localization/Localizations.dart';
import 'package:calcdate/Template/Texts.dart';
import 'package:calcdate/Views/Home/Menus/CalendarMenu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoiceMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var homeBusiness = Provider.of<HomeBusiness>(context);

    return AlertDialog(
        title: Text(Translate.of(context).key("Text - DialogPrecision")),
        content: Container(
            width: 400,
            height: 200,
            decoration: BoxDecoration(color: Colors.white),
            child: new Column(children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 3.0),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            highlightColor: ColorTemplate.buttonFirst,
                            disabledElevation: 5,
                            child: Text(
                                Translate.of(context)
                                    .key("Button 1 - DialogPrecision"),
                                style: TextTemplate.textSecond),
                            onPressed: () async {
                              homeBusiness.precision = 1;
                              Navigator.pop(
                                  context,
                                  await showDialog(
                                      context: context,
                                      builder: (context) => CalendarMenu()));
                            }))),
              ]),
              Row(children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 3.0),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            highlightColor: ColorTemplate.buttonFirst,
                            disabledElevation: 5,
                            child: Text(
                                Translate.of(context)
                                    .key("Button 2 - DialogPrecision"),
                                style: TextTemplate.textSecond),
                            onPressed: () async {
                              homeBusiness.precision = 2;
                              Navigator.pop(
                                  context,
                                  await showDialog(
                                      context: context,
                                      builder: (context) => CalendarMenu()));
                            })))
              ]),
              Row(children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 3.0),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            highlightColor: ColorTemplate.buttonFirst,
                            disabledElevation: 5,
                            child: Text(
                                Translate.of(context)
                                    .key("Button 3 - DialogPrecision"),
                                style: TextTemplate.textSecond),
                            onPressed: () async {
                              homeBusiness.precision = 3;
                              Navigator.pop(
                                  context,
                                  await showDialog(
                                      context: context,
                                      builder: (context) => CalendarMenu()));
                            })))
              ]),
            ])));
  }
}
