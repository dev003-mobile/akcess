import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import '../exports/auth_exports.dart';

class AuthBgComponent extends StatelessWidget {
  AuthBgComponent({super.key});

  final DeviceTheme _deviceTheme = GetIt.I.get<DeviceTheme>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width,
      child: Image.asset(
        fit: BoxFit.cover,
        AppImageConstants.bgAuthImage,
        color: _deviceTheme.currentTheme == ThemeData.light() ? 
          Theme.of(context).colorScheme.primary : null
      )
    );
  }
}