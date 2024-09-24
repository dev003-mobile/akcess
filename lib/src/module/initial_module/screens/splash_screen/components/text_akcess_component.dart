import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../../core/presenter/utils/constants/app_name_constants.dart';

class TextAkcessComponent extends StatelessWidget {
  const TextAkcessComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Expanded(
      flex: 0,
      child: Padding(
        padding: EdgeInsets.only(bottom: size.height * .015),
        child: DefaultTextStyle(
          style: AppStyleDesign.fontStyleInter(
            fontWeight: FontWeight.w600,
            size: size.height * .016,
            color: Theme.of(context).colorScheme.onSurface
          ),              
          child: AnimatedTextKit(
            totalRepeatCount: 1,
            isRepeatingAnimation: false,
            animatedTexts: <AnimatedText>[
              WavyAnimatedText(AppNameConstants.appName),
            ],
          ),
        )
      )
    );
  }
}