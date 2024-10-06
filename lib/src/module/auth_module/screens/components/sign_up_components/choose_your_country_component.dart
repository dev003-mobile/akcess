import 'package:flutter/material.dart';

import '../../exports/auth_exports.dart';

class ChooseYourCountryComponent extends StatelessWidget {
  const ChooseYourCountryComponent({super.key});

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
                  const ButtonCloseWidget()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}