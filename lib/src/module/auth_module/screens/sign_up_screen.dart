import 'package:get_it/get_it.dart';
import 'package:popover/popover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'exports/auth_exports.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  final AuthStore _store = GetIt.I.get<AuthStore>();

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget._store.hideRegisterButton.value = false;
    Future.delayed(const Duration(milliseconds: 900), () => widget._store.isSelectAuth.value = true);
  }

  @override
  void dispose() {
    super.dispose();
    _userNameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
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
            focusNode: _userNameFocusNode,
            title: AppLocalizations.of(context)!.userName,
            onSubmitted: (_) => FocusScope.of(context).requestFocus(_phoneNumberFocusNode),
          ),
          SizedBox(height: size.height * .025),
          ValueListenableBuilder<Country?>(
            valueListenable: widget._store.selectedCountry,
            builder: (_, ___, __) {
              return Stack(
                children: <Widget>[
                  CustomTextfieldWidget(
                    focusNode: _phoneNumberFocusNode,
                    keyboardType: TextInputType.number,
                    title: AppLocalizations.of(context)!.phoneNumber,
                    prefixIcon: GestureDetector(
                      onLongPress: widget._store.selectedCountry.value != null ? () {
                        _userNameFocusNode.unfocus();
                        _phoneNumberFocusNode.unfocus();
                        _emailFocusNode.unfocus();
                        _passwordFocusNode.unfocus();
                        showPopover(
                          context: context,
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          bodyBuilder: (context) => ShowPopoverComponent(),
                          onPop: () {},
                          width: size.width * .25,
                          height: size.height * .035,
                          arrowDxOffset: size.width * .05,
                          contentDxOffset: -(size.height * .32),
                          contentDyOffset: -(size.height * .32),
                          direction: PopoverDirection.bottom,
                          transition: PopoverTransition.scale,
                        );
                      } : null,
                      onTap: () => showModalBottomSheet(
                        context: context,
                        enableDrag: false,
                        isDismissible: false,
                        isScrollControlled: true,
                        backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(.0),
                        builder: (_) => const ChooseYourCountryComponent()
                      ),
                      child: DropButtonCountryComponent()
                    ),
                    onSubmitted: (_) => FocusScope.of(context).requestFocus(_emailFocusNode),
                  ),
                ],
              );
            }
          ),
          SizedBox(height: size.height * .025),
          CustomTextfieldWidget(
            focusNode: _emailFocusNode,
            title: AppLocalizations.of(context)!.email,
            onSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocusNode),
          ),
          SizedBox(height: size.height * .025),
          CustomTextfieldWidget(
            focusNode: _passwordFocusNode,
            title: AppLocalizations.of(context)!.password,
            textInputAction: TextInputAction.done,
          ),
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
                 .moveY(
                  begin: 200,
                  curve: Curves.fastEaseInToSlowEaseOut,
                  duration: const Duration(milliseconds: 500),
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