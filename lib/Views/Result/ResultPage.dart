import 'package:calcdate/Business/CalculateBusiness.dart';
import 'package:flutter/material.dart';
import 'package:calcdate/Template/Localization/Localizations.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var calculateBusiness = Provider.of<CalculateStore>(context);

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
                        "lib/Assets/images/logo.png",
                        width: 180,
                        height: 180,
                      ))),
              Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(Translate.of(context).key("Text - ResultPage"),
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
                                Translate.of(context)
                                    .key("Year Title - ResultPage"),
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
                                calculateBusiness.results['Years'].toString(),
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
                                Translate.of(context)
                                    .key("Month Title - ResultPage"),
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
                                calculateBusiness.results['Months'].toString(),
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
                                Translate.of(context)
                                    .key("Day Title - ResultPage"),
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
                                calculateBusiness.results['Days'].toString(),
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
                resultado(calculateBusiness.results).toString(),
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
