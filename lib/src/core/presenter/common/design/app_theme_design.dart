import 'package:flutter/material.dart';

class AppThemeDesign {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      onSurface: Color(0xFF212121)
    )
  );
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      onSurface: Color(0xFFFFFFFF)
    )
  );
}