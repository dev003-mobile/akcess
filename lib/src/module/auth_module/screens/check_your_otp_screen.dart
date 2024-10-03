import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'exports/auth_exports.dart';

class CheckYourOTPScreen extends StatefulWidget {
  CheckYourOTPScreen({super.key});

  final CheckYourOtpStore _store = GetIt.I.get<CheckYourOtpStore>();

  @override
  State<CheckYourOTPScreen> createState() => _CheckYourOTPScreenState();
}

class _CheckYourOTPScreenState extends State<CheckYourOTPScreen> with TickerProviderStateMixin {
  final bool isEmailMethod = Get.arguments[0] as bool;
  final String yourAddress = Get.arguments[1] as String;

  final String currentLocale = PlatformDispatcher.instance.locale.toString();
  late Animation<double> _firstAnimation;
  late Animation<double> _thirdAnimation;
  late Animation<double> _secondAnimation;
  late AnimationController _firstController;
  late AnimationController _thirdController;
  late AnimationController _secondController;

  @override
  void initState() {
    super.initState();
    widget._store.buttonIsActive = ValueNotifier<bool>(false);
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
    Future.delayed(const Duration(seconds: 4), () => _firstController.forward());
    Future.delayed(const Duration(seconds: 5), () => _secondController.forward());
    Future.delayed(const Duration(seconds: 6), () => _thirdController.forward());
    Future.delayed(const Duration(seconds: 6), () => widget._store.buttonIsActive.value = true);
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
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * .05,
              horizontal: size.width * .07
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconBackWidget(onTap: () => Get.back()),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * .04),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              child: Text(
                                isEmailMethod ? 
                                  AppLocalizations.of(context)!.checkYourEmail : 
                                  AppLocalizations.of(context)!.checkYourMessages,
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: AppStyleDesign.fontStyleInter(
                                  size: size.height * .035,
                                  fontWeight: FontWeight.w800,
                                  textOverflow: TextOverflow.clip,
                                  color: Theme.of(context).colorScheme.onSurface
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * .01),
                            SizedBox(
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                style: AppStyleDesign.fontStyleInter(
                                  size: size.height * .015,
                                  fontWeight: FontWeight.w400,
                                  textOverflow: TextOverflow.clip,
                                  color: Theme.of(context).colorScheme.onSurface
                                ),                                  
                                children: <TextSpan>[
                                    TextSpan(
                                      text: isEmailMethod ? 
                                        AppLocalizations.of(context)!.checkYourEmailDescription1 : 
                                        AppLocalizations.of(context)!.checkYourMessagesDescription1
                                    ),
                                    if (currentLocale == AppNameConstants.enUS && isEmailMethod) TextSpan(
                                      text: " ${yourAddress.split('@')[0].length >= 3 ? yourAddress.substring(0, 3) : yourAddress.substring(0)}✱✱✱✱✱✱✱✱✱@${yourAddress.split('@')[1]}.",
                                      style: AppStyleDesign.fontStyleInter(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    if (currentLocale == AppNameConstants.enUS && !isEmailMethod) TextSpan(
                                      text: " ${yourAddress.length >= 9 ? yourAddress.substring(0, 3) : yourAddress.substring(0)}✱✱✱✱✱✱${yourAddress.substring(yourAddress.length - 2)}.",
                                      style: AppStyleDesign.fontStyleInter(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    if (currentLocale != AppNameConstants.enUS && isEmailMethod) TextSpan(
                                      text: " ${yourAddress.split('@')[0].length >= 3 ? yourAddress.substring(0, 3) : yourAddress.substring(0)}✱✱✱✱✱✱✱✱✱@${yourAddress.split('@')[1]}.",
                                      style: AppStyleDesign.fontStyleInter(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    if (currentLocale != AppNameConstants.enUS && !isEmailMethod) TextSpan(
                                      text: " ${yourAddress.length >= 9 ? yourAddress.substring(0, 3) : yourAddress.substring(0)}✱✱✱✱✱✱${yourAddress.substring(yourAddress.length - 2)}.",
                                      style: AppStyleDesign.fontStyleInter(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    if (currentLocale != AppNameConstants.enUS) TextSpan(
                                      text: isEmailMethod ? 
                                        " ${AppLocalizations.of(context)!.checkYourEmailDescription2}" :
                                        " ${AppLocalizations.of(context)!.checkYourMessagesDescription2}"
                                    ),
                                  ] 
                                )
                              ),
                            )
                          ],
                        ).animate()
                         .moveX(
                          begin: -200,
                          curve: Curves.fastEaseInToSlowEaseOut,
                          duration: const Duration(seconds: 1), 
                        ),
                      ),
                      SizedBox(height: size.height * .05),
                      SizedBox(
                        child: Text(
                          AppLocalizations.of(context)!.ifYouDontReceiveTheOTP,
                          textAlign: TextAlign.left,
                          style: AppStyleDesign.fontStyleInter(
                            size: size.height * .015,
                            fontWeight: FontWeight.w400,
                            textOverflow: TextOverflow.clip,
                            color: Theme.of(context).colorScheme.onSurface
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * .02),
                      SizedBox(
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
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              child: Text(
                                isEmailMethod ? 
                                  AppLocalizations.of(context)!.tryOpeningTheMailApplicationToSee :
                                  AppLocalizations.of(context)!.tryOpeningTheMessagingAppToSee,
                                style: AppStyleDesign.fontStyleInter(
                                  size: size.height * .015,
                                  fontWeight: FontWeight.w200,
                                  textOverflow: TextOverflow.clip,
                                  color: Theme.of(context).colorScheme.onSurface
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * .005),
                            SizedBox(
                              child: InkWell(
                                onTap: () async {
                                  if (isEmailMethod) {
                                    await widget._store.openGmail(); 
                                  }  else {
                                    await widget._store.openSmsApp(); 
                                  }
                                },
                                borderRadius: BorderRadius.circular(4),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * .005),
                                  child: Text(
                                    isEmailMethod ? 
                                      AppLocalizations.of(context)!.emails :
                                      AppLocalizations.of(context)!.messages,
                                    style: AppStyleDesign.fontStyleInter(
                                      size: size.height * .015,
                                      fontWeight: FontWeight.w600,
                                      textOverflow: TextOverflow.clip,
                                      color: Theme.of(context).colorScheme.secondary
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                      SizedBox(height: size.height * .045),
                      SizedBox(
                        child: ValueListenableBuilder<bool>(
                          valueListenable: widget._store.buttonIsActive,
                          builder: (_, value, __) {
                            return ButtonDefaultWidget(
                              isActive: value,
                              hasAnimation: false,
                              onTap: () => Get.offNamed(AppNameRoute.verificationOTPScreen),
                              title: AppLocalizations.of(context)!.toContinue
                            ).animate()
                             .moveY(
                              begin: 200,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastEaseInToSlowEaseOut
                            );
                          }
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );  
  }
}
