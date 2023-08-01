import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.indigo,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.orange,
  Colors.purple,
  Colors.deepPurple,
];

class AppTheme {

  final int selectedColor;
  late final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    bool? isDarkMode
  })
  : assert(selectedColor >= 0 && selectedColor < colorList.length, "Color index must be greather than zero and less than ${colorList.length - 1}")
  {
    this.isDarkMode = isDarkMode ?? WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
  }

  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode
  })
    => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode
    );

  ThemeData getTheme()
    => ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: false
      )
    );
}