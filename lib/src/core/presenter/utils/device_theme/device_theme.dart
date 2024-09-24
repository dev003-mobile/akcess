import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DeviceTheme {
  ThemeData? _currentTheme;

  DeviceTheme() {
    _currentTheme = PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
      ThemeData.dark() : ThemeData.light();
  }

  ThemeData get currentTheme => _currentTheme!;

  void updateTheme(Brightness brightness) {
    _currentTheme = brightness == Brightness.dark ? ThemeData.dark() : ThemeData.light();
  }
}