import 'package:calcdate/Business/homeBusiness.dart';
import 'package:calcdate/Business/resultBusiness.dart';
import 'package:calcdate/Template/Colors.dart';
import 'package:calcdate/Template/Localization/Localizations.dart';
import 'package:calcdate/Template/Texts.dart';
import 'package:calcdate/Views/Result/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var homeBusiness = Provider.of<HomeBusiness>(context);
    var resultBusiness = Provider.of<ResultBusiness>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 25, bottom: 25),
            width: 200,
            height: 40,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: ColorTemplate.buttonFirst,
              splashColor: Colors.limeAccent[300],
              onPressed: () {
                if (homeBusiness.calculate) {
                  resultBusiness.calculate();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResultPage()));
                }
              },
              child: Text(Translate.of(context).key('Button - HomePage'),
                  textAlign: TextAlign.center, style: TextTemplate.textFirst),
            )),
      ],
    );
  }
}
