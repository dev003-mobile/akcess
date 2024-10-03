import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';


class TitleAndDescriptionOTPComponent extends StatelessWidget {
  const TitleAndDescriptionOTPComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            child: Text(
              AppLocalizations.of(context)!.verificationCode,
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
            child: Text(
              AppLocalizations.of(context)!.verificationCodeDescription,
              style: AppStyleDesign.fontStyleInter(
                size: size.height * .015,
                fontWeight: FontWeight.w400,
                textOverflow: TextOverflow.clip,
                color: Theme.of(context).colorScheme.onSurface
              ),
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