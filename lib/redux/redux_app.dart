import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_management/redux/redux_store.dart';
import 'package:state_management/redux/pages/redux_home_page.dart';
import 'package:state_management/redux/pages/redux_settings_page.dart';

import '../main.dart';

final store = Store<AppState>(
  appReducer,
  initialState: AppState(),
);

class ReduxApp extends StatefulWidget {
  const ReduxApp({Key? key}) : super(key: key);

  @override
  State<ReduxApp> createState() => _ReduxAppState();
}

class _ReduxAppState extends State<ReduxApp> {
  final _clock = Stream.periodic(
    const Duration(seconds: 1),
  ).asBroadcastStream();

  @override
  void initState() {
    super.initState();
    _clock.listen((_) {
      store.dispatch(NumberAction.increment);
      store.dispatch(ClockAction.tick);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: '/redux',
          routes: {
            '/redux': (context) => const ReduxHomePage(),
            '/redux/settings': (context) => const ReduxSettingsPage(),
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
