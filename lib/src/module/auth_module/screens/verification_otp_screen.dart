import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'exports/forgot_email_method_exports.dart';

class VerificationOTPScreen extends StatefulWidget {
  VerificationOTPScreen({super.key});

  final VerificationOTPStore _store = GetIt.I.get<VerificationOTPStore>();

  @override
  State<VerificationOTPScreen> createState() => _VerificationOTPScreenState();
}

class _VerificationOTPScreenState extends State<VerificationOTPScreen> {
  final FocusNode _firstCodeFocusNode = FocusNode();
  final FocusNode _secondCodeFocusNode = FocusNode();
  final FocusNode _thirdCodeFocusNode = FocusNode();
  final FocusNode _fourthCodeFocusNode = FocusNode();

  final TextEditingController _firstCodeEditingController = TextEditingController();
  final TextEditingController _secondCodeEditingController = TextEditingController();
  final TextEditingController _thirdCodeEditingController = TextEditingController();
  final TextEditingController _fourthCodeEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget._store.startTimer();
    widget._store.seconds = ValueNotifier<int>(90);
  }

  @override
  void dispose() {
    super.dispose();
    widget._store.timer?.cancel();
    _firstCodeFocusNode.dispose();
    _thirdCodeFocusNode.dispose();
    _secondCodeFocusNode.dispose();
    _fourthCodeFocusNode.dispose();
    widget._store.seconds.dispose();
    _firstCodeEditingController.dispose();
    _secondCodeEditingController.dispose();
    _thirdCodeEditingController.dispose();
    _fourthCodeEditingController.dispose();
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
                      IconBackWidget(onTap: () => Get.back()),
                      SizedBox(height: size.height * .04),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              child: Text(
                                AppLocalizations.of(context)!.verificationCode,
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
                                AppLocalizations.of(context)!.verificationCodeDescription,
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
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SingleOTPTextfieldWidget(
                              hintText: "0",
                              autofocus: true,
                              controller: _firstCodeEditingController,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).requestFocus(_secondCodeFocusNode);
                                } else {
                                  FocusScope.of(context).unfocus();
                                }
                              },
                              focusNode: _firstCodeFocusNode,
                              textInputAction: TextInputAction.done,
                            ),
                            SingleOTPTextfieldWidget(
                              hintText: "0",
                              controller: _secondCodeEditingController,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).requestFocus(_thirdCodeFocusNode);
                                } else {
                                  FocusScope.of(context).requestFocus(_firstCodeFocusNode);
                                }
                              },
                              focusNode: _secondCodeFocusNode,
                              textInputAction: TextInputAction.done,
                            ),
                            SingleOTPTextfieldWidget(
                              hintText: "0",
                              controller: _thirdCodeEditingController,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).requestFocus(_fourthCodeFocusNode);
                                } else {
                                  FocusScope.of(context).requestFocus(_secondCodeFocusNode);                                  
                                }
                              },
                              focusNode: _thirdCodeFocusNode,
                              textInputAction: TextInputAction.done,
                            ),
                            SingleOTPTextfieldWidget(
                              hintText: "0",
                              controller: _fourthCodeEditingController,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).unfocus();
                                } else {
                                  FocusScope.of(context).requestFocus(_thirdCodeFocusNode);                                  
                                }
                              },
                              focusNode: _fourthCodeFocusNode,
                              textInputAction: TextInputAction.done,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * .03),
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
                            SizedBox(
                              child: InkWell(
                                onTap: () {
                                  _firstCodeEditingController.clear();
                                  _secondCodeEditingController.clear();
                                  _thirdCodeEditingController.clear();
                                  _fourthCodeEditingController.clear();
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
                                      color: Theme.of(context).colorScheme.secondary
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * .1),
                      SizedBox(
                        child: ValueListenableBuilder<int>(
                          valueListenable: widget._store.seconds,
                          builder: (_, value, __) {
                            return Center(
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
                ),
                Expanded(
                  flex: 0,
                  child: ButtonDefaultWidget(
                    onTap: () {},
                    title: AppLocalizations.of(context)!.verify
                  ).animate()
                   .moveY(
                    begin: 200,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastEaseInToSlowEaseOut
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