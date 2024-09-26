import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../exports/auth_exports.dart';

class TextLoginAnotherAccountComponent extends StatelessWidget {
  const TextLoginAnotherAccountComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              height: 0.5,
              width: size.width,
              color: Theme.of(context).colorScheme.onTertiary.withOpacity(.3),
            ),
          ),
          Expanded(
            flex: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .05),
              child: SizedBox(
                child: Text(
                  AppLocalizations.of(context)!.or,
                  style: AppStyleDesign.fontStyleInter(
                    size: size.height * .017,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSurface
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 0.5,
              width: size.width,
              color: Theme.of(context).colorScheme.onTertiary.withOpacity(.3),
            ),
          ),
        ],
      ),
    );
  }
}