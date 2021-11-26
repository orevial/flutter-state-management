import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'color_store.g.dart';

class ColorSettings = _ColorSettings with _$ColorSettings;

abstract class _ColorSettings with Store {
  @observable
  Color color = Colors.blue;

  @action
  void updateSelectedColor(Color newColor) {
    color = newColor;
  }
}