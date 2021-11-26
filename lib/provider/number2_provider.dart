import 'package:flutter/cupertino.dart';

class Number2Provider extends ValueNotifier {
  final _clock = Stream.periodic(
    const Duration(seconds: 1),
  ).asBroadcastStream();

  Number2Provider() : super(100) {
    _clock.listen((_) {
      value++;
      notifyListeners();
    });
  }
}
