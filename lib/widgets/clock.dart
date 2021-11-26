import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Clock extends StatelessWidget {
  final DateTime dateTime;

  const Clock({
    Key? key,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.Hms().format(dateTime),
      style: const TextStyle(
        fontSize: 24,
        // fontWeight: FontWeight.bold,
      ),
    );
  }
}
