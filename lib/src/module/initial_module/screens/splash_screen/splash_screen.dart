import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'splash_exports.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  final DeviceTheme _deviceTheme = GetIt.I.get<DeviceTheme>();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Future.delayed(const Duration(seconds: 6), () => Get.offNamed(AppNameRoute.authScreen));
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 0.25).animate(_controller);
    Future.delayed(const Duration(seconds: 2), () => _controller.forward());
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    setState(() => widget._deviceTheme.updateTheme(PlatformDispatcher.instance.platformBrightness));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LogoSplashComponent(_animation),
            const TextAkcessComponent()
          ],
        ),
      )
    );
  }
}