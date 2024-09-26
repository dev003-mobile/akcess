import 'package:flutter/material.dart';
import 'package:diacritic/diacritic.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/countries.dart';

class ForgotPhoneNumberMethodStore {
  late ValueNotifier<String> phoneNumber;
  late ValueNotifier<Country?> phoneNumberSelectedCountry;

  final List<Country> countries = List.from(countryList)
    ..sort((a, b) => removeDiacritics(a.name!).compareTo(removeDiacritics(b.name!)));
}