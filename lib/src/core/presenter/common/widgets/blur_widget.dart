import 'dart:ui';

import 'package:flutter/material.dart';

class BlurWidget extends StatelessWidget {
  const BlurWidget({
    super.key,
    this.color,
    this.sigmaX,
    this.sigmaY,
  });

  final Color? color;
  final double? sigmaX;
  final double? sigmaY;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigmaX ?? 5, sigmaY: sigmaY ?? 5),
      child: Container(
        height: size.height,
        width: size.width,
        color: color ?? Theme.of(context).colorScheme.surface.withOpacity(.3),
      ),
    );
  }
}
