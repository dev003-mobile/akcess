import 'package:flutter/services.dart';

class DeviceGlobalConfig {
  DeviceGlobalConfig() {
    setStatusBarColor();
    setVerticalOrientation();
  }

  Future<void> setVerticalOrientation() async => 
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  void setStatusBarColor({Color? color, Brightness? iconBrightness = Brightness.dark }) =>
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    
  )); 
}