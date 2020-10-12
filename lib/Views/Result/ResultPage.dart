import 'package:calcdate/Business/resultBusiness.dart';
import 'package:calcdate/Business/homeBusiness.dart';
import 'package:calcdate/Template/Images.dart';
import 'package:calcdate/Template/Texts.dart';
import 'package:flutter/material.dart';
import 'package:calcdate/Template/Localization/Localizations.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var resultBusiness = Provider.of<ResultBusiness>(context);
    var homeBusiness = Provider.of<HomeBusiness>(context);

    String resultado(Map<String, int> results) {
      var year;
      var motnh;
      var day;
      var auxMonth;
      var auxDay;

      if (results['Years'] == 1) {
        year = "${results['Years']}" +
            " " +
            Translate.of(context).key("Year Singular - ResultPage");
        auxMonth = " ${Translate.of(context).key("Date Aux - ResultPage")} ";
        auxDay = " ${Translate.of(context).key("Date Aux - ResultPage")} ";
      } else if (results['Years'] > 1) {
        year = "${results['Years']}" +
            " " +
            Translate.of(context).key("Year Plural - ResultPage");
        auxMonth = " ${Translate.of(context).key("Date Aux - ResultPage")} ";
        auxDay = " ${Translate.of(context).key("Date Aux - ResultPage")} ";
      } else if (results['Years'] == 0) {
        auxMonth = "";
        auxDay = "";
        year = "";
      }

      if (results['Months'] == 1) {
        motnh = "$auxMonth" +
            "${results['Months']}" +
            " " +
            Translate.of(context).key("Month Singular - ResultPage");
        auxDay = " ${Translate.of(context).key("Date Aux - ResultPage")} ";
      } else if (results['Months'] > 1) {
        motnh = "$auxMonth" +
            "${results['Months']}" +
            " " +
            Translate.of(context).key("Month Plural - ResultPage");
        auxDay = " ${Translate.of(context).key("Date Aux - ResultPage")} ";
      } else if (results['Months'] == 0) {
        motnh = "";
      }

      if (results['Days'] == 1) {
        day = "$auxDay" +
            "${results['Days']}" +
            " " +
            Translate.of(context).key("Day Singular - ResultPage");
      } else if (results['Days'] > 1) {
        day = "$auxDay" +
            "${results['Days']}" +
            " " +
            Translate.of(context).key("Day Plural - ResultPage");
      } else if (results['Days'] == 0) {
        auxDay = "";
        day = "";
      }

      return "$year" + "$motnh" + "$day";
    }

    return Scaffold(
        body: Center(
            child: Stack(children: <Widget>[
      Stack(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 22.0),
            child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.settings,
                  size: 40,
                ))),
        SingleChildScrollView(
            child: Column(
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
                              resultBusiness.results['Years'].toString(),
                              textAlign: TextAlign.center,
                              style: TextTemplate.textFirstBold,
                            ),
                          ),
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
                              resultBusiness.results['Months'].toString(),
                              textAlign: TextAlign.center,
                              style: TextTemplate.textFirstBold,
                            ),
                          ),
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
                                resultBusiness.results['Days'].toString(),
                                textAlign: TextAlign.center,
                                style: TextTemplate.textFirstBold,
                              )),
                        ]),
                      ])),
              Text(
                resultado(resultBusiness.results).toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 18.0,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 25, top: 45, bottom: 5.0),
                  child: Text(
                      "${Translate.of(context).key("EntryDate 1 - HomePage")}: ${homeBusiness.inputOne}",
                      textAlign: TextAlign.left,
                      style: TextTemplate.textSecondBold)),
              Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                      "${Translate.of(context).key("EntryDate 2 - HomePage")}: ${homeBusiness.inputTwo}",
                      textAlign: TextAlign.left,
                      style: TextTemplate.textSecondBold)),
            ]))
      ]),
    ])));
  }
}
