import 'package:flutter/material.dart';
import 'package:country_currency_pickers/country.dart';

class AuthStore {
  final ValueNotifier<int> authSelectedButton = ValueNotifier(0);
  final ValueNotifier<bool> rememberLogin = ValueNotifier(false);
  final ValueNotifier<bool> hideRegisterButton = ValueNotifier(true);
  final ValueNotifier<Country?> selectedCountry = ValueNotifier(null);
}
