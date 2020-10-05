// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menuBusiness.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MenuStore on _MenuStoreBase, Store {
  final _$inputOneAtom = Atom(name: '_MenuStoreBase.inputOne');

  @override
  String get inputOne {
    _$inputOneAtom.context.enforceReadPolicy(_$inputOneAtom);
    _$inputOneAtom.reportObserved();
    return super.inputOne;
  }

  @override
  set inputOne(String value) {
    _$inputOneAtom.context.conditionallyRunInAction(() {
      super.inputOne = value;
      _$inputOneAtom.reportChanged();
    }, _$inputOneAtom, name: '${_$inputOneAtom.name}_set');
  }

  final _$inputTwoAtom = Atom(name: '_MenuStoreBase.inputTwo');

  @override
  String get inputTwo {
    _$inputTwoAtom.context.enforceReadPolicy(_$inputTwoAtom);
    _$inputTwoAtom.reportObserved();
    return super.inputTwo;
  }

  @override
  set inputTwo(String value) {
    _$inputTwoAtom.context.conditionallyRunInAction(() {
      super.inputTwo = value;
      _$inputTwoAtom.reportChanged();
    }, _$inputTwoAtom, name: '${_$inputTwoAtom.name}_set');
  }

  final _$inputIdAtom = Atom(name: '_MenuStoreBase.inputId');

  @override
  int get inputId {
    _$inputIdAtom.context.enforceReadPolicy(_$inputIdAtom);
    _$inputIdAtom.reportObserved();
    return super.inputId;
  }

  @override
  set inputId(int value) {
    _$inputIdAtom.context.conditionallyRunInAction(() {
      super.inputId = value;
      _$inputIdAtom.reportChanged();
    }, _$inputIdAtom, name: '${_$inputIdAtom.name}_set');
  }

  final _$precisionAtom = Atom(name: '_MenuStoreBase.precision');

  @override
  int get precision {
    _$precisionAtom.context.enforceReadPolicy(_$precisionAtom);
    _$precisionAtom.reportObserved();
    return super.precision;
  }

  @override
  set precision(int value) {
    _$precisionAtom.context.conditionallyRunInAction(() {
      super.precision = value;
      _$precisionAtom.reportChanged();
    }, _$precisionAtom, name: '${_$precisionAtom.name}_set');
  }

  final _$parseTextAsyncAction = AsyncAction('parseText');

  @override
  Future<String> parseText(DateTime datetime) {
    return _$parseTextAsyncAction.run(() => super.parseText(datetime));
  }

  final _$_MenuStoreBaseActionController =
      ActionController(name: '_MenuStoreBase');

  @override
  String format() {
    final _$actionInfo = _$_MenuStoreBaseActionController.startAction();
    try {
      return super.format();
    } finally {
      _$_MenuStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
