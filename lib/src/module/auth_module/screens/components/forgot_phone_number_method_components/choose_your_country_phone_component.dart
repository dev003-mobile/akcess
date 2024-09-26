import 'package:flutter/material.dart';

import '../../exports/auth_exports.dart';

class ChooseYourCountryPhoneComponent extends StatelessWidget {
  const ChooseYourCountryPhoneComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        const BlurWidget(),
        SizedBox(
          child: Material(
            color: Theme.of(context).colorScheme.surface.withOpacity(.0),
            child: SizedBox(
              width: size.width,
              height: size.height * .83,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  ContainerListCountriesComponent(),
                  const ButtonCloseCountriesComponent()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}