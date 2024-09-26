import 'package:flutter/material.dart';
import 'package:diacritic/diacritic.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/countries.dart';

class AuthStore {
  final ValueNotifier<int> authSelectedButton = ValueNotifier(0);
  final ValueNotifier<bool> rememberLogin = ValueNotifier(false);
  final ValueNotifier<bool> hideRegisterButton = ValueNotifier(true);
  final ValueNotifier<bool> isSelectAuth = ValueNotifier(true);

  final ValueNotifier<Country?> selectedCountry = ValueNotifier(null);

  final ValueNotifier<int?> forgotOptionSelect = ValueNotifier(null);

  final ValueNotifier<bool> isValidEmail = ValueNotifier(false);

  final List<Country> countries = List.from(countryList)
    ..sort((a, b) => removeDiacritics(a.name!).compareTo(removeDiacritics(b.name!)));
}