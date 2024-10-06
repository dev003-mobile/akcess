import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../exports/auth_exports.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  final AuthStore _store = GetIt.I.get<AuthStore>();

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 900), () => widget._store.isSelectAuth.value = true);
  }

  @override
  void dispose() {
    super.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
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
          CustomTextfieldWidget(
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            title: AppLocalizations.of(context)!.email,
            onSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocusNode),
          ),
          SizedBox(height: size.height * .025),
          CustomTextfieldWidget(
            obscureText: true,
            obscuringCharacter: '*',
            focusNode: _passwordFocusNode,
            textInputAction: TextInputAction.done,
            title: AppLocalizations.of(context)!.password,
          ),
          SizedBox(height: size.height * .008),
          CheckBoxAndForgotComponent(),
          SizedBox(height: size.height * .035),
          ButtonDefaultWidget(
            onTap: () async {
              widget._store.loading.value = true;
              showDialog(
                context: context,
                barrierDismissible: false,
                barrierColor: Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(.75),
                builder: (_) => const PopScope(
                  canPop: false,
                  child: LoadingWidet()
                )
              );
              await Future.delayed(const Duration(seconds: 5));
              Get.back();
              widget._store.loading.value = false;
            },            
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