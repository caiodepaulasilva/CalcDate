import 'package:calcdate/Business/resultBusiness.dart';
import 'package:calcdate/Business/homeBusiness.dart';
import 'package:calcdate/Template/Colors.dart';
import 'package:calcdate/Template/Localization/Localizations.dart';
import 'package:calcdate/Template/Texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:provider/provider.dart';

class CalendarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var homeBusiness = Provider.of<HomeBusiness>(context);
    var resultBusiness = Provider.of<ResultBusiness>(context);
    var _dateTime = DateTime.now();

    return AlertDialog(
        title: Text(Translate.of(context).key("Text - DialogDate")),
        content: Container(
          width: 400,
          height: 280,
          decoration: BoxDecoration(color: Colors.white),
          child: new Column(
            children: <Widget>[
              Expanded(
                child: DatePickerWidget(
                  dateFormat: homeBusiness.format(),
                  initialDate: DateTime.now(),
                  firstDate: DateTime.parse("0000-01-01"),
                  lastDate: DateTime.parse("9999-12-31"),
                  onChange: (DateTime dateTime, List<int> index) {
                    _dateTime = dateTime;
                  },
                  locale: DateTimePickerLocale.pt_br,

                  pickerTheme: DateTimePickerTheme(
                    backgroundColor: Colors.blueGrey[50],
                    cancelTextStyle: TextTemplate.textFirst,
                    confirmTextStyle: TextTemplate.textFirst,
                    itemTextStyle: TextStyle(color: Colors.black),
                    pickerHeight: 160.0,
                    itemHeight: 37.0,
                  ),
                ),
              ),
              Row(children: <Widget>[
                Expanded(
                    flex: 1,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        highlightColor: ColorTemplate.buttonFirst,
                        disabledTextColor: Colors.black,
                        disabledElevation: 5,
                        child: Text(
                            Translate.of(context)
                                .key("ButtonCancel - DialogDate"),
                            style: TextTemplate.textSecond),
                        onPressed: () {
                          Navigator.pop(context, null);
                        })),
                Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
                Expanded(
                    flex: 1,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        highlightColor: ColorTemplate.buttonFirst,
                        disabledTextColor: Colors.black,
                        disabledElevation: 5,
                        child: Text(
                            Translate.of(context)
                                .key("ButtonConfirm - DialogDate"),
                            style: TextTemplate.textSecond),
                        onPressed: () async {
                          if (homeBusiness.inputId == 1) {
                            resultBusiness.dateOne = _dateTime;
                          } else if (homeBusiness.inputId == 2) {
                            resultBusiness.dateTwo = _dateTime;
                          }
                          Navigator.pop(
                              context, await homeBusiness.parseText(_dateTime));
                        }))
              ]),
            ],
          ),
        ));
  }
}
