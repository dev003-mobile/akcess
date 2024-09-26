import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../exports/auth_exports.dart';

class StartNowTextComponent extends StatelessWidget {
  const StartNowTextComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Text(
        AppLocalizations.of(context)!.startNow,
        style: AppStyleDesign.fontStyleInter(
          size: size.height * .035,
          fontWeight: FontWeight.w800,
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