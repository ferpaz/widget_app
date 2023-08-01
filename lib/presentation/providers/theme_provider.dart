import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// Un objeto de tipo AppTheme que contiene el color seleccionado y el modo oscuro
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme> (
  (ref) => ThemeNotifier(), // Estado inicial
);

class ThemeNotifier extends StateNotifier<AppTheme> {

  // STATE == Estado == new AppTheme()
  ThemeNotifier() : super (AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColor(int index) {
    state = state.copyWith(selectedColor: index);
  }
}