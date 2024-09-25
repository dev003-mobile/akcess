import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../auth_exports.dart';

class StartDescriptionComponent extends StatelessWidget {
  const StartDescriptionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Text(
        AppLocalizations.of(context)!.startDescription,
        style: AppStyleDesign.fontStyleInter(
          size: size.height * .015,
          fontWeight: FontWeight.w400,
          textOverflow: TextOverflow.clip,
          color: Theme.of(context).colorScheme.onSurface
        ),
      ),
    ).animate()
      .fadeIn(
      curve: Curves.fastEaseInToSlowEaseOut,
      duration: const Duration(milliseconds: 1500), 
    );
  }
}