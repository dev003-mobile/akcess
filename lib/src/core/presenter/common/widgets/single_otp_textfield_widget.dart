import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../design/app_style_design.dart';

class SingleOTPTextfieldWidget extends StatelessWidget {
  const SingleOTPTextfieldWidget({
    super.key,
    this.hintText,
    this.focusNode,
    this.onChanged,
    this.controller,
    this.onSubmitted,
    this.keyboardType,
    this.autofocus = false,
    this.textInputAction = TextInputAction.next,
  });

  final bool autofocus;
  final String? hintText;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width * .18,
      child: TextField(
        autofocus: autofocus,
        focusNode: focusNode,
        onChanged: onChanged,
        controller: controller,
        onSubmitted: onSubmitted,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        textAlignVertical: TextAlignVertical.center,
        inputFormatters: <TextInputFormatter>[
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: AppStyleDesign.fontStyleInter(
          size: size.height * .025,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: size.height * .02, 
          ),
          hintText: hintText,
          hintStyle: AppStyleDesign.fontStyleInter(
            size: size.height * .025,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(.2) 
          ),
          fillColor: PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
            Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
            Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(.06),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
              color: Theme.of(context).colorScheme.secondary
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,               
            borderRadius: BorderRadius.circular(10),
          )
        ),
      ),
    );
  }
}
