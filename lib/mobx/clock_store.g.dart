// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clock_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClockStore on _ClockStore, Store {
  final _$datetimeAtom = Atom(name: '_ClockStore.datetime');

  @override
  DateTime get datetime {
    _$datetimeAtom.reportRead();
    return super.datetime;
  }

  @override
  set datetime(DateTime value) {
    _$datetimeAtom.reportWrite(value, super.datetime, () {
      super.datetime = value;
    });
  }

  @override
  String toString() {
    return '''
datetime: ${datetime}
    ''';
  }
}
