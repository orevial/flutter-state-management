import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/color_cubit.dart';
import 'package:state_management/models/colors.dart';
import 'package:state_management/widgets/color_setting.dart';

class BlocSettingsPage extends StatelessWidget {
  const BlocSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, Color>(
      builder: (context, selectedColor) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: selectedColor,
            title: const Text("BLoC Settings"),
          ),
          body: ListView.separated(
            padding: const EdgeInsets.all(30),
            separatorBuilder: (_, __) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (_, i) {
              final settings = context.read<ColorCubit>();
              return ColorSetting(
                color: availableColors[i],
                isSelected: selectedColor == availableColors[i],
                onTap: () => settings.updateColor(
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
