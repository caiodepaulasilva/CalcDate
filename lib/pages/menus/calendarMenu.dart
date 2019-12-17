import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:dateCalculator/localization/localizations.dart';

class DatePickerMenu extends StatefulWidget {
  final precision;
  final position;
  DatePickerMenu({Key key, int precision, int position})
      : this.precision = precision,
        this.position = position;

  @override
  State<StatefulWidget> createState() =>
      _DatePickerMenuState(precision: this.precision, position: this.position);
}

class _DatePickerMenuState extends State<DatePickerMenu> {
  final int precision;
  final int position;

  _DatePickerMenuState({this.precision, this.position});

  DateTime _dateTime;
  String minDatetime = '0000-01-01';
  String maxDatetime;

  String initDatetime = DateTime.now().toString();
  String datedFormat;
  String date;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.parse(initDatetime);
  }

  String maxDateTime(int position) {
    if (position == 2) {
      return maxDatetime = '9999-12-31';
    }
    if (position == 1) {
      return maxDatetime = DateTime.now().toString();
    } else {
      return maxDatetime = DateTime.now().toString();
    }
  }

  String choiceFormat(int userChoice) {
    if (userChoice == 1) {
      datedFormat = 'yyyy';
    } else if (userChoice == 2) {
      datedFormat = 'MM-yyyy';
    } else if (userChoice == 3) {
      datedFormat = 'dd-MM-yyyy';
    }

    return datedFormat;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.all(6.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text(
                    MyLocalizations.of(context).trans("Text - DialogDate"),
                    style: Theme.of(context).textTheme.title),
              ),
              // Container(
              //   padding: EdgeInsets.only(left: 2.0),
              //   child: Text(
              //     _dateTime != null
              //         ? choiceString(precision)
              //         // ? '${_dateTime.year}-${_dateTime.month.toString().padLeft(2, '0')}-${_dateTime.day.toString().padLeft(2, '0')}-$precision'
              //         : '',
              // style: Theme.of(context).textTheme.title,
              // ),
              // ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: DatePickerWidget(
              minDateTime: DateTime.parse(minDatetime),
              maxDateTime: DateTime.parse(maxDateTime(position)),
              initialDateTime: DateTime.parse(initDatetime),
              onConfirm: (dateTime, selectedIndex) {},
              dateFormat: choiceFormat(precision),
              // NÃO ESTÁ RECONHECENDO PT-BR -> ESTÁ COM FUSO +1H
              locale: DateTimePickerLocale.pt_br,
              pickerTheme: DateTimePickerTheme(
                showTitle: false,
                backgroundColor: Colors.blueGrey[100],
                cancelTextStyle: TextStyle(color: Colors.black, fontSize: 20),
                confirmTextStyle: TextStyle(color: Colors.black, fontSize: 20),
                itemTextStyle: TextStyle(color: Colors.black),
                pickerHeight: 300.0,
                titleHeight: 44.0,
                itemHeight: 30.0,
              ),
              onChange: (dateTime, selectedIndex) {
                setState(() {
                  _dateTime = dateTime;
                });
              },
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: 130,
                    // height: 100,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        disabledColor: Colors.yellowAccent[400],
                        hoverColor: Colors.yellowAccent[400],
                        focusColor: Colors.yellowAccent[400],
                        highlightColor: Colors.yellowAccent[400],
                        disabledTextColor: Colors.black,
                        disabledElevation: 5,
                        child: Text(
                            MyLocalizations.of(context)
                                .trans("Button 1 - DialogDate"),
                            style: TextStyle(fontSize: 16)),
                        onPressed: () {
                          Navigator.pop(context, null);
                        })),
                Container(
                    width: 130,
                    // height: 100,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        disabledColor: Colors.yellowAccent[400],
                        hoverColor: Colors.yellowAccent[400],
                        focusColor: Colors.yellowAccent[400],
                        highlightColor: Colors.yellowAccent[400],
                        disabledTextColor: Colors.black,
                        disabledElevation: 5,
                        child:
                            Text( MyLocalizations.of(context)
                                .trans("Button 2 - DialogDate"), style: TextStyle(fontSize: 16)),
                        onPressed: () {
                          Navigator.pop(context, _dateTime);
                        }))
              ]),
          // selected date
        ],
      ),
    ));
  }
}
