import 'package:flutter/cupertino.dart';

class ClockProvider extends ChangeNotifier {
  final _seconds = Stream.periodic(
    const Duration(seconds: 1),
  ).asBroadcastStream();

  ClockProvider() {
    _seconds.listen((_) => notifyListeners());
  }
}
