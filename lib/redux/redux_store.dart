import 'package:flutter/material.dart';

class UpdateColorAction {
  final Color color;

  UpdateColorAction(this.color);
}

enum ClockAction {
  tick,
}

enum NumberAction {
  increment,
}

class AppState {
  Color color = Colors.blue;
  DateTime clock = DateTime.now();
  int number = 0;

  AppState();

  AppState.withValues({
    required this.color,
    required this.clock,
    required this.number,
  });

  AppState copyWith({
    Color? color,
    DateTime? clock,
    int? number,
  }) {
    return AppState.withValues(
      color: color ?? this.color,
      clock: clock ?? this.clock,
      number: number ?? this.number,
    );
  }
}

AppState appReducer(AppState previousState, dynamic action) {
  if (action is UpdateColorAction) {
    return previousState.copyWith(color: action.color);
  } else if (action is ClockAction) {
    return previousState.copyWith(clock: DateTime.now());
  } else if (action is NumberAction) {
    return previousState.copyWith(number: previousState.number + 1);
  }
  return previousState;
}
