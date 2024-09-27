import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'exports/choose_forgot_method_exports.dart';

class ChooseForgotMethodScreen extends StatefulWidget {
  ChooseForgotMethodScreen({super.key});

  final ChooseForgotMethodStore _store = GetIt.I.get<ChooseForgotMethodStore>();

  @override
  State<ChooseForgotMethodScreen> createState() => _ChooseForgotMethodScreenState();
}

class _ChooseForgotMethodScreenState extends State<ChooseForgotMethodScreen> {
  @override
  void initState() {
    super.initState();
    widget._store.forgotOptionSelect = ValueNotifier<int?>(null);
  }

  @override
  void dispose() {
    super.dispose();
    widget._store.forgotOptionSelect.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * .05,
              horizontal: size.width * .07
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconBackWidget(onTap: () => {widget._store.forgotOptionSelect.value = null, Get.back()}),
                      SizedBox(height: size.height * .04),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              child: Text(
                                AppLocalizations.of(context)!.selectAnOption,
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
                                AppLocalizations.of(context)!.selectAnOptionDescription,
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
                      ),
                      SizedBox(height: size.height * .06),
                      ValueListenableBuilder<int?>(
                        valueListenable: widget._store.forgotOptionSelect,
                        builder: (_, value, __) {
                          return ContainerForgotOptionComponent(
                            isSelected: value == 0,
                            title: AppLocalizations.of(context)!.email,
                            onTap: () => widget._store.forgotOptionSelect.value = 0,
                          );
                        }
                      ),
                      SizedBox(height: size.height * .02),
                      ValueListenableBuilder<int?>(
                        valueListenable: widget._store.forgotOptionSelect,
                        builder: (_, value, __) {
                          return ContainerForgotOptionComponent(
                            isSelected: value == 1,
                            title: AppLocalizations.of(context)!.messageOTP,
                            onTap: () => widget._store.forgotOptionSelect.value = 1,
                          );
                        }
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: ValueListenableBuilder<int?>(
                    valueListenable: widget._store.forgotOptionSelect,
                    builder: (_, value, __) {
                      return ButtonDefaultWidget(
                        onTap: () {
                          if (value == 0) Get.toNamed(AppNameRoute.forgotEmailMethodScreen);
                          if (value == 1) Get.toNamed(AppNameRoute.forgotPhoneNumberMethodScreen);
                        },
                        hasAnimation: false,
                        isActive: value != null,
                        title: AppLocalizations.of(context)!.toContinue
                      ).animate()
                       .moveY(
                        begin: 200,
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastEaseInToSlowEaseOut
                      );
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}