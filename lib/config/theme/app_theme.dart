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

  AppTheme({
    this.selectedColor = 0
  })
  : assert(selectedColor >= 0 && selectedColor < colorList.length, "Color index must be greather than zero and less than ${colorList.length - 1}");

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );
}