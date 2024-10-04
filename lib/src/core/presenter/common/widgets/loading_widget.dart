import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidet extends StatelessWidget {
  const LoadingWidet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Center(
        child: LoadingAnimationWidget.stretchedDots(
          size: size.height * .028,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}