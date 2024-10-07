import 'package:get_it/get_it.dart';

import '../../external/servers/api_server.dart';
import '../../domain/repositories/i_place_repository.dart';
import '../../presenter/utils/clients/http_client_imp.dart';
import '../../../module/auth_module/_stores/auth_store.dart';
import '../../presenter/utils/device_theme/device_theme.dart';
import '../../external/repositories/place_repository_imp.dart';
import '../../domain/usecases/place_usecases/get_places_usecase.dart';
import '../../../module/auth_module/_stores/check_your_otp_store.dart';
import '../../../module/auth_module/_stores/finish_sign_up_store.dart';
import '../../../module/auth_module/_stores/verification_otp_store.dart';
import '../../../module/auth_module/_stores/redefine_password_store.dart';
import '../../../module/auth_module/_stores/forgot_email_method_store.dart';
import '../../external/datasources/remote/place_remote_datasource_imp.dart';
import '../../../module/auth_module/_stores/choose_forgot_method_store.dart';
import '../../external/datasources/contracts/i_place_contract_datasource.dart';
import '../../../module/auth_module/_stores/forgot_phone_number_method_store.dart';

class LocatorService {
  static Future<void> initialize() async {
    final GetIt locator = GetIt.I;

    locator.registerSingleton<APIServer>(APIServer(HttpClientImp()));
    locator.registerLazySingleton<DeviceTheme>(() => DeviceTheme());

    // ------------------------------ DATASOURCES ------------------------------ //

    locator.registerLazySingleton<IPlaceContractDatasource>(() => PlaceRemoteDatasourceImp(locator()));

    // ------------------------------ REPSITORIES ------------------------------ //

    locator.registerLazySingleton<IPlaceRepository>(() => PlaceRepositoryImp(locator()));

    // ------------------------------ USECASES ------------------------------ //

    locator.registerLazySingleton<GetPlacesUsecase>(() => GetPlacesUsecase(locator()));

    // ------------------------------ STORES ------------------------------ //

    locator.registerLazySingleton<AuthStore>(() => AuthStore());
    locator.registerLazySingleton<ForgotEmailMethodStore>(() => ForgotEmailMethodStore());
    locator.registerLazySingleton<ChooseForgotMethodStore>(() => ChooseForgotMethodStore());
    locator.registerLazySingleton<ForgotPhoneNumberMethodStore>(() => ForgotPhoneNumberMethodStore());
    locator.registerLazySingleton<VerificationOTPStore>(() => VerificationOTPStore());
    locator.registerLazySingleton<CheckYourOtpStore>(() => CheckYourOtpStore());
    locator.registerLazySingleton<RedefinePasswordStore>(() => RedefinePasswordStore());
    locator.registerLazySingleton<FinishSignUpStore>(() => FinishSignUpStore(locator()));
  }
}