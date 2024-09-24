import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../common/routes/app_routes.dart';
import '../utils/context/app_context.dart';
import '../common/routes/app_name_route.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: GetMaterialApp(
        enableLog: true,
        getPages: AppRoutes.routes,
        // title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        navigatorKey: AppContext.navigatorKey,
        initialRoute: AppNameRoute.splashScreen,
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}