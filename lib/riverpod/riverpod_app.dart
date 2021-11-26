import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/riverpod/pages/riverpod_home_page.dart';
import 'package:state_management/riverpod/pages/riverpod_settings_page.dart';

import '../main.dart';

class RiverpodApp extends StatelessWidget {
  const RiverpodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/riverpod',
      routes: {
        '/riverpod': (context) => const RiverpodHomePage(),
        '/riverpod/settings': (context) => const RiverpodSettingsPage(),
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
