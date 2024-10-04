import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/utils/constants/app_name_constants.dart';

class TitleAndDescriptionCheckYourOTPComponent extends StatefulWidget {
  const TitleAndDescriptionCheckYourOTPComponent({super.key});

  @override
  State<TitleAndDescriptionCheckYourOTPComponent> createState() => _TitleAndDescriptionCheckYourOTPComponentState();
}

class _TitleAndDescriptionCheckYourOTPComponentState extends State<TitleAndDescriptionCheckYourOTPComponent> {
  final bool isEmailMethod = Get.arguments[0] as bool;
  final String yourAddress = Get.arguments[1] as String;

  final String currentLocale = PlatformDispatcher.instance.locale.toString();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
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
    );
  }
}