import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'number_store.g.dart';

class NumberStore = _NumberStore with _$NumberStore;

abstract class _NumberStore with Store {
  final _clock = Stream.periodic(
    const Duration(seconds: 1),
  ).asBroadcastStream();

  _NumberStore() {
    _clock.listen((_) {
      nb++;
    });
  }

  @observable
  int nb = 0;

  @computed
  String get nbInString => 'NB in string: $nb';
}
