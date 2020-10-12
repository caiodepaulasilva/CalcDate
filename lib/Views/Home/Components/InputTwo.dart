import 'package:calcdate/Business/homeBusiness.dart';
import 'package:calcdate/Template/Localization/Localizations.dart';
import 'package:calcdate/Views/Home/Menus/ChoiceMenu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var homeBusiness = Provider.of<HomeBusiness>(context);
    final inputTwo = new TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              child: TextField(
                readOnly: true,
                autofocus: false,
                maxLines: 1,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                controller: inputTwo,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        inputTwo.clear();
                        homeBusiness.inputTwo = "";
                        homeBusiness.calculate = false;
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
                  labelStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                  border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.0)),
                  labelText:
                      Translate.of(context).key("EntryDate 2 - HomePage"),
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
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
              child: Icon(Icons.calendar_today),
              onPressed: () async {
                homeBusiness.inputId = 2;
                homeBusiness.inputTwo = await showDialog(
                        context: context, builder: (context) => ChoiceMenu()) ??
                    "";
                inputTwo.text = homeBusiness.inputTwo;
                homeBusiness.isCalculate();
              },
            ),
          ),
        ],
      ),
    );
  }
}
