import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/clock_cubit.dart';
import 'package:state_management/bloc/color_cubit.dart';
import 'package:state_management/bloc/number_cubit.dart';
import 'package:state_management/bloc/pages/bloc_home_page.dart';
import 'package:state_management/bloc/pages/bloc_settings_page.dart';

import '../main.dart';

class BlocApp extends StatelessWidget {
  const BlocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ColorCubit>(create: (_) => ColorCubit()),
          BlocProvider<ClockCubit>(create: (_) => ClockCubit()),
          BlocProvider<NumberCubit>(create: (_) => NumberCubit()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: '/bloc',
          routes: {
            '/bloc': (context) => const BlocHomePage(),
            '/bloc/settings': (context) => const BlocSettingsPage(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == "/home") {
              return PageRouteBuilder(
                settings: settings,
                pageBuilder: (_, __, ___) => const MyApp(),
              );
            }
          },
        ));
  }
}
