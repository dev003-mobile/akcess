import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'auth_exports.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  final AuthStore _store = GetIt.I.get<AuthStore>();

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) widget._store.hideRegisterButton.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomTextfieldWidget(title: AppLocalizations.of(context)!.userName),
          SizedBox(height: size.height * .025),
          CustomTextfieldWidget(title: AppLocalizations.of(context)!.email),
          SizedBox(height: size.height * .025),
          CustomTextfieldWidget(title: AppLocalizations.of(context)!.password),
          SizedBox(height: size.height * .025),
          CustomTextfieldWidget(title: AppLocalizations.of(context)!.confirmPassword),
          SizedBox(height: size.height * .03),
          ValueListenableBuilder<bool>(
            valueListenable: widget._store.hideRegisterButton,
            builder: (_, value, __) {
              return Visibility(
                visible: value,
                replacement: ButtonDefaultWidget(
                  onTap: () {},
                  title: AppLocalizations.of(context)!.signUp
                ).animate()
                 .fadeIn(
                  curve: Curves.fastEaseInToSlowEaseOut,
                  duration: const Duration(milliseconds: 100),
                 ),
                child: const SizedBox(),
              );
            }
          ),
        ],
      ),
    );
  }
}