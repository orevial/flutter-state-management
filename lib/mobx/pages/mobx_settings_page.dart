import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management/bloc/color_cubit.dart';
import 'package:state_management/mobx/mobx_app.dart';
import 'package:state_management/models/colors.dart';
import 'package:state_management/widgets/color_setting.dart';

class MobXSettingsPage extends StatelessWidget {
  const MobXSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: colorSettings.color,
            title: const Text("MobX Settings"),
          ),
          body: ListView.separated(
            padding: const EdgeInsets.all(30),
            separatorBuilder: (_, __) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (_, i) {
              return ColorSetting(
                color: availableColors[i],
                isSelected: colorSettings.color == availableColors[i],
                onTap: () => colorSettings.updateSelectedColor(
                  availableColors[i],
                ),
              );
            },
            itemCount: availableColors.length,
          ),
        );
      },
    );
  }
}
