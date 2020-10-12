// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeBusiness.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeBusiness on _HomeBase, Store {
  final _$inputOneAtom = Atom(name: '_HomeBase.inputOne');

  @override
  String get inputOne {
    _$inputOneAtom.reportRead();
    return super.inputOne;
  }

  @override
  set inputOne(String value) {
    _$inputOneAtom.reportWrite(value, super.inputOne, () {
      super.inputOne = value;
    });
  }

  final _$inputTwoAtom = Atom(name: '_HomeBase.inputTwo');

  @override
  String get inputTwo {
    _$inputTwoAtom.reportRead();
    return super.inputTwo;
  }

  @override
  set inputTwo(String value) {
    _$inputTwoAtom.reportWrite(value, super.inputTwo, () {
      super.inputTwo = value;
    });
  }

  final _$inputIdAtom = Atom(name: '_HomeBase.inputId');

  @override
  int get inputId {
    _$inputIdAtom.reportRead();
    return super.inputId;
  }

  @override
  set inputId(int value) {
    _$inputIdAtom.reportWrite(value, super.inputId, () {
      super.inputId = value;
    });
  }

  final _$calculateAtom = Atom(name: '_HomeBase.calculate');

  @override
  bool get calculate {
    _$calculateAtom.reportRead();
    return super.calculate;
  }

  @override
  set calculate(bool value) {
    _$calculateAtom.reportWrite(value, super.calculate, () {
      super.calculate = value;
    });
  }

  final _$precisionAtom = Atom(name: '_HomeBase.precision');

  @override
  int get precision {
    _$precisionAtom.reportRead();
    return super.precision;
  }

  @override
  set precision(int value) {
    _$precisionAtom.reportWrite(value, super.precision, () {
      super.precision = value;
    });
  }

  final _$parseTextAsyncAction = AsyncAction('_HomeBase.parseText');

  @override
  Future<String> parseText(DateTime datetime) {
    return _$parseTextAsyncAction.run(() => super.parseText(datetime));
  }

  final _$_HomeBaseActionController = ActionController(name: '_HomeBase');

  @override
  void isCalculate() {
    final _$actionInfo =
        _$_HomeBaseActionController.startAction(name: '_HomeBase.isCalculate');
    try {
      return super.isCalculate();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String format() {
    final _$actionInfo =
        _$_HomeBaseActionController.startAction(name: '_HomeBase.format');
    try {
      return super.format();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
inputOne: ${inputOne},
inputTwo: ${inputTwo},
inputId: ${inputId},
calculate: ${calculate},
precision: ${precision}
    ''';
  }
}
