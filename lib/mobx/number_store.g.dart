// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NumberStore on _NumberStore, Store {
  Computed<String>? _$nbInStringComputed;

  @override
  String get nbInString =>
      (_$nbInStringComputed ??= Computed<String>(() => super.nbInString,
              name: '_NumberStore.nbInString'))
          .value;

  final _$nbAtom = Atom(name: '_NumberStore.nb');

  @override
  int get nb {
    _$nbAtom.reportRead();
    return super.nb;
  }

  @override
  set nb(int value) {
    _$nbAtom.reportWrite(value, super.nb, () {
      super.nb = value;
    });
  }

  @override
  String toString() {
    return '''
nb: ${nb},
nbInString: ${nbInString}
    ''';
  }
}
