import 'package:flutter/material.dart';

import '../design/app_style_design.dart';

class CustomTextfieldWidget extends StatelessWidget {
  const CustomTextfieldWidget({
    super.key,
    this.onTap,
    this.hintText,
    this.focusNode,
    this.onChanged,
    this.fillColor,
    this.hintStyle,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.onSubmitted,
    this.keyboardType,
    required this.title,
    this.contentPadding,
    this.autocorrect = true,
    this.obscureText = false,
    this.enableBorder = false,
    this.obscuringCharacter = '•',
    this.textInputAction = TextInputAction.next,
  });

  final String title;
  final bool autocorrect;
  final bool obscureText;
  final Color? fillColor;
  final String? hintText;
  final bool enableBorder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final String obscuringCharacter;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          child: Text(
            title,
            style: AppStyleDesign.fontStyleInter(
              size: size.height * .0155,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        SizedBox(height: size.height * .01),
        SizedBox(
          child: TextField(
            onTap: onTap,
            focusNode: focusNode,
            onChanged: onChanged,
            controller: controller,
            autocorrect: autocorrect,
            obscureText: obscureText,
            onSubmitted: onSubmitted,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            obscuringCharacter: obscuringCharacter,
            textAlignVertical: TextAlignVertical.center,
            style: AppStyleDesign.fontStyleInter(
              size: size.height * .017,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            decoration: InputDecoration(
              filled: true,
              contentPadding: contentPadding ?? EdgeInsets.symmetric(
                vertical: size.height * .017, 
                horizontal: size.width * .03
              ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: hintStyle ?? AppStyleDesign.fontStyleInter(
                size: size.height * .017,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(.2) 
              ),
              fillColor: fillColor ?? Theme.of(context).colorScheme.surface.withOpacity(.7),
              focusedBorder: OutlineInputBorder(
                borderSide: enableBorder ? BorderSide(
                  width: 0.5,
                  color: Theme.of(context).colorScheme.secondary
                ) : BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: enableBorder ? BorderSide(
                  width: 0.5,
                  color: Theme.of(context).colorScheme.secondary
                ) : BorderSide.none,                
                borderRadius: BorderRadius.circular(10),
              )
            ),
          ),
        )
      ],
    );
  }
}
