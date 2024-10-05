import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../design/app_style_design.dart';

class CustomToastWidget {
  static Future<void> showToast({
    required BuildContext context,
    required String title
  }) async {
    final size = MediaQuery.sizeOf(context);
    final OverlayState overlayState = Overlay.of(context);
    final OverlayEntry overlayEntry = OverlayEntry(
      builder: (_) => PopScope(
        canPop: false,
        child: SizedBox(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                height: size.height,
                width: size.width,
                color: Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(.75)
              ).animate()
               .fadeIn(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastEaseInToSlowEaseOut
              ),
              SizedBox(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: size.width,
                      height: size.height * .06,
                      margin: EdgeInsets.only(
                        left: size.width * .065,
                        right: size.width * .065,
                        bottom: size.height * .05
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * .01,
                          horizontal: size.width * .04,
                        ),
                        child: SizedBox(
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: size.height * .014,
                                backgroundColor: Theme.of(context).colorScheme.onTertiaryFixed,
                                child: Center(
                                  child: Icon(
                                    size: size.height * .016,
                                    LucideIcons.checkCircle,
                                    color: Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * .02),
                              SizedBox(
                                child: Text(
                                  title,
                                  style: AppStyleDesign.fontStyleInter(
                                    size: size.height * .015,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.none,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ).animate()
                  .moveY(
                  begin: 200,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastEaseInToSlowEaseOut
                ).then()
                  .moveX(
                  end: 400,
                  delay: const Duration(seconds: 2),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastEaseInToSlowEaseOut
                ),
              ),
            ],
          ),
        ),
      )
    );

    overlayState.insert(overlayEntry);

    await Future.delayed(const Duration(seconds: 4), () {
      overlayEntry.remove();
    });
  }
}