import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    widget._store.buttonIsActive = ValueNotifier<bool>(false);
    Future.delayed(const Duration(seconds: 6), () => mounted ? widget._store.buttonIsActive.value = true : null);
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
                      IconBackWidget(onTap: () => Get.back()),
                      SizedBox(height: size.height * .04),
                      const TitleAndDescriptionCheckYourOTPComponent(),
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
                      const CardCheckTipComponent()
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    children: <Widget>[
                      TextTryingOpenAppComponent(),
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
