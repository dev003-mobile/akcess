import 'package:flutter/material.dart';

import '../../../../core/presenter/common/design/app_style_design.dart';

class AuthButtonOptionComponent extends StatelessWidget {
  const AuthButtonOptionComponent({
    super.key, 
    this.onTap,
    required this.title, 
    this.isSelected = false,
  });

  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutSine,
          decoration: BoxDecoration(
            color: isSelected ? 
              Theme.of(context).colorScheme.secondary : 
              Theme.of(context).colorScheme.secondary.withOpacity(.0),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Center(
            child: Text(
              title,
              style: AppStyleDesign.fontStyleInter(
                size: size.height * .017,
                fontWeight: FontWeight.w500,
                color: isSelected ? Theme.of(context).colorScheme.surface : null
              ),
            ),
          ),
        ),
      ),
    );
  }
}