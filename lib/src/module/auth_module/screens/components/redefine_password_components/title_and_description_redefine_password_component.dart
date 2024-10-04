import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';

class TitleAndDescriptionRedefinePasswordComponent extends StatefulWidget {
  const TitleAndDescriptionRedefinePasswordComponent({super.key});

  @override
  State<TitleAndDescriptionRedefinePasswordComponent> createState() => _TitleAndDescriptionRedefinePasswordComponentState();
}

class _TitleAndDescriptionRedefinePasswordComponentState extends State<TitleAndDescriptionRedefinePasswordComponent> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            child: Text(
              AppLocalizations.of(context)!.resetYourPassword,
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
              AppLocalizations.of(context)!.resetYourPasswordDescription,
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