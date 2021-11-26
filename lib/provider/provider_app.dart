import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/clock_provider.dart';
import 'package:state_management/provider/color_provider.dart';
import 'package:state_management/provider/number2_provider.dart';
import 'package:state_management/provider/number_provider.dart';
import 'package:state_management/provider/pages/provider_home_page.dart';
import 'package:state_management/provider/pages/provider_settings_page.dart';

import '../main.dart';

class ProviderApp extends StatelessWidget {
  const ProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ColorProvider()),
          ChangeNotifierProvider(create: (context) => ClockProvider()),
          ChangeNotifierProvider(create: (context) => NumberProvider()),
          ChangeNotifierProvider(create: (context) => Number2Provider())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: '/provider',
          routes: {
            '/provider': (context) => const ProviderHomePage(),
            '/provider/settings': (context) => const ProviderSettingsPage(),
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
