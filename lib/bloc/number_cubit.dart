import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class NumberCubit extends Cubit<int> {
  final _clock = Stream.periodic(
    const Duration(milliseconds: 100),
  ).asBroadcastStream();

  NumberCubit() : super(0) {
    _clock.listen((event) {
      emit((state + 1) % 1000000000);
    });
  }
}
