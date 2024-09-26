import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/presenter/common/design/app_style_design.dart';

class ContainerForgotOptionComponent extends StatefulWidget {
  const ContainerForgotOptionComponent({
    super.key,
    this.onTap,
    required this.title,
    this.isSelected = false,
  });

  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  State<ContainerForgotOptionComponent> createState() => _ButtonDefaultWidgetState();
}

class _ButtonDefaultWidgetState extends State<ContainerForgotOptionComponent> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: size.width,
        height: size.height * .085,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.15,
            color: widget.isSelected ?
              Theme.of(context).colorScheme.secondary.withOpacity(.0) : 
              Theme.of(context).colorScheme.secondary
          ),
          color: widget.isSelected ? 
            Theme.of(context).colorScheme.secondary :
            Theme.of(context).colorScheme.onSurface.withOpacity(.04),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.title,
            maxLines: 2,
            textAlign: TextAlign.left,
            style: AppStyleDesign.fontStyleInter(
              size: size.height * .025,
              fontWeight: FontWeight.w400,
              textOverflow: TextOverflow.clip,
              color: widget.isSelected ? 
                Theme.of(context).colorScheme.surface :
                Theme.of(context).colorScheme.onSurface
            ),
          ),
        ),
      ),
    ).animate()
     .fadeIn(
      duration: const Duration(seconds: 1),
      curve: Curves.fastEaseInToSlowEaseOut
     );
  }
}