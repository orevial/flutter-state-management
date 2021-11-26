import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/clock_provider.dart';
import 'package:state_management/provider/color_provider.dart';
import 'package:state_management/provider/number2_provider.dart';
import 'package:state_management/provider/number_provider.dart';
import 'package:state_management/widgets/clock.dart';
import 'package:state_management/widgets/color_setting.dart';

class ProviderHomePage extends StatelessWidget {
  const ProviderHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final firstNb = context.select((NumberProvider np) => np.number);
    return Consumer<ColorProvider>(
      builder: (_, colorProvider, __) => Scaffold(
        appBar: AppBar(
          backgroundColor: colorProvider.selectedColor,
          title: const Text('Provider'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/home');
                },
                icon: const Icon(Icons.home))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Selector<NumberProvider, int>(
                selector: (_, np) => np.number,
                // shouldRebuild: (nbBefore, nbNow) => nbNow % 2 == 0,
                builder: (_, firstNb, __) => Text(
                    'Nb 1: $firstNb\nNb 2: ${context.read<NumberProvider>().secondNumber}'),
              ),
              Text(
                  'Nb from value provider: ${context.watch<Number2Provider>().value}'),
              Consumer<ClockProvider>(
                builder: (_, clock, ___) {
                  return Clock(
                    dateTime: DateTime.now(),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ColorSetting(
                color: colorProvider.selectedColor,
                isSelected: false,
                onTap: () => Navigator.pushNamed(context, '/provider/settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
