import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dateCalculator/menus/choiceMenu.dart';
import 'package:flutter/services.dart';
import 'package:dateCalculator/components/calculate.dart';
// import 'package:dateCalculator/language.json';
// import 'package:flutter_masked_text/flutter_masked_text.dart';

class InputDate extends StatefulWidget {
  InputDate({Key key});

  @override
  _InputDateState createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  DateTime firstDate;
  DateTime secondDate;
  String returnInputDate;
  int firstPrecision;
  int secondPrecision;

  final firstTextController = TextEditingController();
  final secondTextController = TextEditingController();
  // final firstTextController = MaskedTextController(mask: '00-00-0000');
  // final secondTextController = MaskedTextController(mask: '00-00-0000');

  void initState() {
    super.initState();

    firstDate = DateTime.now();
    secondDate = DateTime.now();
    returnInputDate = '3' + '|' + '${DateTime.now()}';
  }

  void correctTextController(
      DateTime date, int precision, int entradaSelecionada) {
    String formatoEntrada;

    setState(() {
      date = date;
    });

    if (precision == 1) {
      formatoEntrada = '${date.year}';
    }
    if (precision == 2) {
      formatoEntrada = '${date.month.toString().padLeft(2, '0')}-${date.year}';
    }
    if (precision == 3) {
      formatoEntrada =
          '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
    }

    if (entradaSelecionada == 1)
      firstTextController.text = formatoEntrada;
    else if (entradaSelecionada == 2)
      secondTextController.text = formatoEntrada;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              width: 310,
              child: TextField(
                // toolbarOptions: ToolbarOptions(
                //     copy: false, paste: false, selectAll: true, cut: false),
                textInputAction: TextInputAction.done,
                scrollPadding: EdgeInsets.all(110),
                keyboardAppearance: Brightness.dark,
                cursorWidth: 2,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                maxLines: 1,
                keyboardType: TextInputType.number,
                controller: firstTextController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback(
                          (_) => firstTextController.clear());
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white38,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  labelStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                  border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.0)),
                  labelText: ("Primeira Data"),
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              height: 75,
              width: 60,
              alignment: Alignment.center,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  color: Colors.yellowAccent[400],
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                  child: Icon(Icons.calendar_today),
                  onPressed: () async {
                    returnInputDate = await showDialog(
                        context: context,
                        builder: (context) => ChoiceMenu(input: 1));

                    if (returnInputDate == null) {
                      firstDate = DateTime.now();
                      firstPrecision = 3;
                    } else {
                      firstDate = DateTime.parse(returnInputDate.substring(2));
                      firstPrecision =
                          int.parse(returnInputDate.substring(0, 1));
                    }
                    correctTextController(firstDate, firstPrecision, 1);
                  }),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              width: 310,
              child: TextField(
                // toolbarOptions: ToolbarOptions(
                //     copy: false, paste: false, selectAll: true, cut: false),
                textInputAction: TextInputAction.done,
                scrollPadding: EdgeInsets.all(110),
                cursorColor: Colors.white,
                keyboardAppearance: Brightness.dark,
                obscureText: false,
                cursorWidth: 2,
                maxLines: 1,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                keyboardType: TextInputType.number,
                controller: secondTextController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback(
                          (_) => secondTextController.clear());
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white38,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  labelStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                  border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.0)),
                  labelText:("Segunda Data"),
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              height: 75,
              width: 60,
              alignment: Alignment.center,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  color: Colors.yellowAccent[400],
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                  child: Icon(Icons.calendar_today),
                  onPressed: () async {
                    returnInputDate = await showDialog(
                        context: context,
                        builder: (context) => ChoiceMenu(input: 2));

                    if (returnInputDate == null) {
                      secondDate = DateTime.now();
                      secondPrecision = 3;
                    } else {
                      secondDate = DateTime.parse(returnInputDate.substring(2));
                      secondPrecision =
                          int.parse(returnInputDate.substring(0, 1));
                    }

                    correctTextController(secondDate, secondPrecision, 2);
                  }),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 25),
        ),
        Calculate(firstDate, secondDate),
        Padding(
          padding: EdgeInsets.only(bottom: 25),
        ),
      ],
    );
  }
}
