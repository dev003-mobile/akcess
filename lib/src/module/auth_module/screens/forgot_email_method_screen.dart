import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'exports/forgot_email_method_exports.dart';

class ForgotEmailMethodScreen extends StatefulWidget {
  ForgotEmailMethodScreen({super.key});

  final ForgotEmailMethodStore _store = GetIt.I.get<ForgotEmailMethodStore>();

  @override
  State<ForgotEmailMethodScreen> createState() => _ForgotEmailMethodScreenState();
}

class _ForgotEmailMethodScreenState extends State<ForgotEmailMethodScreen> {
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget._store.isValidEmail = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    super.dispose();
    _emailFocusNode.dispose();
    _emailController.dispose();
    widget._store.isValidEmail.dispose();
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
                                AppLocalizations.of(context)!.enterEmailAddress,
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
                                AppLocalizations.of(context)!.enterEmailAddressDescription,
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
                      ValueListenableBuilder<bool>(
                        valueListenable: widget._store.isValidEmail,
                        builder: (_, value, __) {
                          return CustomTextfieldWidget(
                            enableBorder: false,
                            focusNode: _emailFocusNode,
                            controller: _emailController,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            title: AppLocalizations.of(context)!.email,
                            hintText: AppLocalizations.of(context)!.exampleEmail,
                            fillColor: PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                              Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                              Theme.of(context).colorScheme.onSurface.withOpacity(.08),
                            onChanged: (value) => widget._store.isValidEmail.value = EmailValidation.isValidEmail(value),
                            suffixIcon: Visibility(
                              visible: value,
                              child: Icon(
                                size: size.height * .02,
                                LucideIcons.checkCircle,
                                color: Theme.of(context).colorScheme.secondary,
                              ).animate()
                               .scaleXY(
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastEaseInToSlowEaseOut
                              ).then()
                               .rotate().then()
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: SingleChildScrollView(
                    child: ValueListenableBuilder<bool>(
                      valueListenable: widget._store.isValidEmail,
                      builder: (_, value, __) {
                        return ButtonDefaultWidget(
                          hasAnimation: false,
                          onTap: () {
                            _emailFocusNode.unfocus();
                            Get.toNamed(
                              AppNameRoute.checkYourOtpScreen,
                              arguments: [true, _emailController.text]
                            );
                          },
                          isActive: value,
                          title: AppLocalizations.of(context)!.send
                        ).animate()
                         .moveY(
                          begin: 200,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastEaseInToSlowEaseOut
                        );
                      }
                    ),
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