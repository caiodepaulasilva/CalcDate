import 'dart:async';
import 'package:CalcDate/configuration/localization/localizations.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class ResultsController implements BlocBase {
  List<int> results = [1,2,3,4];
  String textResult = '';

  var _resultsController = StreamController();
  Sink get input => _resultsController.sink;
  Stream get output => _resultsController.stream;

  ResultsController() {
    input.add(results);

    var year;
    var motnh;
    var day;
    var auxMonth;
    var auxDay;

    if (results[3] == 1) {
      year = "${results[3]}" +
          " " +
          MyLocalizations.of(null).trans("Year Singular - ResultPage");
      auxMonth = " ${MyLocalizations.of(null).trans("Date Aux - ResultPage")} ";
      auxDay = " ${MyLocalizations.of(null).trans("Date Aux - ResultPage")} ";
    } else if (results[3] > 1) {
      year = "${results[3]}" +
          " " +
          MyLocalizations.of(null).trans("Year Plural - ResultPage");
      auxMonth = " ${MyLocalizations.of(null).trans("Date Aux - ResultPage")} ";
      auxDay = " ${MyLocalizations.of(null).trans("Date Aux - ResultPage")} ";
    } else if (results[3] == 0) {
      auxMonth = "";
      auxDay = "";
      year = "";
    }

    if (results[4] == 1) {
      motnh = "$auxMonth" +
          "${results[4]}" +
          " " +
          MyLocalizations.of(null).trans("Month Singular - ResultPage");
      auxDay = " ${MyLocalizations.of(null).trans("Date Aux - ResultPage")} ";
    } else if (results[4] > 1) {
      motnh = "$auxMonth" +
          "${results[4]}" +
          " " +
          MyLocalizations.of(null).trans("Month Plural - ResultPage");
      auxDay = " ${MyLocalizations.of(null).trans("Date Aux - ResultPage")} ";
    } else if (results[4] == 0) {
      motnh = "";
    }

    if (results[5] == 1) {
      day = "$auxDay" +
          "${results[5]}" +
          " " +
          MyLocalizations.of(null).trans("Day Singular - ResultPage");
    } else if (results[5] > 1) {
      day = "$auxDay" +
          "${results[5]}" +
          " " +
          MyLocalizations.of(null).trans("Day Plural - ResultPage");
    } else if (results[5] == 0) {
      auxDay = "";
      day = "";
    }
    else{}

    textResult = "$year" + "$motnh" + "$day";
  }

  @override
  void addListener(listener) {}

  @override
  void dispose() {_resultsController.close();}

  @override
  bool get hasListeners => null;

  @override
  void notifyListeners() {}

  @override
  void removeListener(listener) {}
}
