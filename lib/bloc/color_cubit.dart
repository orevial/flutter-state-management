import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ColorCubit extends Cubit<Color> {
  ColorCubit() : super(Colors.blue);

  void updateColor(Color newColor) => emit(newColor);
}
