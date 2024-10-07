import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../exports/auth_exports.dart';

class ChooseYourPictureScreen extends StatefulWidget {
  const ChooseYourPictureScreen({super.key});

  @override
  State<ChooseYourPictureScreen> createState() => _ChooseYourPictureScreenState();
}

class _ChooseYourPictureScreenState extends State<ChooseYourPictureScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * .04,
                  left: size.width * .07,
                  right: size.width * .07
                ),
                child: Text(
                  AppLocalizations.of(context)!.chooseAPhoto,
                  style: AppStyleDesign.fontStyleInter(
                    size: size.height * .035,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onSurface
                  ),
                ),
              ),
            ).animate()
             .fadeIn(
              curve: Curves.fastEaseInToSlowEaseOut,
              duration: const Duration(milliseconds: 1500), 
            ),
            SizedBox(height: size.height * .06),
          ],
        ),
      ),
    );
  }
}