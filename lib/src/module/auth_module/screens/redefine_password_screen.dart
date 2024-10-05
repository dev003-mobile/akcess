import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/presenter/common/widgets/custom_toast_widget.dart';
import 'exports/auth_exports.dart';

class RedefinePasswordScreen extends StatefulWidget {
  RedefinePasswordScreen({super.key});

  final RedefinePasswordStore _store = GetIt.I.get<RedefinePasswordStore>();

  @override
  State<RedefinePasswordScreen> createState() => _RedefinePasswordScreenState();
}

class _RedefinePasswordScreenState extends State<RedefinePasswordScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget._store.loadingPasswordReset = ValueNotifier<bool>(false);

    widget._store.oldPasswordHasFocus = ValueNotifier<bool>(false);
    widget._store.newPasswordHasFocus = ValueNotifier<bool>(false);
    widget._store.confirmPasswordHasFocus = ValueNotifier<bool>(false);

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

    widget._store.oldPasswordFocusNode.addListener(() {
      widget._store.oldPasswordHasFocus.value = widget._store.oldPasswordFocusNode.hasFocus;
      Future.delayed(const Duration(milliseconds: 500), () => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent, 
        curve: Curves.fastEaseInToSlowEaseOut,
        duration: const Duration(milliseconds: 300), 
      ));
    });
    widget._store.newPasswordFocusNode.addListener(() {
      widget._store.newPasswordHasFocus.value = widget._store.newPasswordFocusNode.hasFocus;
      Future.delayed(const Duration(milliseconds: 500), () => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent, 
        curve: Curves.fastEaseInToSlowEaseOut,
        duration: const Duration(milliseconds: 300), 
      ));
    });
    widget._store.confirmPasswordFocusNode.addListener(() {  
      widget._store.confirmPasswordHasFocus.value = widget._store.confirmPasswordFocusNode.hasFocus;
      Future.delayed(const Duration(milliseconds: 500), () => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent, 
        curve: Curves.fastEaseInToSlowEaseOut,
        duration: const Duration(milliseconds: 300), 
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget._store.loadingPasswordReset.dispose();

    widget._store.oldPassword.dispose();
    widget._store.newPassword.dispose();
    widget._store.confirmPassword.dispose();
    widget._store.newPasswordStrength.dispose();
    widget._store.confirmPasswordStrength.dispose();

    widget._store.oldPasswordFocusNode.dispose();
    widget._store.newPasswordFocusNode.dispose();
    widget._store.confirmPasswordFocusNode.dispose();

    widget._store.oldPasswordHasFocus.dispose();
    widget._store.newPasswordHasFocus.dispose();
    widget._store.confirmPasswordHasFocus.dispose();

    widget._store.oldPasswordEditingController.dispose();
    widget._store.newPasswordEditingController.dispose();
    widget._store.confirmPasswordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: ValueListenableBuilder<bool>(
        valueListenable: widget._store.loadingPasswordReset,
        builder: (_, isLoading, __) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (value, __) => value ? null : isLoading ? null : showModalBottomSheet(
              context: context,
              isDismissible: true,
              scrollControlDisabledMaxHeightRatio: size.height * .38,
              backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(.0),
              builder: (_) => LogoutModalWidget(
                onTap: () => Get.until((_) => Get.currentRoute == AppNameRoute.chooseForgotMethodScreen),
                buttonText: AppLocalizations.of(context)!.toContinue,
                title: AppLocalizations.of(context)!.wantToCancelTheReset,
                description: AppLocalizations.of(context)!.wantToCancelTheResetDescription,
              )
            ),
            child: SafeArea(
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .07),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          padding: EdgeInsets.only(bottom: size.height * .02),
                          child: Padding(
                            padding: EdgeInsets.only(top: size.height * .05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                IconBackWidget(onTap: () => showModalBottomSheet(
                                  context: context,
                                  isDismissible: true,
                                  scrollControlDisabledMaxHeightRatio: size.height * .38,
                                  backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(.0),
                                  builder: (_) => LogoutModalWidget(
                                    onTap: () => Get.until((_) => Get.currentRoute == AppNameRoute.chooseForgotMethodScreen),
                                    buttonText: AppLocalizations.of(context)!.toContinue,
                                    title: AppLocalizations.of(context)!.wantToCancelTheReset,
                                    description: AppLocalizations.of(context)!.wantToCancelTheResetDescription,
                                  )
                                )),
                                SizedBox(height: size.height * .04),
                                const TitleAndDescriptionRedefinePasswordComponent(),
                                SizedBox(height: size.height * .06),
                                ValueListenableBuilder<String>(
                                  valueListenable: widget._store.oldPassword,
                                  builder: (_, value, __) {
                                    return CustomTextfieldWidget(
                                      enableBorder: false,
                                      textInputAction: TextInputAction.next,
                                      focusNode: widget._store.oldPasswordFocusNode,
                                      title: AppLocalizations.of(context)!.oldPassword,
                                      controller: widget._store.oldPasswordEditingController,
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
                                            textInputAction: TextInputAction.next,
                                            focusNode: widget._store.newPasswordFocusNode,
                                            title: AppLocalizations.of(context)!.newPassword,
                                            controller: widget._store.newPasswordEditingController,
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
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: widget._store.oldPasswordHasFocus,
                        builder: (_, oldPasswordHasFocus, __) {
                          return ValueListenableBuilder<bool>(
                            valueListenable: widget._store.newPasswordHasFocus,
                            builder: (_, newPasswordHasFocus, __) {
                              return ValueListenableBuilder<bool>(
                                valueListenable: widget._store.confirmPasswordHasFocus,
                                builder: (_, confirmPasswordHasFocus, __) {
                                  return Visibility(
                                    visible: oldPasswordHasFocus || newPasswordHasFocus || confirmPasswordHasFocus,
                                    replacement: SizedBox(
                                      child: ValueListenableBuilder<String>(
                                        valueListenable: widget._store.oldPassword,
                                        builder: (_, oldPassword, __) {
                                          return ValueListenableBuilder<PasswordStrengthEnum?>(
                                            valueListenable: widget._store.newPassword,
                                            builder: (_, newPassword, __) {
                                              return ValueListenableBuilder<PasswordStrengthEnum?>(
                                                valueListenable: widget._store.confirmPassword,
                                                builder: (_, confirmPassword, __) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(bottom: size.height * .05),
                                                    child: ButtonDefaultWidget(
                                                      hasAnimation: false,
                                                      isActive: oldPassword.isNotEmpty && 
                                                        (newPassword == PasswordStrengthEnum.medium || newPassword == PasswordStrengthEnum.high) && 
                                                        (confirmPassword == PasswordStrengthEnum.medium || confirmPassword == PasswordStrengthEnum.high),
                                                      onTap: () async {
                                                        widget._store.oldPasswordFocusNode.unfocus();
                                                        widget._store.newPasswordFocusNode.unfocus();
                                                        widget._store.confirmPasswordFocusNode.unfocus();
                                                        widget._store.loadingPasswordReset.value = true;
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
                                                        CustomToastWidget.showToast(
                                                          // ignore: use_build_context_synchronously
                                                          context: context,
                                                          // ignore: use_build_context_synchronously
                                                          title: AppLocalizations.of(context)!.passwordChanged
                                                        );
                                                        await Future.delayed(const Duration(seconds: 3), () { 
                                                          if (mounted) Get.until((_) => Get.currentRoute == AppNameRoute.authScreen);  
                                                          widget._store.loadingPasswordReset.value = false;
                                                        });
                                                      },
                                                      title: AppLocalizations.of(context)!.redefine
                                                    ).animate()
                                                     .moveY(
                                                      begin: 200,
                                                      duration: const Duration(seconds: 1),
                                                      curve: Curves.fastEaseInToSlowEaseOut
                                                    ),
                                                  );
                                                }
                                              );
                                            }
                                          );
                                        }
                                      ),
                                    ),
                                    child: const SizedBox()
                                  );
                                }
                              );
                            }
                          );
                        }
                      ),
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