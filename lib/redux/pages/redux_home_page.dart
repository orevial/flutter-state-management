import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management/redux/redux_store.dart';
import 'package:state_management/widgets/clock.dart';
import 'package:state_management/widgets/color_setting.dart';

class ReduxHomePage extends StatelessWidget {
  const ReduxHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: state.color,
          title: const Text('Redux'),
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
              Text('Nb from value provider: ${state.number}'),
              Clock(
                dateTime: state.clock,
              ),
              const SizedBox(
                height: 20,
              ),
              ColorSetting(
                color: state.color,
                isSelected: false,
                onTap: () => Navigator.pushNamed(context, '/redux/settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
