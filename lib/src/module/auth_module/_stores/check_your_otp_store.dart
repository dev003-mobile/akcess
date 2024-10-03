import 'package:flutter/foundation.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/presenter/utils/context/app_context.dart';

class CheckYourOtpStore {
  late ValueNotifier<bool> buttonIsActive;

  Future<void> openGmail() async {
    try {
      await InstalledApps.startApp('com.google.android.gm');
    } catch (e) {
      throw Exception(AppLocalizations.of(AppContext.navigatorKey.currentContext!)!.unableToOpenGmail);
    }
  }

  Future<void> openSmsApp() async {
    try {
      await InstalledApps.startApp('com.google.android.apps.messaging');           
    } catch (e) {
      throw Exception(AppLocalizations.of(AppContext.navigatorKey.currentContext!)!.unableToOpenMessages);
    }
  }
}