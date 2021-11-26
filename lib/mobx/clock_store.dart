import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'clock_store.g.dart';

class ClockStore = _ClockStore with _$ClockStore;

abstract class _ClockStore with Store {
  final _clock = Stream.periodic(
    const Duration(seconds: 1),
  ).asBroadcastStream();

  @observable
  DateTime datetime = DateTime.now();

  _ClockStore() {
    _clock.listen((_) {
      datetime = DateTime.now();
    });
  }
}
