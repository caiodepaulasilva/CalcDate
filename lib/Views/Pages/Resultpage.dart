import 'package:flutter/material.dart';
import 'package:calcdate/configuration/localization/localizations.dart';

class ResultPage extends StatefulWidget {
  final results;
  ResultPage({Key key, List<int> results}) : this.results = results;

  @override
  State<StatefulWidget> createState() => _ResultPageState(results: results);
}

class _ResultPageState extends State<ResultPage> {
  final List<int> results;

  _ResultPageState({this.results});

  @override
  Widget build(BuildContext context) {
    String resultado(List<int> results) {
      var year;
      var motnh;
      var day;
      var auxMonth;
      var auxDay;

      if (results[3] == 1) {
        year = "${results[3]}" +
            " " +
            MyLocalizations.of(context).trans("Year Singular - ResultPage");
        auxMonth =
            " ${MyLocalizations.of(context).trans("Date Aux - ResultPage")} ";
        auxDay =
            " ${MyLocalizations.of(context).trans("Date Aux - ResultPage")} ";
      } else if (results[3] > 1) {
        year = "${results[3]}" +
            " " +
            MyLocalizations.of(context).trans("Year Plural - ResultPage");
        auxMonth =
            " ${MyLocalizations.of(context).trans("Date Aux - ResultPage")} ";
        auxDay =
            " ${MyLocalizations.of(context).trans("Date Aux - ResultPage")} ";
      } else if (results[3] == 0) {
        auxMonth = "";
        auxDay = "";
        year = "";
      }

      if (results[4] == 1) {
        motnh = "$auxMonth" +
            "${results[4]}" +
            " " +
            MyLocalizations.of(context).trans("Month Singular - ResultPage");
        auxDay =
            " ${MyLocalizations.of(context).trans("Date Aux - ResultPage")} ";
      } else if (results[4] > 1) {
        motnh = "$auxMonth" +
            "${results[4]}" +
            " " +
            MyLocalizations.of(context).trans("Month Plural - ResultPage");
        auxDay =
            " ${MyLocalizations.of(context).trans("Date Aux - ResultPage")} ";
      } else if (results[4] == 0) {
        motnh = "";
      }

      if (results[5] == 1) {
        day = "$auxDay" +
            "${results[5]}" +
            " " +
            MyLocalizations.of(context).trans("Day Singular - ResultPage");
      } else if (results[5] > 1) {
        day = "$auxDay" +
            "${results[5]}" +
            " " +
            MyLocalizations.of(context).trans("Day Plural - ResultPage");
      } else if (results[5] == 0) {
        auxDay = "";
        day = "";
      }

      return "$year" + "$motnh" + "$day";
    }

    return Scaffold(
        body: Center(
            child: Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black, Colors.black])),
      ),
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
              Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 30),
                  child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "lib/configuration/assets/images/logo.png",
                        width: 180,
                        height: 180,
                      ))),
              Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                      MyLocalizations.of(context).trans("Text - ResultPage"),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white))),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Table(
                      columnWidths: {
                        1: FixedColumnWidth(140),
                        2: FixedColumnWidth(80)
                      },
                      border: TableBorder.all(width: 2.0, color: Colors.white),
                      children: [
                        TableRow(children: [
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 4, left: 8, bottom: 4),
                              child: Text(
                                MyLocalizations.of(context)
                                    .trans("Year Title - ResultPage"),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 4, bottom: 4),
                              child: Text(
                                results[0].toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22.0,
                                ),
                              )),
                        ]),
                        TableRow(children: [
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 4, left: 8, bottom: 4),
                              child: Text(
                                MyLocalizations.of(context)
                                    .trans("Month Title - ResultPage"),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 4, bottom: 4),
                              child: Text(
                                results[1].toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22.0,
                                ),
                              )),
                        ]),
                        TableRow(children: [
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 4, left: 8, bottom: 4),
                              child: Text(
                                MyLocalizations.of(context)
                                    .trans("Day Title - ResultPage"),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0,
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 4, bottom: 4),
                              child: Text(
                                results[2].toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22.0,
                                ),
                              )),
                        ]),
                      ])),
              Text(
                resultado(results),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 17.0,
                ),
              )
            ]))
      ]),
    ])));
  }
}
