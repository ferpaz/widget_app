import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:widgets_app/presentation/providers/providers.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static String screenName = 'Theme Changer Screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer Screen'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            onPressed: () => ref.read(isDarkModeProvider.notifier).state = !isDarkMode
          ),
        ],
      ),
      body: const _ThemeChangerView()
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colorList = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder:(context, index) {
        final color = colorList[index];

        return RadioListTile(
          title: Text('Color #${color.value.toRadixString(16).toUpperCase()}', style: TextStyle(color: color),),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            ref.read(selectedColorProvider.notifier).state = value ?? 0;
          }
        );
      },
    );
  }
}