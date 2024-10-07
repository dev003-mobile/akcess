import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../exports/auth_exports.dart';
import 'add_data_sign_up_screen.dart';
import 'choose_your_picture_screen.dart';

class FinishSignUpScreen extends StatefulWidget {
  FinishSignUpScreen({super.key});

  final FinishSignUpStore _store = GetIt.I.get<FinishSignUpStore>();

  @override
  State<FinishSignUpScreen> createState() => _FinishSignUpScreenState();
}

class _FinishSignUpScreenState extends State<FinishSignUpScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    widget._store.currentPage = ValueNotifier<int>(1);
    widget._store.birthDate = ValueNotifier<DateTime>(DateTime.now());
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    widget._store.birthDate.dispose();
    widget._store.currentPage.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (_, __) => showModalBottomSheet(
          context: context,
          isDismissible: true,
          scrollControlDisabledMaxHeightRatio: size.height * .38,
          backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(.0),
          builder: (_) => LogoutModalWidget(
            onTap: () => Get.offNamed(AppNameRoute.authScreen),
            title: AppLocalizations.of(context)!.unsubscribe,
            buttonText: AppLocalizations.of(context)!.yesCancel,
            description: AppLocalizations.of(context)!.unsubscribeDescription,
          )
        ), 
        child: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ValueListenableBuilder<int>(
                      valueListenable: widget._store.currentPage,
                      builder: (_, value, __) {
                        return TweenAnimationBuilder<double>(
                          curve: Curves.fastOutSlowIn,
                          duration: const Duration(seconds: 1),
                          tween: Tween<double>(begin: 0.0, end: value / 3),
                          builder: (_, value, __) {
                            return LinearProgressIndicator(
                              value: value,
                              minHeight: size.height * .004,
                              valueColor: AlwaysStoppedAnimation<Color?>(Theme.of(context).colorScheme.secondary),
                              backgroundColor: PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                                Theme.of(context).colorScheme.onSurface.withOpacity(.05) :
                                Theme.of(context).colorScheme.onSurface.withOpacity(.15),
                            );
                          }
                        );
                      }
                    ),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * .005),
                    child: PageView(
                      controller: _pageController,
                      allowImplicitScrolling: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        AddDataSignUpScreen(),
                        ChooseYourPictureScreen(),
                        Container(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * .07,
                        right: size.width * .07,
                        bottom: size.height * .05,
                      ),
                      child: ValueListenableBuilder<int>(
                        valueListenable: widget._store.currentPage,
                        builder: (_, value, __) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 0,
                                child: Visibility(
                                  visible: value > 1,
                                  child: ButtonCircleWidget(
                                    onTap: () async {
                                      if (value > 1) {
                                        if (mounted) {
                                          widget._store.currentPage.value = widget._store.currentPage.value - 1;
                                          await _pageController.previousPage(
                                            duration: const Duration(seconds: 1), 
                                            curve: Curves.fastEaseInToSlowEaseOut
                                          );
                                        }
                                      }
                                    },
                                    icon: LucideIcons.moveLeft,
                                  ).animate()
                                   .moveX(
                                    begin: -200,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastEaseInToSlowEaseOut
                                  ),
                                )
                              ),
                              Expanded(
                                flex: 0,
                                child: Visibility(
                                  visible: value < 3,
                                  child: ButtonCircleWidget(
                                    onTap: () async {
                                      if (value < 3) {
                                        if (mounted) {
                                          widget._store.currentPage.value = widget._store.currentPage.value + 1;
                                          await _pageController.nextPage(
                                            duration: const Duration(milliseconds: 1500), 
                                            curve: Curves.fastEaseInToSlowEaseOut
                                          );
                                        }
                                      }
                                    },
                                  ).animate()
                                   .moveX(
                                    begin: 200,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastEaseInToSlowEaseOut
                                  ),
                                )
                              ),
                            ],
                          );
                        }
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}