import 'package:mobx/mobx.dart';
part 'CalculateBusiness.g.dart';

class CalculateStore = _CalculateStoreBase with _$CalculateStore;

abstract class _CalculateStoreBase with Store {
  @observable
  DateTime dateOne;

  @observable
  DateTime dateTwo;

  @observable
  Map<String, int> results = {
    "Total Years": 0,
    "Total Months": 0,
    "Total Days": 0,
    "Years": 0,
    "Months": 0,
    "Days": 0
  };

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

  Object dateAsc(DateTime dateOne, DateTime dateTwo) {
    if (dateTwo.isAfter(dateOne)) {
      return {'lessDate': dateOne, 'biggestDate': dateTwo};
    } else {
      return {'lessDate': dateTwo, 'biggestDate': dateOne};
    }
  }

  Duration durationInDays(DateTime lessDate, DateTime biggestDate) {
    return DateTime.utc(biggestDate.year, biggestDate.month, biggestDate.day)
        .difference(DateTime.utc(lessDate.year, lessDate.month, lessDate.day));
  }

  @action
  Map<String, int> calculate() {
    results.clear();

    var completeYear;

    var qtdMonths = 0;
    var qtdDays = 0;
    var qtdYears = 0;
    var qtdTotalMonths = 0;

    var dates = Map.from(dateAsc(dateOne, dateTwo));
    var qtdTotalDays =
        durationInDays(dates['lessDate'], dates['biggestDate']).inDays;

    var currentDay = 1;
    var currentMonth = dates['lessDate'].month;
    var currentYear = dates['lessDate'].year;

    var diasDoMes = Map.from(checkLeapYear(currentYear));
    var daysMonth = diasDoMes["${dateOne.month}"];

    completeYear = !(currentDay > 1);

    for (var daysPassed = 0; daysPassed < qtdTotalDays; daysPassed++) {
      if (currentDay == daysMonth) {
        currentDay = 1;
        qtdMonths++;

        if (qtdMonths % 12 == 0 && completeYear) {
          qtdMonths = 0;
          qtdYears++;
        } else {
          completeYear = true;
        }

        if (currentMonth == 12) {
          currentMonth = 0;
          currentYear++;
          diasDoMes = checkLeapYear(currentYear);
        }
        qtdTotalMonths++;
        currentMonth++;
      } else {
        currentDay++;
      }
      daysMonth = diasDoMes["$currentMonth"];
    }

    if (dates['biggestDate'].day > dates['lessDate'].day) {
      qtdDays = dates['biggestDate'].day - dates['lessDate'].day;
    } else if (dates['biggestDate'].day == dates['lessDate'].day) {
      qtdDays = 0;
    } else {
      qtdDays =
          daysMonth - (dates['lessDate'].day - dates['biggestDate'].day) + 1;
    }

    results["Total Years"] = (qtdYears);
    results["Total Months"] = (qtdTotalMonths);
    results["Total Days"] = (qtdTotalDays);

    results['Years'] = (qtdYears);
    results['Months'] = (qtdMonths);
    results['Days'] = (qtdDays);

    return results;
  }
}
