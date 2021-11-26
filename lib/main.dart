import 'package:flutter/material.dart';
import 'package:state_management/bloc/bloc_app.dart';
import 'package:state_management/mobx/mobx_app.dart';
import 'package:state_management/provider/provider_app.dart';
import 'package:state_management/redux/redux_app.dart';
import 'package:state_management/riverpod/riverpod_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomePage(),
        '/provider': (context) => const ProviderApp(),
        '/riverpod': (context) => const RiverpodApp(),
        '/redux': (context) => const ReduxApp(),
        '/bloc': (context) => const BlocApp(),
        // '/getx': (context) => GetXApp(),
        // '/binder': (context) => BinderApp(),
        '/mobx': (context) => const MobXApp(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("States Management"),
      ),
      body: ListView(
        children: const [
          MainButton(label: 'provider', route: '/provider'),
          MainButton(label: 'Riverpod', route: '/riverpod'),
          MainButton(label: 'Redux', route: '/redux'),
          MainButton(label: 'BLoC', route: '/bloc'),
          // MainButton(label: 'GetX', route: '/getx'),
          // MainButton(label: 'Binder', route: '/binder'),
          MainButton(label: 'MobX', route: '/mobx'),
        ],
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  final String label;
  final String route;

  const MainButton({Key? key, required this.label, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, route);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: const TextStyle(fontSize: 25),
            ),
          )),
    );
  }
}
