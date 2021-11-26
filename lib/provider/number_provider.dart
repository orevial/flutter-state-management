import 'package:flutter/cupertino.dart';

class NumberProvider extends ChangeNotifier {
  int _number = 0;
  int _secondNumber = 0;

  final _clock = Stream.periodic(
    const Duration(seconds: 1),
  ).asBroadcastStream();

  final _otherClock = Stream.periodic(
    const Duration(milliseconds: 10),
  ).asBroadcastStream();

  int get number => _number;
  int get secondNumber => _secondNumber;

  NumberProvider() {
    _clock.listen((_) {
      _number++;
      notifyListeners();
    });
    _otherClock.listen((_) {
      _secondNumber++;
      notifyListeners();
    });
  }
}
