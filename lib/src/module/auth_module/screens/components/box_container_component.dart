import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_it/get_it.dart';

import '../auth_exports.dart';

class BoxContainerComponent extends StatelessWidget {
  BoxContainerComponent(this._pageController, {super.key});

  final PageController _pageController;
  final AuthStore _store = GetIt.I.get<AuthStore>();
  final DeviceTheme _deviceTheme = GetIt.I.get<DeviceTheme>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return ValueListenableBuilder<int>(
      valueListenable: _store.authSelectedButton,
      builder: (_, value, __) {
        return AnimatedContainer(
          height: value == 1 ? size.height * .65 : size.height * .6,
          width: size.width,
          duration: const Duration(seconds: 1),
          curve: Curves.fastEaseInToSlowEaseOut,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: _deviceTheme.currentTheme == ThemeData.light() ? 
                Theme.of(context).colorScheme.primary.withOpacity(.1) : 
                Theme.of(context).colorScheme.onSurface.withOpacity(.1)
            ),
            child: Padding(
              padding: EdgeInsets.all(size.height * .02),
              child: Column(
                children: <Widget>[
                  ListAuthButtonComponent(_pageController),
                  SizedBox(height: size.height * .04),
                  Expanded(
                    flex: 1,
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        const SignInScreen(),
                        SignUpScreen()
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        ).animate()
         .moveX(
          begin: -400,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.fastEaseInToSlowEaseOut
        );
      }
    );
  }
}