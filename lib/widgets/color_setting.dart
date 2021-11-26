import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const _displaySize = 60.0;

class ColorSetting extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final void Function() onTap;

  const ColorSetting({
    Key? key,
    required this.color,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: isSelected ? Border.all(color: Colors.black, width: 5) : null,
        ),
        width: _displaySize,
        height: _displaySize,
      ),
    );
  }
}
