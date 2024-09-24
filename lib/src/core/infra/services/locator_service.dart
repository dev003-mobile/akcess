import 'package:get_it/get_it.dart';

import '../../external/servers/api_server.dart';
import '../../presenter/utils/clients/http_client_imp.dart';
import '../../presenter/utils/device_theme/device_theme.dart';

class LocatorService {
  static Future<void> initialize() async {
    final GetIt locator = GetIt.I;

    locator.registerSingleton<APIServer>(APIServer(HttpClientImp()));
 
    locator.registerLazySingleton<DeviceTheme>(() => DeviceTheme());
  }
}