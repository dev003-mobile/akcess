import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../exports/forgot_phone_number_method_exports.dart';

class ShowPopoverPhoneComponent extends StatelessWidget {
  ShowPopoverPhoneComponent({super.key});

  final ForgotPhoneNumberMethodStore _store = GetIt.I.get<ForgotPhoneNumberMethodStore>();

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
              _store.phoneNumberSelectedCountry.value = null;
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