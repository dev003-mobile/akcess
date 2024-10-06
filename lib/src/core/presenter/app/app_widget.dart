import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../common/routes/app_routes.dart';
import '../utils/context/app_context.dart';
import '../common/routes/app_name_route.dart';
import '../common/design/app_theme_design.dart';
import '../utils/constants/app_name_constants.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: GetMaterialApp(
        enableLog: true,
        theme: PlatformDispatcher.instance.platformBrightness == Brightness.light ? 
          AppThemeDesign.lightTheme : AppThemeDesign.darkTheme,
        getPages: AppRoutes.routes,
        title: AppNameConstants.appName,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fadeIn,
        navigatorKey: AppContext.navigatorKey,
        initialRoute: AppNameRoute.splashScreen,
        transitionDuration: const Duration(milliseconds: 300),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}