import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../auth_exports.dart';

class ShowPopoverComponent extends StatelessWidget {
  ShowPopoverComponent({super.key});

  final AuthStore _store = GetIt.I.get<AuthStore>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Material(
          color: Theme.of(context).colorScheme.secondary,
          child: InkWell(
            onTap: () {
              _store.selectedCountry.value = null;
              Get.back();
            },
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.remove,
                style: AppStyleDesign.fontStyleInter(
                  size: size.height * .013,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.surface
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}