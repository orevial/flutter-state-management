import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/models/colors.dart';
import 'package:state_management/riverpod/pages/riverpod_home_page.dart';
import 'package:state_management/widgets/color_setting.dart';

class RiverpodSettingsPage extends ConsumerWidget {
  const RiverpodSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedColor = ref.watch(colorSettings);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: selectedColor,
        title: const Text("Riverpod settings"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(30),
        separatorBuilder: (_, __) => const SizedBox(
          height: 20,
        ),
        itemBuilder: (_, i) {
          return ColorSetting(
            color: availableColors[i],
            isSelected: selectedColor == availableColors[i],
            onTap: () {
              // colorSettings.
              // ref.read(colorSettings) = availableColors[i];
            },
          );
        },
        itemCount: availableColors.length,
      ),
    );
  }
}
