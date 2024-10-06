import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../exports/auth_exports.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});

  final AuthStore _store = GetIt.I.get<AuthStore>();

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    widget._store.loading = ValueNotifier<bool>(false);
    widget._store.isValidBI = ValueNotifier<bool>(false);
    widget._store.isSelectAuth = ValueNotifier<bool>(true);
    widget._store.authSelectedButton = ValueNotifier<int>(0);
    widget._store.rememberLogin = ValueNotifier<bool>(false);
    widget._store.hideRegisterButton = ValueNotifier<bool>(true);
    widget._store.selectedCountry = ValueNotifier<Country?>(null);
  }

  @override
  void dispose() {
    super.dispose();
    widget._store.loading.dispose();
    widget._store.isValidBI.dispose();
    widget._store.isSelectAuth.dispose();
    widget._store.rememberLogin.dispose();
    widget._store.selectedCountry.dispose();
    widget._store.authSelectedButton.dispose();
    widget._store.hideRegisterButton.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: ValueListenableBuilder<bool>(
        valueListenable: widget._store.loading,
        builder: (_, loading, __) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (value, __) => value ? null : loading ? null : showModalBottomSheet(
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
          );
        }
      ),
    );
  }
}