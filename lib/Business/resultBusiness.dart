import 'package:calcdate/Models/DateResult.dart';
import 'package:calcdate/Template/Localization/Localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'resultBusiness.g.dart';

class ResultBusiness = _ResultBase with _$ResultBusiness;

abstract class _ResultBase with Store {
  @observable
  DateTime dateOne;

  @observable
  DateTime dateTwo;

  @observable
  DateResult result = new DateResult();

  Object checkLeapYear(int currentYear) {
    if ((currentYear % 4 == 0 && currentYear % 100 != 0) ||
        (currentYear % 400 == 0)) {
      return {
        '1': 31,
        '2': 29,
        '3': 31,
        '4': 30,
        '5': 31,
        '6': 30,
        '7': 31,
        '8': 31,
        '9': 30,
        '10': 31,
        '11': 30,
        '12': 31
      };
    } else {
      return {
        '1': 31,
        '2': 28,
        '3': 31,
        '4': 30,
        '5': 31,
        '6': 30,
        '7': 31,
        '8': 31,
        '9': 30,
        '10': 31,
        '11': 30,
        '12': 31
      };
    }
  }

  Map<String, DateTime> dateAsc(DateTime dateOne, DateTime dateTwo) {
    if (dateTwo.isAfter(dateOne)) {
      return Map.from({'lessDate': dateOne, 'biggestDate': dateTwo});
    } else {
      return Map.from({'lessDate': dateTwo, 'biggestDate': dateOne});
    }
  }

  Duration duration(DateTime lessDate, DateTime biggestDate) {
    return DateTime.utc(biggestDate.year, biggestDate.month, biggestDate.day)
        .difference(DateTime.utc(lessDate.year, lessDate.month, lessDate.day));
  }

  @action
  String message(BuildContext context, DateResult result) {
    String text = "";

    if (result.totalYears == 1) {
      text += "${result.totalYears} " +
          Translate.of(context).key("Year Singular - ResultPage");
    } else if (result.totalYears > 1) {
      text += "${result.totalYears} " +
          Translate.of(context).key("Year Plural - ResultPage");
    }

    if (result.totalYears != 0 && result.months != 0) {
      text += " ${Translate.of(context).key("Date Aux - ResultPage")} ";
    }

    if (result.months == 1) {
      text += "${result.months} " +
          Translate.of(context).key("Month Singular - ResultPage");
    } else if (result.months > 1) {
      text += "${result.months} " +
          Translate.of(context).key("Month Plural - ResultPage");
    }

    if (result.months != 0 && result.days != 0) {
      text += " ${Translate.of(context).key("Date Aux - ResultPage")} ";
    }

    if (result.days == 1) {
      text += "${result.days} " +
          Translate.of(context).key("Day Singular - ResultPage");
    } else if (result.days > 1) {
      text += "${result.days} " +
          Translate.of(context).key("Day Plural - ResultPage");
    }

    return text;
  }

  @action
  calculate() {
    result.init();

    var dates = dateAsc(dateOne, dateTwo);

    int currentDay = 1;
    int currentMonth = dates['lessDate'].month;
    int currentYear = dates['lessDate'].year;

    int daysMonth = Map.from(checkLeapYear(currentYear))["${dateOne.month}"];

    result.totalDays = duration(dates['lessDate'], dates['biggestDate']).inDays;

    for (var daysPassed = 0; daysPassed < result.totalDays; daysPassed++) {
      if (currentDay == daysMonth) {
        currentDay = 1;
        result.months++;

        if (result.months % 12 == 0 && !(currentDay > 1)) {
          result.months = 0;
          result.totalYears++;
        } else {}

        if (currentMonth == 12) {
          currentMonth = 0;
          currentYear++;
        }
        result.totalMonths++;
        currentMonth++;
      } else {
        currentDay++;
      }
      daysMonth = Map.from(checkLeapYear(currentYear))["$currentMonth"];
    }

    if (dates['biggestDate'].day > dates['lessDate'].day) {
      result.days = dates['biggestDate'].day - dates['lessDate'].day;
    } else if (dates['biggestDate'].day == dates['lessDate'].day) {
      result.days = 0;
    } else {
      result.days =
          daysMonth - (dates['lessDate'].day - dates['biggestDate'].day) + 1;
    }
  }
}
