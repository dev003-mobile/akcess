import 'package:flutter/material.dart';

import '../design/app_style_design.dart';

class CustomTextfieldWidget extends StatelessWidget {
  const CustomTextfieldWidget({
    super.key,
    this.onTap,
    this.controller,
    this.onSubmitted,
    this.keyboardType,
    required this.title,
    this.autocorrect = true,
    this.textInputAction = TextInputAction.next,
  });

  final String title;
  final bool autocorrect;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;

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
            controller: controller,
            autocorrect: autocorrect,
            onSubmitted: onSubmitted,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            textAlignVertical: TextAlignVertical.center,
            style: AppStyleDesign.fontStyleInter(
              size: size.height * .017,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            decoration: InputDecoration(
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: size.height * .017,
                horizontal: size.width * .03
              ),
              fillColor: Theme.of(context).colorScheme.surface.withOpacity(.7),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              )              
            ),
          ),
        )
      ],
    );
  }
}