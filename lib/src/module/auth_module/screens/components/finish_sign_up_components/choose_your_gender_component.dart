import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../exports/auth_exports.dart';

class ChooseYourGenderComponent extends StatelessWidget {
  const ChooseYourGenderComponent({super.key, this.onTapMale, this.onTapFemale});

  final VoidCallback? onTapMale;
  final VoidCallback? onTapFemale;

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
              height: size.height * .32,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  SizedBox(
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.surface,
                      child: SizedBox(
                        height: size.height * .23,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * .03),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                child: Text(
                                  AppLocalizations.of(context)!.selectYourGender,
                                  style: AppStyleDesign.fontStyleInter(
                                    size: size.height * .035,
                                    fontWeight: FontWeight.w800,
                                    color: Theme.of(context).colorScheme.onSurface
                                  ),
                                ),
                              ).animate()
                               .fadeIn(
                                curve: Curves.fastEaseInToSlowEaseOut,
                                duration: const Duration(milliseconds: 1500), 
                              ),
                              SizedBox(height: size.height * .025),
                              SizedBox(
                                height: size.height * .06,
                                width: size.width,
                                child: InkWell(
                                  onTap: onTapMale,
                                  child: Center(
                                    child: Text(
                                      AppNameConstants.male,
                                      style: AppStyleDesign.fontStyleInter(
                                        size: size.height * .017,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.none,
                                        color: Theme.of(context).colorScheme.onSurface,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * .06,
                                width: size.width,
                                child: InkWell(
                                  onTap: onTapFemale,
                                  child: Center(
                                    child: Text(
                                      AppNameConstants.female,
                                      style: AppStyleDesign.fontStyleInter(
                                        size: size.height * .017,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.none,
                                        color: Theme.of(context).colorScheme.onSurface,
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
                  ),
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