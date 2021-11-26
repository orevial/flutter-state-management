import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/widgets/clock.dart';
import 'package:state_management/widgets/color_setting.dart';

final clockProvider = Provider((_) => DateTime.now());
final numberProvider = Provider((_) => 0);

// final colorSettings = ChangeNotifierProvider((_) => ColorSettings());
final colorSettings = StateNotifierProvider<ColorsSettings2, Color>((_) {
  return ColorsSettings2();
});

// class ColorSettings extends ChangeNotifier {
//   var color = Colors.blue;
//
//   ColorSettings() : super();
//
//   void updateSelectedColor(MaterialColor color) {
//     this.color = color;
//     notifyListeners();
//   }
// }

class ColorsSettings2 extends StateNotifier<Color> {
  ColorsSettings2() : super(Colors.blue);

  void updateSelectedColor(Color color) {
    state = color;
  }
}

class RiverpodHomePage extends ConsumerWidget {
  const RiverpodHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref
        .watch(colorSettings);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: selectedColor,
        title: const Text('Riverpod'),
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
            Text('Nb from value provider: ${ref.watch(numberProvider)}'),
            Clock(
              dateTime: ref.watch(clockProvider),
            ),
            const SizedBox(
              height: 20,
            ),
            ColorSetting(
              color: selectedColor,
              isSelected: false,
              onTap: () => Navigator.pushNamed(context, '/riverpod/settings'),
            ),
          ],
        ),
      ),
    );
  }
}
