import 'package:flutter/material.dart';
import 'package:diacritic/diacritic.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/countries.dart';

class AuthStore {
  late ValueNotifier<bool> loading;
  late ValueNotifier<bool> isValidBI;

  late ValueNotifier<bool> isSelectAuth;
  late ValueNotifier<bool> rememberLogin;
  late ValueNotifier<int> authSelectedButton;
  late ValueNotifier<bool> hideRegisterButton;
  late ValueNotifier<Country?> selectedCountry;

  final List<Country> countries = List.from(countryList)
    ..sort((a, b) => removeDiacritics(a.name!).compareTo(removeDiacritics(b.name!)));
}