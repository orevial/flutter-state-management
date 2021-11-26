import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:state_management/models/colors.dart';
import 'package:state_management/redux/redux_app.dart';
import 'package:state_management/redux/redux_store.dart';
import 'package:state_management/widgets/color_setting.dart';

class ReduxSettingsPage extends StatelessWidget {
  const ReduxSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Number: ${store.state.number}');
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: state.color,
          title: const Text("Redux settings"),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(30),
          separatorBuilder: (_, __) => const SizedBox(
            height: 20,
          ),
          itemBuilder: (_, i) {
            return ColorSetting(
              color: availableColors[i],
              isSelected: state.color == availableColors[i],
              onTap: () => store.dispatch(
                UpdateColorAction(availableColors[i]),
              ),
            );
          },
          itemCount: availableColors.length,
        ),
      ),
    );
  }
}
