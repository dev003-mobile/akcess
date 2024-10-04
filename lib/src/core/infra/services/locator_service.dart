import 'package:get_it/get_it.dart';

import '../../external/servers/api_server.dart';
import '../../presenter/utils/clients/http_client_imp.dart';
import '../../../module/auth_module/_stores/auth_store.dart';
import '../../presenter/utils/device_theme/device_theme.dart';
import '../../../module/auth_module/_stores/check_your_otp_store.dart';
import '../../../module/auth_module/_stores/verification_otp_store.dart';
import '../../../module/auth_module/_stores/redefine_password_store.dart';
import '../../../module/auth_module/_stores/forgot_email_method_store.dart';
import '../../../module/auth_module/_stores/choose_forgot_method_store.dart';
import '../../../module/auth_module/_stores/forgot_phone_number_method_store.dart';

class LocatorService {
  static Future<void> initialize() async {
    final GetIt locator = GetIt.I;

    locator.registerSingleton<APIServer>(APIServer(HttpClientImp()));
 
    locator.registerLazySingleton<DeviceTheme>(() => DeviceTheme());

    locator.registerLazySingleton<AuthStore>(() => AuthStore());
    locator.registerLazySingleton<ForgotEmailMethodStore>(() => ForgotEmailMethodStore());
    locator.registerLazySingleton<ChooseForgotMethodStore>(() => ChooseForgotMethodStore());
    locator.registerLazySingleton<ForgotPhoneNumberMethodStore>(() => ForgotPhoneNumberMethodStore());
    locator.registerLazySingleton<VerificationOTPStore>(() => VerificationOTPStore());
    locator.registerLazySingleton<CheckYourOtpStore>(() => CheckYourOtpStore());
    locator.registerLazySingleton<RedefinePasswordStore>(() => RedefinePasswordStore());
  }
}