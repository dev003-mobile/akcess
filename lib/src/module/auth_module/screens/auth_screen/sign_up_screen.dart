import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/services.dart';
import 'package:popover/popover.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../exports/auth_exports.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  final AuthStore _store = GetIt.I.get<AuthStore>();

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _biFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();

  final TextEditingController _biController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget._store.hideRegisterButton.value = false;
    Future.delayed(const Duration(milliseconds: 900), () => widget._store.isSelectAuth.value = true);
  }

  @override
  void dispose() {
    super.dispose();
    _biFocusNode.dispose();
    _emailFocusNode.dispose();
    _userNameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();

    _biController.dispose();
    _emailController.dispose();
    _userNameController.dispose();
    _phoneNumberController.dispose();
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
            controller: _userNameController,
            title: AppLocalizations.of(context)!.userName,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: size.height * .025),
          CustomTextfieldWidget(
            focusNode: _emailFocusNode,
            controller: _emailController,
            title: AppLocalizations.of(context)!.email,
            textInputAction: TextInputAction.next,
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
                    controller: _phoneNumberController,
                    title: AppLocalizations.of(context)!.phoneNumber,
                    prefixIcon: GestureDetector(
                      onLongPress: widget._store.selectedCountry.value != null ? () {
                        _biFocusNode.unfocus();
                        _emailFocusNode.unfocus();
                        _userNameFocusNode.unfocus();
                        _phoneNumberFocusNode.unfocus();
                        showPopover(
                          context: context,
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          bodyBuilder: (context) => ShowPopoverComponent(),
                          onPop: () {},
                          width: size.width * .25,
                          height: size.height * .035,
                          arrowDxOffset: size.width * .05,
                          contentDxOffset: -(size.height * .32),
                          contentDyOffset: -(size.height * .20),
                          direction: PopoverDirection.bottom,
                          transition: PopoverTransition.scale,
                        );
                      } : null,
                      onTap: () {
                        _biFocusNode.unfocus();
                        _emailFocusNode.unfocus();
                        _userNameFocusNode.unfocus();
                        _phoneNumberFocusNode.unfocus();
                        showModalBottomSheet(
                          context: context,
                          enableDrag: false,
                          isDismissible: false,
                          isScrollControlled: true,
                          backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(.0),
                          builder: (_) => const ChooseYourCountryComponent()
                        );
                      },
                      child: DropButtonCountryComponent()
                    ),
                    onSubmitted: (_) => FocusScope.of(context).requestFocus(_biFocusNode),
                  ),
                ],
              );
            }
          ),
          SizedBox(height: size.height * .025),
          ValueListenableBuilder<bool>(
            valueListenable: widget._store.isValidBI,
            builder: (_, value, __) {
              return CustomTextfieldWidget(
                focusNode: _biFocusNode,
                controller: _biController,
                textInputAction: TextInputAction.done,
                title: AppLocalizations.of(context)!.identityCard,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(14)
                ],
                onChanged: (value) {
                  if (value.trim().length == 14) FocusScope.of(context).unfocus();
                  widget._store.isValidBI.value = BIValidation.isValidBI(value);
                },
                suffixIcon: Visibility(
                  visible: value,
                  child: Icon(
                    size: size.height * .02,
                    LucideIcons.checkCircle,
                    color: Theme.of(context).colorScheme.secondary,
                  ).animate()
                   .scaleXY(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastEaseInToSlowEaseOut
                  ).then()
                   .rotate().then()
                ),
              );
            }
          ),
          SizedBox(height: size.height * .03),
          ValueListenableBuilder<bool>(
            valueListenable: widget._store.hideRegisterButton,
            builder: (_, value, __) {
              return ValueListenableBuilder<Country?>(
                valueListenable: widget._store.selectedCountry,
                builder: (_, selectedCountry, __) {
                  return Visibility(
                    visible: value,
                    replacement: ButtonDefaultWidget(
                      onTap: () async {
                        _biFocusNode.unfocus();
                        _emailFocusNode.unfocus();
                        _userNameFocusNode.unfocus();
                        _phoneNumberFocusNode.unfocus();
                        widget._store.loading.value = true;
                        if (_userNameController.text.trim().split(" ").length < 2) {
                        // ignore: use_build_context_synchronously
                          return CustomToastWidget.showToast(context: context, title: AppLocalizations.of(context)!.enterYourFullName, type: TypeToastEnum.failure);  
                        } 
                        if (!EmailValidation.isValidEmail(_emailController.text)) {
                        // ignore: use_build_context_synchronously
                          return CustomToastWidget.showToast(context: context, title: AppLocalizations.of(context)!.invalidEmailAddress, type: TypeToastEnum.failure);  
                        } 
                        if (selectedCountry == null) {
                        // ignore: use_build_context_synchronously
                          return CustomToastWidget.showToast(context: context, title: AppLocalizations.of(context)!.selectACountry, type: TypeToastEnum.failure);  
                        }
                        if (_phoneNumberController.text.isEmpty) {
                        // ignore: use_build_context_synchronously
                          return CustomToastWidget.showToast(context: context, title: AppLocalizations.of(context)!.enterPhoneNumber, type: TypeToastEnum.failure);  
                        } 
                        if (!BIValidation.isValidBI(_biController.text)) {
                        // ignore: use_build_context_synchronously
                          return CustomToastWidget.showToast(context: context, title: AppLocalizations.of(context)!.invalidIdentityCard, type: TypeToastEnum.failure);
                        }  
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
                        Get.offAllNamed(AppNameRoute.finishSignUpScreen);
                        widget._store.loading.value = false;
                      },
                      title: AppLocalizations.of(context)!.toContinue
                    ).animate()
                     .moveY(
                      begin: 200,
                      curve: Curves.fastEaseInToSlowEaseOut,
                      duration: const Duration(milliseconds: 500),
                     ),
                    child: const SizedBox(),
                  );
                }
              );
            }
          ),
        ],
      ),
    );
  }
}