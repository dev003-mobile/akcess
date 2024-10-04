import 'package:flutter/material.dart';
import 'package:diacritic/diacritic.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/countries.dart';

class AuthStore {
  final ValueNotifier<bool> isSelectAuth = ValueNotifier<bool>(true);
  final ValueNotifier<int> authSelectedButton = ValueNotifier<int>(0);
  final ValueNotifier<bool> rememberLogin = ValueNotifier<bool>(false);
  final ValueNotifier<bool> hideRegisterButton = ValueNotifier<bool>(true);
  final ValueNotifier<Country?> selectedCountry = ValueNotifier<Country?>(null);

  final List<Country> countries = List.from(countryList)
    ..sort((a, b) => removeDiacritics(a.name!).compareTo(removeDiacritics(b.name!)));
}