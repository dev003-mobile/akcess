import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/presenter/utils/context/app_context.dart';
import '../../../core/presenter/utils/enums/password_strength_enum.dart';

class RedefinePasswordStore {
  late ValueNotifier<String> oldPassword;
  late ValueNotifier<String> newPasswordStrength;
  late ValueNotifier<String> confirmPasswordStrength;
  late ValueNotifier<PasswordStrengthEnum?> newPassword;
  late ValueNotifier<PasswordStrengthEnum?> confirmPassword;

  late FocusNode oldPasswordFocusNode = FocusNode();
  late FocusNode newPasswordFocusNode = FocusNode();
  late FocusNode confirmPasswordFocusNode = FocusNode();

  late TextEditingController oldPasswordEditingController = TextEditingController();
  late TextEditingController newPasswordEditingController = TextEditingController();
  late TextEditingController confirmPasswordEditingController = TextEditingController();

  bool hasMixedCharacters(String password) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[0-9])');
    return regex.hasMatch(password);
  }

  bool hasStrongCharacters(String password) {
    final regex = RegExp(r'^(?=.*[!@#\$&*~]).{8,}$');    
    return regex.hasMatch(password);
  }

  void checkPasswordStrength(
    String password, 
    ValueNotifier<PasswordStrengthEnum?> notifier,
    ValueNotifier<String?> strengthNotifier
  ) {
    if (password.isEmpty) {
      notifier.value = null;
      strengthNotifier.value = "";
    } else if (password.length < 5 || !hasMixedCharacters(password)) {
      notifier.value = PasswordStrengthEnum.low;
      strengthNotifier.value = AppLocalizations.of(AppContext.navigatorKey.currentContext!)!.weak;
    } else if (password.length >= 9 && hasMixedCharacters(password) && hasStrongCharacters(password)) {
      notifier.value = PasswordStrengthEnum.high;
      strengthNotifier.value = AppLocalizations.of(AppContext.navigatorKey.currentContext!)!.strong;
    } else if (password.length >= 6 && hasMixedCharacters(password)) {
      notifier.value = PasswordStrengthEnum.medium;
      strengthNotifier.value = AppLocalizations.of(AppContext.navigatorKey.currentContext!)!.medium;
    }
  }
}