import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../design/app_style_design.dart';
import '../../utils/enums/password_strength_enum.dart';

class PasswordStrengthWidget extends StatelessWidget {
  const PasswordStrengthWidget({
    super.key,
    required this.level,
    required this.valueListenable
  });

  final String level;
  final ValueListenable<PasswordStrengthEnum?> valueListenable;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: ValueListenableBuilder<PasswordStrengthEnum?>(
        valueListenable: valueListenable,
        builder: (_, value, __) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                child: Row(
                  children: <Widget>[
                    AnimatedContainer(
                      width: size.width * .17,
                      height: size.height * .005,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastEaseInToSlowEaseOut,
                      decoration: BoxDecoration(
                        color: value != null ? 
                          value == PasswordStrengthEnum.low ? Theme.of(context).colorScheme.onPrimaryFixed :
                          value == PasswordStrengthEnum.medium ? Theme.of(context).colorScheme.onSecondaryFixed : 
                          Theme.of(context).colorScheme.onTertiaryFixed : PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                            Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                            Theme.of(context).colorScheme.onSurface.withOpacity(.08),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: size.width * .01),
                    AnimatedContainer(
                      width: size.width * .17,
                      height: size.height * .005,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastEaseInToSlowEaseOut,
                      decoration: BoxDecoration(
                        color: value != null ? 
                          value == PasswordStrengthEnum.low ? PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                            Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                            Theme.of(context).colorScheme.onSurface.withOpacity(.08) :
                          value == PasswordStrengthEnum.medium ? Theme.of(context).colorScheme.onSecondaryFixed : 
                          Theme.of(context).colorScheme.onTertiaryFixed : PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                            Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                            Theme.of(context).colorScheme.onSurface.withOpacity(.08),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: size.width * .01),
                    AnimatedContainer(
                      width: size.width * .17,
                      height: size.height * .005,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastEaseInToSlowEaseOut,
                      decoration: BoxDecoration(
                        color: value != null ? 
                          value == PasswordStrengthEnum.low ? PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                            Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                            Theme.of(context).colorScheme.onSurface.withOpacity(.08) :
                          value == PasswordStrengthEnum.medium ? PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                            Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                            Theme.of(context).colorScheme.onSurface.withOpacity(.08) : 
                          Theme.of(context).colorScheme.onTertiaryFixed : PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                            Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                            Theme.of(context).colorScheme.onSurface.withOpacity(.08),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(right: size.width * .01),
                  child: Text(
                    level,
                    style: AppStyleDesign.fontStyleInter(
                      size: size.height * .013,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ).animate()
                   .fadeIn(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastEaseInToSlowEaseOut
                   )
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}