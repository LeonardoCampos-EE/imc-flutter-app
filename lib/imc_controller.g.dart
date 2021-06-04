// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IMCController on _IMCController, Store {
  final _$bmiStatusAtom = Atom(name: '_IMCController.bmiStatus');

  @override
  String get bmiStatus {
    _$bmiStatusAtom.reportRead();
    return super.bmiStatus;
  }

  @override
  set bmiStatus(String value) {
    _$bmiStatusAtom.reportWrite(value, super.bmiStatus, () {
      super.bmiStatus = value;
    });
  }

  final _$weightStrAtom = Atom(name: '_IMCController.weightStr');

  @override
  String get weightStr {
    _$weightStrAtom.reportRead();
    return super.weightStr;
  }

  @override
  set weightStr(String value) {
    _$weightStrAtom.reportWrite(value, super.weightStr, () {
      super.weightStr = value;
    });
  }

  final _$heightStrAtom = Atom(name: '_IMCController.heightStr');

  @override
  String get heightStr {
    _$heightStrAtom.reportRead();
    return super.heightStr;
  }

  @override
  set heightStr(String value) {
    _$heightStrAtom.reportWrite(value, super.heightStr, () {
      super.heightStr = value;
    });
  }

  final _$_IMCControllerActionController =
      ActionController(name: '_IMCController');

  @override
  dynamic resetStatus() {
    final _$actionInfo = _$_IMCControllerActionController.startAction(
        name: '_IMCController.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$_IMCControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic calculateIMC() {
    final _$actionInfo = _$_IMCControllerActionController.startAction(
        name: '_IMCController.calculateIMC');
    try {
      return super.calculateIMC();
    } finally {
      _$_IMCControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bmiStatus: ${bmiStatus},
weightStr: ${weightStr},
heightStr: ${heightStr}
    ''';
  }
}
