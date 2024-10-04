import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'exports/auth_exports.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});

  final AuthStore _store = GetIt.I.get<AuthStore>();
  final DeviceTheme _deviceTheme = GetIt.I.get<DeviceTheme>();

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    setState(() => widget._deviceTheme.updateTheme(PlatformDispatcher.instance.platformBrightness));
  }

  @override
  void dispose() {
    super.dispose();
    widget._store.isSelectAuth.dispose();
    widget._store.rememberLogin.dispose();
    widget._store.selectedCountry.dispose();
    widget._store.authSelectedButton.dispose();
    widget._store.hideRegisterButton.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (_, __) => showModalBottomSheet(
          context: context,
          isDismissible: true,
          scrollControlDisabledMaxHeightRatio: size.height * .38,
          backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(.0),
          builder: (_) => LogoutModalWidget(
            onTap: () => exit(0),
            buttonText: AppLocalizations.of(context)!.close,
            title: AppLocalizations.of(context)!.logoutAppTitle,
            description: AppLocalizations.of(context)!.logoutAppDescription,
          )
        ),
        child: SafeArea(
          child: Animate(
            effects: const <Effect>[FadeEffect(
              curve: Curves.fastEaseInToSlowEaseOut
            )],
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                children: <Widget>[
                  AuthBgComponent(),
                  AuthBgComponent(),
                  Align(alignment: Alignment.bottomLeft, child: AuthBgComponent()),
                  const ContentAuthComponent(),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}