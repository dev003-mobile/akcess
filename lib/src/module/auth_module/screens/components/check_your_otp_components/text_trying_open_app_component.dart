import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../_stores/check_your_otp_store.dart';
import '../../../../../core/presenter/common/design/app_style_design.dart';

class TextTryingOpenAppComponent extends StatefulWidget {
  TextTryingOpenAppComponent({super.key});

  final CheckYourOtpStore _store = GetIt.I.get<CheckYourOtpStore>();

  @override
  State<TextTryingOpenAppComponent> createState() => _TextTryingOpenAppComponentState();
}

class _TextTryingOpenAppComponentState extends State<TextTryingOpenAppComponent> {
  final bool isEmailMethod = Get.arguments[0] as bool;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: Text(
              isEmailMethod ? 
                AppLocalizations.of(context)!.tryOpeningTheMailApplicationToSee :
                AppLocalizations.of(context)!.tryOpeningTheMessagingAppToSee,
              style: AppStyleDesign.fontStyleInter(
                size: size.height * .015,
                fontWeight: FontWeight.w200,
                textOverflow: TextOverflow.clip,
                color: Theme.of(context).colorScheme.onSurface
              ),
            ),
          ),
          SizedBox(height: size.height * .005),
          SizedBox(
            child: InkWell(
              onTap: () async {
                if (isEmailMethod) {
                  await widget._store.openGmail(); 
                }  else {
                  await widget._store.openSmsApp(); 
                }
              },
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .005),
                child: Text(
                  isEmailMethod ? 
                    AppLocalizations.of(context)!.emails :
                    AppLocalizations.of(context)!.messages,
                  style: AppStyleDesign.fontStyleInter(
                    size: size.height * .015,
                    fontWeight: FontWeight.w600,
                    textOverflow: TextOverflow.clip,
                    color: Theme.of(context).colorScheme.secondary
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}