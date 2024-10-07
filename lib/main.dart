import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";

import "src/core/presenter/app/app_widget.dart";
import "src/core/infra/services/locator_service.dart";
import "src/core/presenter/config/device_global_config.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceGlobalConfig();
  LocatorService.initialize();
  Animate.restartOnHotReload = true;
  runApp(const AppWidget());
}