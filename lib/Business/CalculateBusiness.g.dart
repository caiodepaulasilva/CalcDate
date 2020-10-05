// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CalculateBusiness.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalculateStore on _CalculateStoreBase, Store {
  final _$dateOneAtom = Atom(name: '_CalculateStoreBase.dateOne');

  @override
  DateTime get dateOne {
    _$dateOneAtom.context.enforceReadPolicy(_$dateOneAtom);
    _$dateOneAtom.reportObserved();
    return super.dateOne;
  }

  @override
  set dateOne(DateTime value) {
    _$dateOneAtom.context.conditionallyRunInAction(() {
      super.dateOne = value;
      _$dateOneAtom.reportChanged();
    }, _$dateOneAtom, name: '${_$dateOneAtom.name}_set');
  }

  final _$dateTwoAtom = Atom(name: '_CalculateStoreBase.dateTwo');

  @override
  DateTime get dateTwo {
    _$dateTwoAtom.context.enforceReadPolicy(_$dateTwoAtom);
    _$dateTwoAtom.reportObserved();
    return super.dateTwo;
  }

  @override
  set dateTwo(DateTime value) {
    _$dateTwoAtom.context.conditionallyRunInAction(() {
      super.dateTwo = value;
      _$dateTwoAtom.reportChanged();
    }, _$dateTwoAtom, name: '${_$dateTwoAtom.name}_set');
  }

  final _$resultsAtom = Atom(name: '_CalculateStoreBase.results');

  @override
  Map<String, int> get results {
    _$resultsAtom.context.enforceReadPolicy(_$resultsAtom);
    _$resultsAtom.reportObserved();
    return super.results;
  }

  @override
  set results(Map<String, int> value) {
    _$resultsAtom.context.conditionallyRunInAction(() {
      super.results = value;
      _$resultsAtom.reportChanged();
    }, _$resultsAtom, name: '${_$resultsAtom.name}_set');
  }

  final _$_CalculateStoreBaseActionController =
      ActionController(name: '_CalculateStoreBase');

  @override
  Map<String, int> calculate() {
    final _$actionInfo = _$_CalculateStoreBaseActionController.startAction();
    try {
      return super.calculate();
    } finally {
      _$_CalculateStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
