import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../_stores/verification_otp_store.dart';
import '../../../../../core/presenter/common/design/app_style_design.dart';

class ResendOTPCodeComponent extends StatefulWidget {
  ResendOTPCodeComponent({super.key});

  final VerificationOTPStore _store = GetIt.I.get<VerificationOTPStore>();

  @override
  State<ResendOTPCodeComponent> createState() => _ResendOTPCodeComponentState();
}

class _ResendOTPCodeComponentState extends State<ResendOTPCodeComponent> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: Text(
                    AppLocalizations.of(context)!.didntGetACode,
                    style: AppStyleDesign.fontStyleInter(
                      size: size.height * .015,
                      fontWeight: FontWeight.w200,
                      textOverflow: TextOverflow.clip,
                      color: Theme.of(context).colorScheme.onSurface
                    ),
                  ),
                ),
                SizedBox(width: size.width * .02),
                ValueListenableBuilder<int>(
                  valueListenable: widget._store.seconds,
                  builder: (_, value, __) {
                    return SizedBox(
                      child: InkWell(
                        onTap: value > 0 ? null : () {
                          widget._store.firstCodeEditingController.clear();
                          widget._store.secondCodeEditingController.clear();
                          widget._store.thirdCodeEditingController.clear();
                          widget._store.fourthCodeEditingController.clear();
                          
                          widget._store.otp.value = "";
                          widget._store.seconds.value = 30;
                          widget._store.startTimer();
                        },
                        borderRadius: BorderRadius.circular(4),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * .005),
                          child: Text(
                            AppLocalizations.of(context)!.resend,
                            style: AppStyleDesign.fontStyleInter(
                              size: size.height * .015,
                              fontWeight: FontWeight.w600,
                              textOverflow: TextOverflow.clip,
                              color: value > 0 ? 
                                PlatformDispatcher.instance.platformBrightness == Brightness.dark ? 
                                  Theme.of(context).colorScheme.secondary.withOpacity(.1) : 
                                  Theme.of(context).colorScheme.secondary.withOpacity(.3) : 
                                Theme.of(context).colorScheme.secondary
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
          SizedBox(
            child: ValueListenableBuilder<int>(
              valueListenable: widget._store.seconds,
              builder: (_, value, __) {
                return Padding(
                  padding: EdgeInsets.only(right: size.width * .01),
                  child: Text(
                    widget._store.formatTime(value),
                    style: AppStyleDesign.fontStyleInter(
                      size: size.height * .015,
                      fontWeight: FontWeight.w200,
                      textOverflow: TextOverflow.clip,
                      color: Theme.of(context).colorScheme.onSurface
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}