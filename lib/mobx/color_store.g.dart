// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ColorSettings on _ColorSettings, Store {
  final _$colorAtom = Atom(name: '_ColorSettings.color');

  @override
  Color get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  final _$_ColorSettingsActionController =
      ActionController(name: '_ColorSettings');

  @override
  void updateSelectedColor(Color newColor) {
    final _$actionInfo = _$_ColorSettingsActionController.startAction(
        name: '_ColorSettings.updateSelectedColor');
    try {
      return super.updateSelectedColor(newColor);
    } finally {
      _$_ColorSettingsActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
color: ${color}
    ''';
  }
}
