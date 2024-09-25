import 'package:flutter/material.dart';

import '../auth_exports.dart';

class ContentAuthComponent extends StatefulWidget {  
  const ContentAuthComponent({super.key});

  @override
  State<ContentAuthComponent> createState() => _ContentAuthComponentState();
}

class _ContentAuthComponentState extends State<ContentAuthComponent> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .07),
        child: SingleChildScrollView(
          primary: true,
          padding: EdgeInsets.symmetric(vertical: size.height * .05),
          child: Column(
            children: <Widget>[
              TopLogoComponent(),
              SizedBox(height: size.height * .025),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const StartNowTextComponent(),
                    SizedBox(height: size.height * .005),
                    const StartDescriptionComponent(),
                    SizedBox(height: size.height * .058),
                    BoxContainerComponent(_pageController)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}