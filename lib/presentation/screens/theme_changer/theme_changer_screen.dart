

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'Theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              // ref.read(isDarkModeProvider.notifier)
              // .update((state) => !state);
              ref.read(themeNotifierProvider.notifier)
              .toggleDarkMode();

            },
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;
    // final int selectedColor = ref.watch(selectedIndexColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index, 
          groupValue: selectedColor, 
          onChanged: (value) {
            // ref.read(selectedIndexColorProvider.notifier).state = index;
            ref.watch(themeNotifierProvider.notifier)
            .changeColorIndex(index);
          }
        );
      }
    );
  }
}