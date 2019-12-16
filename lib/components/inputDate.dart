import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dateCalculator/menus/choiceMenu.dart';
import 'package:flutter/services.dart';
import 'package:dateCalculator/components/calculate.dart';

class InputDate extends StatefulWidget {
  InputDate({Key key});

  @override
  _InputDateState createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  DateTime date1;
  DateTime date2;
  Object choiceMenu;
  int precision1;
  int precision2;
  final inputDate1 = TextEditingController();
  final inputDate2 = TextEditingController();

  void initState() {
    super.initState();

    date1 = DateTime.now();
    date2 = DateTime.now();
    choiceMenu = {'precision': 3, 'date': DateTime.now()};
  }

  @override
  Widget build(BuildContext context) {
    String textController(DateTime date, int precision) {
      setState(() {
        date = date;
      });

      if (precision == 1) {
        return '${date.year}';
      }
      if (precision == 2) {
        return '${date.month.toString().padLeft(2, '0')}-${date.year}';
      }
      if (precision == 3) {
        return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
      } else
        return 'Invalid Format';
    }

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
                textInputAction: TextInputAction.done,
                scrollPadding: EdgeInsets.all(110),
                keyboardAppearance: Brightness.dark,
                cursorWidth: 2,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                maxLines: 1,
                keyboardType: TextInputType.number,
                controller: inputDate1,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      WidgetsBinding.instance
                          .addPostFrameCallback((_) => inputDate1.clear());
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
                    choiceMenu = await showDialog(
                        context: context,
                        builder: (context) => ChoiceMenu(position: 1));

                    if (choiceMenu != null &&
                        Map.castFrom(choiceMenu)['date'] != null) {
                      date1 = Map.castFrom(choiceMenu)['date'];
                      precision1 = Map.castFrom(choiceMenu)['precision'];

                      inputDate1.text = textController(date1, precision1);
                    }
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
                controller: inputDate2,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      WidgetsBinding.instance
                          .addPostFrameCallback((_) => inputDate2.clear());
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
                  labelText: ("Segunda Data"),
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
                    choiceMenu = await showDialog(
                        context: context,
                        builder: (context) => ChoiceMenu(position: 1));

                    if (choiceMenu != null &&
                        Map.castFrom(choiceMenu)['date'] != null) {
                      date2 = Map.castFrom(choiceMenu)['date'];
                      precision2 = Map.castFrom(choiceMenu)['precision'];

                      inputDate2.text = textController(date2, precision2);
                    }
                  }),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 25),
        ),
        Calculate(date1, date2),
        Padding(
          padding: EdgeInsets.only(bottom: 25),
        ),
      ],
    );
  }
}
