import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/presenter/common/widgets/card_check_tip_widget.dart';

class CardCheckTipComponent extends StatefulWidget {
  const CardCheckTipComponent({super.key});

  @override
  State<CardCheckTipComponent> createState() => _CardCheckTipComponentState();
}

class _CardCheckTipComponentState extends State<CardCheckTipComponent> with TickerProviderStateMixin {
  final bool isEmailMethod = Get.arguments[0] as bool;

  late Animation<double> _firstAnimation;
  late Animation<double> _thirdAnimation;
  late Animation<double> _secondAnimation;
  late AnimationController _firstController;
  late AnimationController _thirdController;
  late AnimationController _secondController;

  @override
  void initState() {
    super.initState();
    _firstController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _secondController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _thirdController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _firstAnimation = Tween(begin: 0.0, end: -0.015).animate(_firstController);
    _secondAnimation = Tween(begin: 0.0, end: 0.015).animate(_secondController);
    _thirdAnimation = Tween(begin: 0.0, end: -0.025).animate(_thirdController);
    Future.delayed(const Duration(seconds: 4), () => mounted ? _firstController.forward() : null);
    Future.delayed(const Duration(seconds: 5), () => mounted ? _secondController.forward() : null);
    Future.delayed(const Duration(seconds: 6), () => mounted ? _thirdController.forward() : null);
  }

  @override
  void dispose() {
    super.dispose();
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Visibility(
        visible: isEmailMethod,
        replacement: SizedBox(
          height: size.height * .29,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SizedBox(
                child: Material(
                  color: PlatformDispatcher.instance.platformBrightness == Brightness.dark ? 
                    Theme.of(context).colorScheme.secondary.withOpacity(.04) :
                    Theme.of(context).colorScheme.secondary.withOpacity(.07),
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * .3,
                  ),
                ),
              ).animate() 
               .fade(
                delay: const Duration(seconds: 6),
                duration: const Duration(seconds: 1),
                curve: Curves.fastEaseInToSlowEaseOut
                ).then()
                .blur(
                duration: const Duration(seconds: 1),
                curve: Curves.fastEaseInToSlowEaseOut
              ),
              SizedBox(
                height: size.height * .26,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: RotationTransition(
                        turns: _firstAnimation,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: CardCheckTipWidget(
                            icon: LucideIcons.globe2,
                            title: AppLocalizations.of(context)!.networkProblems,
                            description: AppLocalizations.of(context)!.networkProblemsDescription,
                          ),
                        ),
                      ),
                    ).animate()
                      .moveX(
                      begin: -400,
                      delay: const Duration(seconds: 1),
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastEaseInToSlowEaseOut
                    ),
                    SizedBox(
                      child: RotationTransition(
                        turns: _secondAnimation,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CardCheckTipWidget(
                            icon: LucideIcons.smartphone,
                            title: AppLocalizations.of(context)!.correctPhoneNumber,
                            description: AppLocalizations.of(context)!.correctPhoneNumberDescription,
                          ),
                        ),
                      ),
                    ).animate()
                      .moveX(
                      begin: 400,
                      delay: const Duration(seconds: 2),
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastEaseInToSlowEaseOut
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        child: SizedBox(
          height: size.height * .41,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SizedBox(
                child: Material(
                  color: PlatformDispatcher.instance.platformBrightness == Brightness.dark ? 
                    Theme.of(context).colorScheme.secondary.withOpacity(.04) :
                    Theme.of(context).colorScheme.secondary.withOpacity(.07),
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * .42,
                  ),
                ),
              ).animate() 
                .fade(
                delay: const Duration(seconds: 6),
                duration: const Duration(seconds: 1),
                curve: Curves.fastEaseInToSlowEaseOut
                ).then()
                .blur(
                duration: const Duration(seconds: 1),
                curve: Curves.fastEaseInToSlowEaseOut
              ),
              SizedBox(
                height: size.height * .39,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: RotationTransition(
                        turns: _firstAnimation,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: CardCheckTipWidget(
                            icon: LucideIcons.info,
                            title: AppLocalizations.of(context)!.spamOrJunkMail,
                            description: AppLocalizations.of(context)!.spamOrJunkMailDescription,
                          ),
                        ),
                      ),
                    ).animate()
                      .moveX(
                      begin: -400,
                      delay: const Duration(seconds: 1),
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastEaseInToSlowEaseOut
                    ),
                    SizedBox(
                      child: RotationTransition(
                        turns: _secondAnimation,
                        child: Align(
                          alignment: Alignment.center,
                          child: CardCheckTipWidget(
                            icon: LucideIcons.layers,
                            title: AppLocalizations.of(context)!.automaticRulesAndFilters,
                            description: AppLocalizations.of(context)!.automaticRulesAndFiltersDescription,
                          ),
                        ),
                      ),
                    ).animate()
                      .moveX(
                      begin: 400,
                      delay: const Duration(seconds: 2),
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastEaseInToSlowEaseOut
                    ),
                    SizedBox(
                      child: RotationTransition(
                        turns: _thirdAnimation,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: size.height * .02),
                            child: CardCheckTipWidget(
                              icon: LucideIcons.database,
                              title: AppLocalizations.of(context)!.storageLimit,
                              description: AppLocalizations.of(context)!.storageLimitDescription,
                            ),
                          ),
                        ),
                      ),
                    ).animate()
                      .moveX(
                      begin: -400,
                      delay: const Duration(seconds: 3),
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastEaseInToSlowEaseOut
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}