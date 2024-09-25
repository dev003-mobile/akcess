import 'package:flutter/material.dart';

class AuthStore {
  final ValueNotifier<int> authSelectedButton = ValueNotifier(0);
  final ValueNotifier<bool> rememberLogin = ValueNotifier(false);
  final ValueNotifier<bool> hideRegisterButton = ValueNotifier(true);
}