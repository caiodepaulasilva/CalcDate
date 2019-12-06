import 'package:flutter/material.dart';
import 'package:dateCalculator/components/help.dart';
// import 'package:dateCalculator/custom_text_field.dart';

class ResultPage extends StatelessWidget {
  final results;
  ResultPage({Key key, List<int> results}) : this.results = results;

  @override
  Widget build(BuildContext context) {

    String resultado(List<int> results) {
      var ano;
      var mes;
      var dia;
      var auxMes = " ${(  "e")} ";
      var auxDia = " ${(  "e")} ";

      if (results[3] == 1) {
        ano = "${results[3]}" + " " +(  "ano");
      } else if (results[3] > 1) {
        ano = "${results[3]}" + " " +(  "anos");
      } else if (results[3] == 0) {
        auxMes = "";
        ano = "";
      }

      if (results[4] == 1) {
        mes = "$auxMes" + "${results[4]}" + " " +(  "mês");
      } else if (results[4] > 1) {
        mes = "$auxMes" + "${results[4]}" + " " +(  "meses");
      } else if (results[4] == 0) {
        auxDia = "";
        mes = "";
      }

      if (results[5] == 1) {
        dia = "$auxDia" + "${results[5]}" + " " +(  "dia");
      } else if (results[5] > 1) {
        dia = "$auxDia" + "${results[5]}" + " " +(  "dias");
      } else if (results[5] == 0) {
        dia = "";
      }

      return "$ano" + "$mes" + "$dia";
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
                        "lib/images/logo.png",
                        width: 180,
                        height: 180,
                      ))),
              Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    ("Resultado:"),
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
                               ("Anos"),
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
                               ("Meses"),
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
                               ("Dias"),
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
      HelpMenu(),
    ])));
  }
}
