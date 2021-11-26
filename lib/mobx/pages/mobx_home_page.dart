import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management/mobx/clock_store.dart';
import 'package:state_management/mobx/mobx_app.dart';
import 'package:state_management/mobx/number_store.dart';
import 'package:state_management/widgets/clock.dart';
import 'package:state_management/widgets/color_setting.dart';
import 'package:state_management/widgets/number.dart';

final numberStore = NumberStore();
final clockStore = ClockStore();

class MobXHomePage extends StatelessWidget {
  const MobXHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: colorSettings.color,
          title: const Text('MobX'),
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
              Observer(
                builder: (_) => Number(nb: numberStore.nb),
              ),
              Observer(
                builder: (_) => Text(numberStore.nbInString),
              ),
              Observer(
                builder: (_) => Clock(
                  dateTime: clockStore.datetime,
                ),
              ),
              // BlocBuilder<NumberCubit, int>(
              //   buildWhen: (_, nb) => nb % 2 == 0,
              //   builder: (_, nb) => Number(nb: nb),
              // ),
              // BlocSelector<NumberCubit, int, String>(
              //   selector: (nb) => 'NB: $nb',
              //   builder: (_, nb) => Text(nb),
              // ),
              // // BlocListener<NumberCubit, int>(
              // //   listenWhen: (_, nb) => nb % 100 == 0,
              // //   listener: (context, nb) {
              // //     const snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
              // //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
              // //   },
              // //   child: const Text('Will build each 100'),
              // // ),
              // BlocConsumer<NumberCubit, int>(
              //   listenWhen: (_, nb) => nb % 100 == 0,
              //   listener: (context, nb) {
              //     const snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
              //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //   },
              //   buildWhen: (_, nb) => nb % 2 == 0,
              //   builder: (_, nb) =>
              //       Text('We are at $nb, will display a snackbar at next 100'),
              // ),
              // BlocBuilder<ClockCubit, DateTime>(
              //   builder: (_, clock) {
              //     return Clock(
              //       dateTime: clock,
              //     );
              //   },
              // ),
              const SizedBox(
                height: 20,
              ),
              ColorSetting(
                color: colorSettings.color,
                isSelected: false,
                onTap: () => Navigator.pushNamed(context, '/mobx/settings'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
