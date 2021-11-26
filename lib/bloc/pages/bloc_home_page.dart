import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/clock_cubit.dart';
import 'package:state_management/bloc/color_cubit.dart';
import 'package:state_management/bloc/number_cubit.dart';
import 'package:state_management/widgets/clock.dart';
import 'package:state_management/widgets/color_setting.dart';
import 'package:state_management/widgets/number.dart';

class BlocHomePage extends StatelessWidget {
  const BlocHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, Color>(builder: (_, selectedColor) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: selectedColor,
          title: const Text('BLoC'),
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
              BlocBuilder<NumberCubit, int>(
                buildWhen: (_, nb) => nb % 2 == 0,
                builder: (_, nb) => Number(nb: nb),
              ),
              BlocSelector<NumberCubit, int, String>(
                selector: (nb) => 'NB: $nb',
                builder: (_, nb) => Text(nb),
              ),
              // BlocListener<NumberCubit, int>(
              //   listenWhen: (_, nb) => nb % 100 == 0,
              //   listener: (context, nb) {
              //     const snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
              //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //   },
              //   child: const Text('Will build each 100'),
              // ),
              BlocConsumer<NumberCubit, int>(
                listenWhen: (_, nb) => nb % 100 == 0,
                listener: (context, nb) {
                  const snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                buildWhen: (_, nb) => nb % 2 == 0,
                builder: (_, nb) =>
                    Text('We are at $nb, will display a snackbar at next 100'),
              ),
              BlocBuilder<ClockCubit, DateTime>(
                builder: (_, clock) {
                  return Clock(
                    dateTime: clock,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ColorSetting(
                color: selectedColor,
                isSelected: false,
                onTap: () => Navigator.pushNamed(context, '/bloc/settings'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
