import 'dart:async';
import 'package:CalcDate/views/menus/choiceMenu.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class DateinputController implements BlocBase {
  bool calculateEnabled = false;
  Object choiceMenu;

  var _inputController = StreamController();
  Sink get input => _inputController.sink;
  Stream get output => _inputController.stream;

  clearInput(input) {
    input.clear();
    calculateEnabled = false;
  }

  inputController(context, position) async {
   choiceMenu = await showDialog(
        context: context, builder: (context) => ChoiceMenu(position: position));
  }

//  if (choiceMenu != null && Map.castFrom(choiceMenu)['date'] != null) {
//       date = Map.castFrom(choiceMenu)['date'];
//       precision = Map.castFrom(choiceMenu)['precision'];

//       return textController(date, precision);
//     } else {
//       return textController(null, null);
//     }

  String textController(DateTime date, int precision) {
    if (precision == 1) {
      return '${date.year}';
    }
    if (precision == 2) {
      return '${date.month.toString().padLeft(2, '0')}-${date.year}';
    }
    if (precision == 3) {
      return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
    } else
      return '';
  }

  @override
  void addListener(listener) {}

  @override
  void dispose() => _inputController.close();

  @override
  bool get hasListeners => null;

  @override
  void notifyListeners() {}

  @override
  void removeListener(listener) {}
}
