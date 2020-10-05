import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';

class DateCalculateController implements BlocBase {
  final List<int> results = List<int>();

  var _dataController = StreamController();
  Sink get input => _dataController.sink;
  Stream get output => _dataController.stream;

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

  Object checkPreviousDate(DateTime firstDate, DateTime secondDate) {
    if (secondDate.isAfter(firstDate)) {
      return {'shortestDate': firstDate, 'biggestDate': secondDate};
    } else {
      return {'shortestDate': secondDate, 'biggestDate': firstDate};
    }
  }

  Duration checkDuracationInDays(DateTime shortestDate, DateTime biggestDate) {
    return DateTime.utc(biggestDate.year, biggestDate.month, biggestDate.day)
        .difference(DateTime.utc(
            shortestDate.year, shortestDate.month, shortestDate.day));
  }

  calcular(firstDate, secondDate) {
    results.clear();

    var fullYear;

    var qtdMonths = 0;
    var qtdDays = 0;
    var qtdYears = 0;
    var qtdTotalMonths = 0;

    var datas = Map.from(checkPreviousDate(firstDate, secondDate));
    var qtdeTotalDias =
        checkDuracationInDays(datas['shortestDate'], datas['biggestDate'])
            .inDays;

    var diaAtual = 1;
    var mesAtual = datas['shortestDate'].month;
    var currentYear = datas['shortestDate'].year;

    var diasDoMes = Map.from(checkLeapYear(currentYear));
    var diasMesAtual = diasDoMes["${firstDate.month}"];

    fullYear = !(diaAtual > 1);

    for (var diasCorridos = 0; diasCorridos < qtdeTotalDias; diasCorridos++) {
      if (diaAtual == diasMesAtual) {
        diaAtual = 1;
        qtdMonths++;

        if (qtdMonths % 12 == 0 && fullYear) {
          qtdMonths = 0;
          qtdYears++;
        } else {
          fullYear = true;
        }

        if (mesAtual == 12) {
          mesAtual = 0;
          currentYear++;
          diasDoMes = checkLeapYear(currentYear);
        }
        qtdTotalMonths++;
        mesAtual++;
      } else {
        diaAtual++;
      }
      diasMesAtual = diasDoMes["$mesAtual"];
    }

    if (datas['biggestDate'].day > datas['shortestDate'].day) {
      qtdDays = datas['biggestDate'].day - datas['shortestDate'].day;
    } else if (datas['biggestDate'].day == datas['shortestDate'].day) {
      qtdDays = 0;
    } else {
      qtdDays = diasMesAtual -
          (datas['shortestDate'].day - datas['biggestDate'].day) +
          1;
    }

    results.add(qtdYears);
    results.add(qtdTotalMonths);
    results.add(qtdeTotalDias);

    results.add(qtdYears);
    results.add(qtdMonths);
    results.add(qtdDays);

    _dataController.add(results);
  }

  @override
  void addListener(listener) {}

  @override
  void dispose() => _dataController.close();

  @override
  bool get hasListeners => null;

  @override
  void notifyListeners() {}

  @override
  void removeListener(listener) {}
}
