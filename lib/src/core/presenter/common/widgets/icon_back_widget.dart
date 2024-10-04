import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class IconBackWidget extends StatelessWidget {
  const IconBackWidget({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height * .04,
      width: size.width * .15,
      child: GestureDetector(
        onTap: onTap,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            size: size.height * .02,
            LucideIcons.moveLeft,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
