import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/colors.dart';
import 'package:state_management/provider/color_provider.dart';
import 'package:state_management/widgets/color_setting.dart';

class ProviderSettingsPage extends StatelessWidget {
  const ProviderSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder: (context, settings, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: settings.selectedColor,
            title: const Text("Provider settings"),
          ),
          body: ListView.separated(
            padding: const EdgeInsets.all(30),
            separatorBuilder: (_, __) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (_, i) {
              return ColorSetting(
                color: availableColors[i],
                isSelected: settings.selectedColor == availableColors[i],
                onTap: () => context.read<ColorProvider>().updateColor(
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
