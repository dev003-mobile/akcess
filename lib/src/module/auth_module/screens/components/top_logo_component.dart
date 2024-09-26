import 'dart:ui';

import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../exports/auth_exports.dart';

class TopLogoComponent extends StatefulWidget {
  TopLogoComponent({super.key});

  final DeviceTheme _deviceTheme = GetIt.I.get<DeviceTheme>();

  @override
  State<TopLogoComponent> createState() => _TopLogoComponentState();
}

class _TopLogoComponentState extends State<TopLogoComponent> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    setState(() => widget._deviceTheme.updateTheme(PlatformDispatcher.instance.platformBrightness));
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Expanded(
      flex: 0,
      child: SizedBox(
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              widget._deviceTheme.currentTheme == ThemeData.dark() ? 
              AppImageConstants.logoPrimaryWithoutBgImage : AppImageConstants.logoSecondaryWithoutBgImage,
              width: 25,
              height: 25,
            ),
            SizedBox(width: size.width * .02),
            SizedBox(
              child: Text(
                AppNameConstants.appName,
                style: AppStyleDesign.fontStyleInter(
                  size: size.height * .02,
                  fontWeight: FontWeight.w600
                ),
              ),
            )
          ],
        ),
      ).animate()
       .moveX(
        begin: -200,
        curve: Curves.fastEaseInToSlowEaseOut,
        duration: const Duration(milliseconds: 700),
      ),
    );
  }
}