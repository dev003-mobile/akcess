import 'package:flutter/material.dart';

class AppThemeDesign {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: const Color(0XFF440890),
      selectionColor: const Color(0XFF440890).withOpacity(.4),
      selectionHandleColor: const Color(0XFF440890)
    ),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: Color(0XFF440890),
      onPrimary: Color(0XFF440890),
      secondary: Color(0XFF440890),
      onSecondary: Color(0XFF440890),
      tertiary: Color(0xFFFFFFFF),
      onTertiary:Color(0xFF212121) ,
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF212121),
      onPrimaryContainer: Color(0xFF212121),
      onSecondaryContainer: Color(0XFF000000),
      onTertiaryContainer: Color(0XFF000000),
      onPrimaryFixed: Colors.red,
      onSecondaryFixed: Color(0xFFFFB509),
      onTertiaryFixed: Color(0xFF2FFF14),
    )
  );
  
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFF212121),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: const Color(0xFFFFFFFF),
      selectionColor: const Color(0xFFFFFFFF).withOpacity(.4),
      selectionHandleColor: const Color(0xFFFFFFFF),
    ),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Color(0XFF440890),
      onPrimary: Color(0xFF212121),
      secondary: Color(0xFFFFFFFF),
      onSecondary: Color(0X00000000),
      tertiary: Color(0xFFFFFFFF),
      onTertiary:Color(0xFFFFFFFF),
      surface: Color(0xFF212121),
      onSurface: Color(0xFFFFFFFF),
      onPrimaryContainer: Color(0xFF212121),
      onSecondaryContainer: Color(0XFF440890),
      onTertiaryContainer: Color(0XFF000000),
      onPrimaryFixed: Colors.red,
      onSecondaryFixed: Color(0xFFFFB509),
      onTertiaryFixed: Color(0xFF2FFF14),
    )
  );
}