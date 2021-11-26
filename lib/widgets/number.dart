import 'package:flutter/widgets.dart';

class Number extends StatelessWidget {
  final int nb;

  const Number({
    Key? key,
    required this.nb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      nb.toString(),
      style: const TextStyle(
        fontSize: 24,
        // fontWeight: FontWeight.bold,
      ),
    );
  }
}
