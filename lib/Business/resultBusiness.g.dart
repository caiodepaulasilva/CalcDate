// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultBusiness.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResultBusiness on _ResultBase, Store {
  final _$dateOneAtom = Atom(name: '_ResultBase.dateOne');

  @override
  DateTime get dateOne {
    _$dateOneAtom.reportRead();
    return super.dateOne;
  }

  @override
  set dateOne(DateTime value) {
    _$dateOneAtom.reportWrite(value, super.dateOne, () {
      super.dateOne = value;
    });
  }

  final _$dateTwoAtom = Atom(name: '_ResultBase.dateTwo');

  @override
  DateTime get dateTwo {
    _$dateTwoAtom.reportRead();
    return super.dateTwo;
  }

  @override
  set dateTwo(DateTime value) {
    _$dateTwoAtom.reportWrite(value, super.dateTwo, () {
      super.dateTwo = value;
    });
  }

  final _$resultsAtom = Atom(name: '_ResultBase.results');

  @override
  Map<String, int> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(Map<String, int> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$_ResultBaseActionController = ActionController(name: '_ResultBase');

  @override
  Map<String, int> calculate() {
    final _$actionInfo = _$_ResultBaseActionController.startAction(
        name: '_ResultBase.calculate');
    try {
      return super.calculate();
    } finally {
      _$_ResultBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dateOne: ${dateOne},
dateTwo: ${dateTwo},
results: ${results}
    ''';
  }
}
