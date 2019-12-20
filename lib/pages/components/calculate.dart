import 'package:dateCalculator/pages/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:dateCalculator/localization/localizations.dart';

class Calculate extends StatelessWidget {
  final DateTime firstDate;
  final DateTime secondDate;
  final bool state;
  final List<int> resultados = List<int>();

  Calculate(DateTime firstDate, DateTime secondDate, bool state)
      : this.firstDate = firstDate,
        this.secondDate = secondDate,
        this.state = state;

  @override
  Widget build(BuildContext context) {
    Object verificaAnoBissexto(int anoAtual) {
      if ((anoAtual % 4 == 0 && anoAtual % 100 != 0) || (anoAtual % 400 == 0)) {
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

    Object verificaPrecedencia(DateTime firstDate, DateTime secondDate) {
      if (secondDate.isAfter(firstDate)) {
        return {'menorData': firstDate, 'maiorData': secondDate};
      } else {
        return {'menorData': secondDate, 'maiorData': firstDate};
      }
    }

    Duration verificaDuracaoEmDias(DateTime menorData, DateTime maiorData) {
      return DateTime.utc(maiorData.year, maiorData.month, maiorData.day)
          .difference(
              DateTime.utc(menorData.year, menorData.month, menorData.day));
    }

    List<int> calcular() {
      resultados.clear();

      var anoCompleto;

      var qtdeMeses = 0;
      var qtdeDias = 0;
      var qtdeAnos = 0;
      var qtdeTotalMeses = 0;

      var datas = Map.from(verificaPrecedencia(firstDate, secondDate));
      var qtdeTotalDias =
          verificaDuracaoEmDias(datas['menorData'], datas['maiorData']).inDays;

      var diaAtual = 1;
      var mesAtual = datas['menorData'].month;
      var anoAtual = datas['menorData'].year;

      var diasDoMes = Map.from(verificaAnoBissexto(anoAtual));
      var diasMesAtual = diasDoMes["${firstDate.month}"];

      anoCompleto = !(diaAtual > 1);

      for (var diasCorridos = 0; diasCorridos < qtdeTotalDias; diasCorridos++) {
        if (diaAtual == diasMesAtual) {
          diaAtual = 1;
          qtdeMeses++;

          if (qtdeMeses % 12 == 0 && anoCompleto) {
            qtdeMeses = 0;
            qtdeAnos++;
          } else {
            anoCompleto = true;
          }

          if (mesAtual == 12) {
            mesAtual = 0;
            anoAtual++;
            diasDoMes = verificaAnoBissexto(anoAtual);
          }
          qtdeTotalMeses++;
          mesAtual++;
        } else {
          diaAtual++;
        }
        diasMesAtual = diasDoMes["$mesAtual"];
      }

      if (datas['maiorData'].day > datas['menorData'].day) {
        qtdeDias = datas['maiorData'].day - datas['menorData'].day;
      } else if (datas['maiorData'].day == datas['menorData'].day) {
        qtdeDias = 0;
      } else {
        qtdeDias = diasMesAtual -
            (datas['menorData'].day - datas['maiorData'].day) +
            1;
      }

      resultados.add(qtdeAnos);
      resultados.add(qtdeTotalMeses);
      resultados.add(qtdeTotalDias);

      resultados.add(qtdeAnos);
      resultados.add(qtdeMeses);
      resultados.add(qtdeDias);

      return resultados;
    }

    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 200,
              height: 40,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.yellowAccent[400],
                splashColor: Colors.limeAccent[300],
                onPressed: () {
                  if (state) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contexto) =>
                                ResultPage(results: calcular())));
                  } else {}
                },
                child: Text(
                    MyLocalizations.of(context).trans('Button - HomePage'),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),
              )),
        ]);
  }
}
