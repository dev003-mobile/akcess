import 'dart:ui';

import 'package:flutter/material.dart';

import '../design/app_style_design.dart';

class ButtonDefaultWidget extends StatefulWidget {
  const ButtonDefaultWidget({
    super.key,
    this.color,
    this.onTap,
    required this.title,
    this.isActive = true,
    this.hasAnimation = true,
  });

  final String title;
  final Color? color;
  final bool isActive;
  final bool hasAnimation;
  final VoidCallback? onTap;

  @override
  State<ButtonDefaultWidget> createState() => _ButtonDefaultWidgetState();
}

class _ButtonDefaultWidgetState extends State<ButtonDefaultWidget> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: widget.isActive ? widget.onTap : null,
      onTapDown: widget.hasAnimation ? widget.isActive ? (_) => setState(() => _opacity = 0.08) : null : null,
      onTapUp: widget.hasAnimation ? widget.isActive ? (_) => Future.delayed(const Duration(milliseconds: 150), () => setState(() => _opacity = 1.0)) : null : null,
      // onLongPress: () => setState(() => _opacity = 1.0),
      child: AnimatedOpacity(
        curve: Curves.fastEaseInToSlowEaseOut,
        opacity: _opacity,
        duration: const Duration(milliseconds: 150),
        child: Container(
          width: size.width,
          height: size.height * .055,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.isActive ? 
              widget.color ?? Theme.of(context).colorScheme.secondary :
              PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                Theme.of(context).colorScheme.onSurface.withOpacity(.05) :
                Theme.of(context).colorScheme.onSurface.withOpacity(.08),
              // Theme.of(context).colorScheme.onSurface.withOpacity(.04),
          ),
          child: Center(
            child: Text(
              widget.title,
              style: AppStyleDesign.fontStyleInter(
                size: size.height * .017,
                fontWeight: FontWeight.w500,
                color: widget.isActive ? 
                  Theme.of(context).colorScheme.surface :
                  Theme.of(context).colorScheme.onSurface.withOpacity(.2) 
              ),
            ),
          ),
        ),
      ),
    );
  }
}