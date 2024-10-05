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
  @override
  void initState() {
    super.initState();
    widget._store.seconds = ValueNotifier<int>(0);
    widget._store.otp = ValueNotifier<String>("");

    widget._store.firstCodeFocusNode = FocusNode();
    widget._store.secondCodeFocusNode = FocusNode();
    widget._store.thirdCodeFocusNode = FocusNode();
    widget._store.fourthCodeFocusNode = FocusNode();  

    widget._store.firstCodeEditingController = TextEditingController();
    widget._store.secondCodeEditingController = TextEditingController();
    widget._store.thirdCodeEditingController = TextEditingController();
    widget._store.fourthCodeEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    widget._store.otp.dispose();
    widget._store.timer?.cancel();
    widget._store.seconds.dispose();

    widget._store.firstCodeFocusNode.dispose();
    widget._store.secondCodeFocusNode.dispose();
    widget._store.thirdCodeFocusNode.dispose();
    widget._store.fourthCodeFocusNode.dispose();  

    widget._store.firstCodeEditingController.dispose();
    widget._store.secondCodeEditingController.dispose();
    widget._store.thirdCodeEditingController.dispose();
    widget._store.fourthCodeEditingController.dispose();
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconBackWidget(onTap: () => Get.back()),
                        SizedBox(height: size.height * .04),
                        const TitleAndDescriptionOTPComponent(),
                        SizedBox(height: size.height * .06),
                        OTPTetfieldsComponent(),
                        SizedBox(height: size.height * .03),
                        ResendOTPCodeComponent()
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: ValueListenableBuilder<String>(
                    valueListenable: widget._store.otp,
                    builder: (_, value, __) {
                      return ButtonDefaultWidget(
                        hasAnimation: false,
                        onTap: () async {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            barrierColor: Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(.75),
                            builder: (_) => const PopScope(
                              canPop: false,
                              child: LoadingWidet()
                            )
                          );
                          Future.delayed(const Duration(seconds: 5), () {
                            Get.back();
                            Get.offNamed(AppNameRoute.redefinePasswordScreen);
                          });
                        },
                        isActive: value.trim().length == 4,
                        title: AppLocalizations.of(context)!.verify
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