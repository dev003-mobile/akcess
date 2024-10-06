import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ButtonCircleWidget extends StatefulWidget {
  const ButtonCircleWidget({
    super.key,
    this.icon,
    this.color,
    this.onTap,
    this.iconColor
  });

  final Color? color;
  final IconData? icon;
  final Color? iconColor;
  final VoidCallback? onTap;

  @override
  State<ButtonCircleWidget> createState() => _ButtonCircleWidgetState();
}

class _ButtonCircleWidgetState extends State<ButtonCircleWidget> {
  final double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: widget.onTap,
      // onTapDown: (_) => setState(() => _opacity = 0.08),
      // onTapUp: (_) => Future.delayed(const Duration(milliseconds: 150), () => setState(() => _opacity = 1.0)),
      // onLongPress: () => setState(() => _opacity = 1.0),
      child: AnimatedOpacity(
        curve: Curves.fastEaseInToSlowEaseOut,
        opacity: _opacity,
        duration: const Duration(milliseconds: 150),
        child: Container(
          width: size.width * .16,
          height: size.height * .06,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color ?? Theme.of(context).colorScheme.secondary
          ),
          child: Center(
            child: Icon(
              widget.icon ?? LucideIcons.moveRight,
              size: size.height * .02,
              color: widget.iconColor ?? Theme.of(context).colorScheme.surface,
            )
          ),
        ),
      ),
    );
  }
}