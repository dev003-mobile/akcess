import 'package:get/get.dart';

import 'app_name_route.dart';
import '../../../../module/auth_module/screens/auth_screen.dart';
import '../../../../module/initial_module/screens/splash_screen/splash_screen.dart';

class AppRoutes {
  static List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage(name: AppNameRoute.splashScreen, page: () => SplashScreen()),
    GetPage(name: AppNameRoute.authScreen, page: () => AuthScreen()),
  ];
}