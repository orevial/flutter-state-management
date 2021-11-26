import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color _selectedColor = Colors.blue;

  Color get selectedColor => _selectedColor;

  void updateColor(MaterialColor color) {
    _selectedColor = color;
    notifyListeners();
  }
}
