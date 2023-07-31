import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Determina si la aplicación usa el modo oscuro
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// Color seleccionado para el tema de la aplicación
final selectedColorProvider = StateProvider<int>((ref) => 0);