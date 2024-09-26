import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ButtonCloseCountriesPhoneComponent extends StatelessWidget {
  const ButtonCloseCountriesPhoneComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            width: size.width * .1,
            height: size.height * .05,
            margin: EdgeInsets.symmetric(horizontal: size.width * .04),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            child: Center(
              child: Icon(
                LucideIcons.x,
                size: size.height * .02,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}