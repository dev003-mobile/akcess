import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'blur_widget.dart';
import 'button_detault_widget.dart';
import '../design/app_style_design.dart';

class LogoutModalWidget extends StatelessWidget {
  const LogoutModalWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.buttonText,
    required this.description,
  });

  final String title;
  final String buttonText;
  final String description;
  final VoidCallback? onTap;

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
              height: size.height * .36,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  SizedBox(
                    child: Material(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                      ),
                      color: Theme.of(context).colorScheme.surface,
                      child: SizedBox(
                        height: size.height * .28,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: size.height * .03,
                            left: size.width * .08,
                            right: size.width * .08,
                          ),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: size.width,
                                child: Text(
                                  title,
                                  textAlign: TextAlign.left,
                                  style: AppStyleDesign.fontStyleInter(
                                    size: size.height * .032,
                                    fontWeight: FontWeight.w800,
                                    color: Theme.of(context).colorScheme.onSurface
                                  ),
                                ),
                              ).animate()
                               .fadeIn(
                                curve: Curves.fastEaseInToSlowEaseOut,
                                duration: const Duration(milliseconds: 1500), 
                              ),
                              SizedBox(height: size.height * .03),
                              SizedBox(
                                child: Text(
                                  description,
                                  style: AppStyleDesign.fontStyleInter(
                                    size: size.height * .017,
                                    fontWeight: FontWeight.w400,
                                    textOverflow: TextOverflow.clip,
                                    color: Theme.of(context).colorScheme.onSurface
                                  ),
                                ),
                              ).animate()
                               .fadeIn(
                                curve: Curves.fastEaseInToSlowEaseOut,
                                duration: const Duration(milliseconds: 1500), 
                              ),
                              SizedBox(height: size.height * .05),
                              ButtonDefaultWidget(
                                onTap: onTap,
                                title: buttonText
                              ).animate()
                               .moveY(
                                begin: 200,
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastEaseInToSlowEaseOut
                               )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),                        
                  SizedBox(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          width: size.width * .1,
                          height: size.height * .05,
                          margin: EdgeInsets.symmetric(horizontal: size.width * .04),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          child: Center(
                            child: Icon(
                              LucideIcons.x,
                              size: size.height * .02,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )                      
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}