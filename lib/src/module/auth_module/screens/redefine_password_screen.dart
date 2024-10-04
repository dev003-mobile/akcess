import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/presenter/common/widgets/password_strength_widget.dart';
import 'exports/auth_exports.dart';

class RedefinePasswordScreen extends StatefulWidget {
  RedefinePasswordScreen({super.key});

  final RedefinePasswordStore _store = GetIt.I.get<RedefinePasswordStore>();

  @override
  State<RedefinePasswordScreen> createState() => _RedefinePasswordScreenState();
}

class _RedefinePasswordScreenState extends State<RedefinePasswordScreen> {
  @override
  void initState() {
    super.initState();
    widget._store.oldPassword = ValueNotifier<String>("");
    widget._store.newPasswordStrength = ValueNotifier<String>("");
    widget._store.confirmPasswordStrength = ValueNotifier<String>("");
    widget._store.newPassword = ValueNotifier<PasswordStrengthEnum?>(null);
    widget._store.confirmPassword = ValueNotifier<PasswordStrengthEnum?>(null);

    widget._store.oldPasswordFocusNode = FocusNode();
    widget._store.newPasswordFocusNode = FocusNode();
    widget._store.confirmPasswordFocusNode = FocusNode();

    widget._store.oldPasswordEditingController = TextEditingController();
    widget._store.newPasswordEditingController = TextEditingController();
    widget._store.confirmPasswordEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    widget._store.oldPassword.dispose();
    widget._store.newPassword.dispose();
    widget._store.confirmPassword.dispose();
    widget._store.confirmPasswordStrength.dispose();
    widget._store.newPasswordStrength.dispose();

    widget._store.oldPasswordFocusNode.dispose();
    widget._store.newPasswordFocusNode.dispose();
    widget._store.confirmPasswordFocusNode.dispose();

    widget._store.oldPasswordEditingController.dispose();
    widget._store.newPasswordEditingController.dispose();
    widget._store.confirmPasswordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .07
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: size.height * .05),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height * .05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          IconBackWidget(onTap: () => Get.back()),
                          SizedBox(height: size.height * .04),
                          const TitleAndDescriptionRedefinePasswordComponent(),
                          SizedBox(height: size.height * .06),
                          ValueListenableBuilder<String>(
                            valueListenable: widget._store.oldPassword,
                            builder: (_, value, __) {
                              return CustomTextfieldWidget(
                                enableBorder: false,
                                focusNode: widget._store.oldPasswordFocusNode,
                                controller: widget._store.oldPasswordEditingController,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.emailAddress,
                                title: AppLocalizations.of(context)!.oldPassword,
                                fillColor: PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                                  Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                                  Theme.of(context).colorScheme.onSurface.withOpacity(.08),
                                onChanged: (value) => widget._store.oldPassword.value = value,
                              );
                            }
                          ),
                          SizedBox(height: size.height * .032),
                          ValueListenableBuilder<PasswordStrengthEnum?>(
                            valueListenable: widget._store.newPassword,
                            builder: (_, value, __) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    child: CustomTextfieldWidget(
                                      enableBorder: false,
                                      focusNode: widget._store.newPasswordFocusNode,
                                      controller: widget._store.newPasswordEditingController,
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.emailAddress,
                                      title: AppLocalizations.of(context)!.newPassword,
                                      fillColor: PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                                        Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                                        Theme.of(context).colorScheme.onSurface.withOpacity(.08),
                                      onChanged: (value) => widget._store.checkPasswordStrength(
                                        value, 
                                        widget._store.newPassword,
                                        widget._store.newPasswordStrength
                                      ),                                    
                                      suffixIcon: Visibility(
                                        visible: value == PasswordStrengthEnum.high,
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
                                    ),
                                  ),
                                  SizedBox(height: size.height * .015),
                                  ValueListenableBuilder<String>(
                                    valueListenable: widget._store.newPasswordStrength,
                                    builder: (_, value, __) {
                                      return PasswordStrengthWidget(
                                        level: value,
                                        valueListenable: widget._store.newPassword,
                                      );
                                    }
                                  )
                                ],
                              );
                            }
                          ),
                          SizedBox(height: size.height * .032),
                          ValueListenableBuilder<PasswordStrengthEnum?>(
                            valueListenable: widget._store.confirmPassword,
                            builder: (_, value, __) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    child: CustomTextfieldWidget(
                                      enableBorder: false,
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.emailAddress,
                                      focusNode: widget._store.confirmPasswordFocusNode,
                                      title: AppLocalizations.of(context)!.confirmPassword,
                                      controller: widget._store.confirmPasswordEditingController,
                                      fillColor: PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                                        Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                                        Theme.of(context).colorScheme.onSurface.withOpacity(.08),
                                      onChanged: (value) => widget._store.checkPasswordStrength(
                                        value, 
                                        widget._store.confirmPassword,
                                        widget._store.confirmPasswordStrength
                                      ),
                                      suffixIcon: Visibility(
                                        visible: value == PasswordStrengthEnum.high,
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
                                    ),
                                  ),
                                  SizedBox(height: size.height * .015),
                                  ValueListenableBuilder<String>(
                                    valueListenable: widget._store.confirmPasswordStrength,
                                    builder: (_, value, __) {
                                      return PasswordStrengthWidget(
                                        level: value,
                                        valueListenable: widget._store.confirmPassword,
                                      );
                                    }
                                  )
                                ],
                              );
                            }
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height * .165),
                      child: ValueListenableBuilder<String>(
                        valueListenable: widget._store.oldPassword,
                        builder: (_, oldPassword, __) {
                          return ValueListenableBuilder<PasswordStrengthEnum?>(
                            valueListenable: widget._store.newPassword,
                            builder: (_, newPassword, __) {
                              return ValueListenableBuilder<PasswordStrengthEnum?>(
                                valueListenable: widget._store.confirmPassword,
                                builder: (_, confirmPassword, __) {
                                  return ButtonDefaultWidget(
                                    hasAnimation: false,
                                    isActive: oldPassword.isNotEmpty && 
                                      (newPassword == PasswordStrengthEnum.medium || newPassword == PasswordStrengthEnum.high) && 
                                      (confirmPassword == PasswordStrengthEnum.medium || confirmPassword == PasswordStrengthEnum.high),
                                    onTap: () {
                                      widget._store.oldPasswordFocusNode.unfocus();
                                      widget._store.newPasswordFocusNode.unfocus();
                                      widget._store.confirmPasswordFocusNode.unfocus();
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        barrierColor: Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(.75),
                                        builder: (_) => const LoadingWidet()
                                      );
                                      Future.delayed(const Duration(seconds: 5), () {
                                        if (mounted) {
                                          Get.back();
                                          Get.offAllNamed(AppNameRoute.authScreen);
                                        }
                                      });
                                    },
                                    title: AppLocalizations.of(context)!.redefine
                                  ).animate()
                                    .moveY(
                                    begin: 200,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastEaseInToSlowEaseOut
                                  );
                                }
                              );
                            }
                          );
                        }
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}