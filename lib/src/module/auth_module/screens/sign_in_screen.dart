import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'auth_exports.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomTextfieldWidget(title: AppLocalizations.of(context)!.email),
          SizedBox(height: size.height * .025),
          CustomTextfieldWidget(title: AppLocalizations.of(context)!.password),
          SizedBox(height: size.height * .008),
          CheckBoxAndForgotComponent(),
          SizedBox(height: size.height * .035),
          ButtonDefaultWidget(
            onTap: () {},
            title: AppLocalizations.of(context)!.signIn
          ),
          SizedBox(height: size.height * .025),
          const TextLoginAnotherAccountComponent(),
          SizedBox(height: size.height * .025),
          ButtonGoogleWidget(
            onTap: () {},
            title: AppLocalizations.of(context)!.continueWithGoogle
          )
        ],
      ),
    );
  }
}