import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:CalcDate/pages/components/choiceMenu.dart';
import 'package:flutter/services.dart';
import 'package:CalcDate/pages/components/calculate.dart';
import 'package:CalcDate/localization/localizations.dart';

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
  bool calculateEnabled = false;

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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                  width: 30,
                  child: TextField(
                    autofocus: false,
                    readOnly: true,
                    cursorWidth: 2,
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                    maxLines: 1,
                    controller: inputDate1,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            setState(() {
                              date1 = date1;
                              inputDate1.clear();
                              calculateEnabled = false;
                            });
                          });
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
                      labelStyle:
                          TextStyle(fontSize: 15.0, color: Colors.white),
                      border: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.white, width: 0.0)),
                      labelText: MyLocalizations.of(context)
                          .trans("EntryDate 1 - HomePage"),
                    ),
                    textAlign: TextAlign.start,
                  ),
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

                        if (inputDate2.text.length != 0 &&
                            inputDate1.text.length != 0) {
                          calculateEnabled = true;
                        }
                      }
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                  width: 310,
                  child: TextField(
                    readOnly: true,
                    autofocus: false,
                    textInputAction: TextInputAction.done,
                    cursorWidth: 2,
                    maxLines: 1,
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                    controller: inputDate2,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            setState(() {
                              date2 = date2;
                              inputDate2.clear();
                              calculateEnabled = false;
                            });
                          });
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
                      labelStyle:
                          TextStyle(fontSize: 15.0, color: Colors.white),
                      border: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Colors.white, width: 0.0)),
                      labelText: MyLocalizations.of(context)
                          .trans("EntryDate 2 - HomePage"),
                    ),
                    textAlign: TextAlign.start,
                  ),
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

                        if (inputDate2.text.length != 0 &&
                            inputDate1.text.length != 0) {
                          calculateEnabled = true;
                        }
                      }
                    }),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25),
        ),
        Calculate(date1, date2, calculateEnabled),
        Padding(
          padding: EdgeInsets.only(bottom: 25),
        ),
      ],
    );
  }
}
