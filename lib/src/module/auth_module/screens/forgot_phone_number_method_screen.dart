import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:popover/popover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:country_currency_pickers/country.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'exports/forgot_phone_number_method_exports.dart';

class ForgotPhoneNumberMethodScreen extends StatefulWidget {
  ForgotPhoneNumberMethodScreen({super.key});

  final ForgotPhoneNumberMethodStore _store = GetIt.I.get<ForgotPhoneNumberMethodStore>();

  @override
  State<ForgotPhoneNumberMethodScreen> createState() => _ForgotPhoneNumberMethodScreenState();
}

class _ForgotPhoneNumberMethodScreenState extends State<ForgotPhoneNumberMethodScreen> {
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget._store.phoneNumber = ValueNotifier<String>("");
    widget._store.phoneNumberSelectedCountry = ValueNotifier<Country?>(null);
  }

  @override
  void dispose() {
    super.dispose();
    _phoneNumberFocusNode.dispose();
    widget._store.phoneNumber.dispose();
    widget._store.phoneNumberSelectedCountry.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * .05,
            horizontal: size.width * .07
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              SizedBox(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconBackWidget(onTap: () => {widget._store.phoneNumberSelectedCountry.value = null, Get.back()}),
                      SizedBox(height: size.height * .04),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              child: Text(
                                AppLocalizations.of(context)!.enterPhoneNumber,
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
                                AppLocalizations.of(context)!.enterPhoneNumberDescription,
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
                      ValueListenableBuilder<Country?>(
                        valueListenable: widget._store.phoneNumberSelectedCountry,
                        builder: (_, ___, __) {
                          return Stack(
                            children: <Widget>[
                              CustomTextfieldWidget(
                                focusNode: _phoneNumberFocusNode,
                                keyboardType: TextInputType.number,
                                controller: _phoneNumberController,
                                textInputAction: TextInputAction.done,
                                title: AppLocalizations.of(context)!.phoneNumber,
                                onChanged: (value) => widget._store.phoneNumber.value = value,
                                fillColor: PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                                  Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                                  Theme.of(context).colorScheme.onSurface.withOpacity(.08),
                                prefixIcon: GestureDetector(
                                  onLongPress: widget._store.phoneNumberSelectedCountry.value != null ? () {
                                    _phoneNumberFocusNode.unfocus();
                                    showPopover(
                                      context: context,
                                      backgroundColor: Theme.of(context).colorScheme.secondary,
                                      bodyBuilder: (context) => ShowPopoverPhoneComponent(),
                                      onPop: () {},
                                      width: size.width * .25,
                                      height: size.height * .035,
                                      arrowDxOffset: size.width * .05,
                                      contentDxOffset: -(size.height * .62),
                                      contentDyOffset: -(size.height * .62),
                                      direction: PopoverDirection.bottom,
                                      transition: PopoverTransition.scale,
                                    );
                                  } : null,
                                  onTap: () => showModalBottomSheet(
                                    context: context,
                                    enableDrag: false,
                                    isDismissible: false,
                                    isScrollControlled: true,
                                    backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(.0),
                                    builder: (_) => const ChooseYourCountryPhoneComponent()
                                  ),
                                  child: DropButtonCountryPhoneComponent(
                                    color: Theme.of(context).colorScheme.onSurface.withOpacity(.05),
                                  )
                                ),
                              ),
                            ],
                          );
                        }
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: ValueListenableBuilder<Country?>(
                  valueListenable: widget._store.phoneNumberSelectedCountry,
                  builder: (_, value, __) {
                    return ValueListenableBuilder<String>(
                      valueListenable: widget._store.phoneNumber,
                      builder: (_, phoneNumber, __) {
                        return ButtonDefaultWidget(
                          hasAnimation: false,
                          onTap: () {
                            _phoneNumberFocusNode.unfocus();
                            Get.offNamed(
                              AppNameRoute.checkYourOtpScreen,
                              arguments: [false, _phoneNumberController.text]
                            );
                          },
                          title: AppLocalizations.of(context)!.send,
                          isActive: value != null && phoneNumber.trim().isNotEmpty,
                        ).animate()
                          .moveY(
                          begin: 200,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastEaseInToSlowEaseOut
                        );
                      }
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}