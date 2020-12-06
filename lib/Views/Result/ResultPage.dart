import 'package:calcdate/Business/resultBusiness.dart';
import 'package:calcdate/Template/Images.dart';
import 'package:calcdate/Template/Texts.dart';
import 'package:flutter/material.dart';
import 'package:calcdate/Template/Localization/Localizations.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var resultBusiness = Provider.of<ResultBusiness>(context);
    var message = resultBusiness.message(context, resultBusiness.result);

    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Logo(),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Table(
                      columnWidths: {
                        1: FixedColumnWidth(160),
                        2: FixedColumnWidth(80)
                      },
                      border: TableBorder.all(width: 2.0, color: Colors.white),
                      children: [
                        TableRow(children: [
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 4, left: 8, bottom: 4),
                              child: Text(
                                  Translate.of(context)
                                      .key("Year Title - ResultPage"),
                                  textAlign: TextAlign.start,
                                  style: TextTemplate.textSecondBold)),
                          Padding(
                              padding: EdgeInsets.only(top: 4, bottom: 4),
                              child: Text(
                                  resultBusiness.result.totalYears.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextTemplate.textFirstBold))
                        ]),
                        TableRow(children: [
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 4, left: 8, bottom: 4),
                              child: Text(
                                  Translate.of(context)
                                      .key("Month Title - ResultPage"),
                                  textAlign: TextAlign.start,
                                  style: TextTemplate.textSecondBold)),
                          Padding(
                              padding: EdgeInsets.only(top: 4, bottom: 4),
                              child: Text(
                                  resultBusiness.result.totalMonths.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextTemplate.textFirstBold))
                        ]),
                        TableRow(children: [
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 4, left: 8, bottom: 4),
                              child: Text(
                                  Translate.of(context)
                                      .key("Day Title - ResultPage"),
                                  textAlign: TextAlign.start,
                                  style: TextTemplate.textSecondBold)),
                          Padding(
                              padding: EdgeInsets.only(top: 4, bottom: 4),
                              child: Text(
                                  resultBusiness.result.totalDays.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextTemplate.textFirstBold))
                        ])
                      ])),
              Text(message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                  )),
            ]));
  }
}
