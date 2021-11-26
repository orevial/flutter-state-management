import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_management/mobx/color_store.dart';
import 'package:state_management/mobx/pages/mobx_home_page.dart';
import 'package:state_management/mobx/pages/mobx_settings_page.dart';
import 'package:state_management/provider/clock_provider.dart';
import 'package:state_management/provider/color_provider.dart';
import 'package:state_management/provider/number2_provider.dart';
import 'package:state_management/provider/number_provider.dart';
import 'package:state_management/provider/pages/provider_home_page.dart';
import 'package:state_management/provider/pages/provider_settings_page.dart';

import '../main.dart';

final colorSettings = ColorSettings();

class MobXApp extends StatelessWidget {
  const MobXApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/mobx',
      routes: {
        '/mobx': (context) => const MobXHomePage(),
        '/mobx/settings': (context) => const MobXSettingsPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/home") {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => const MyApp(),
          );
        }
      },
    );
  }
}
