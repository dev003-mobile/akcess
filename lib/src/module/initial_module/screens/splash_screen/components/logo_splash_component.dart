import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/presenter/utils/device_theme/device_theme.dart';
import '../../../../../core/presenter/utils/constants/app_image_constants.dart';

class LogoSplashComponent extends StatelessWidget {
  LogoSplashComponent(this._animation, {super.key});

  final Animation<double> _animation;
  final DeviceTheme _deviceTheme = GetIt.I.get<DeviceTheme>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: Center(
          child: RotationTransition(
            turns: _animation,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: RotatedBox(
                quarterTurns: -1,
                child: SvgPicture.asset(
                  _deviceTheme.currentTheme == ThemeData.light() ? 
                    AppImageConstants.logoPrimaryImage : 
                    AppImageConstants.logoSecondaryImage,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
        ).animate()
         .rotate(
          begin: 0,
          end: 1,
          alignment: Alignment.centerRight,
          duration: const Duration(seconds: 1),
          curve: Curves.fastEaseInToSlowEaseOut
        )
        .saturate(
          duration: const Duration(seconds: 2),
          delay: const Duration(milliseconds: 1500),
          curve: Curves.fastEaseInToSlowEaseOut
        ),
      ),
    );
  }
}