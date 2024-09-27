import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../exports/auth_exports.dart';

class ContainerListCountriesComponent extends StatefulWidget {
  ContainerListCountriesComponent({super.key});

  final AuthStore _store = GetIt.I.get<AuthStore>();

  @override
  State<ContainerListCountriesComponent> createState() => _ContainerListCountriesComponentState();
}

class _ContainerListCountriesComponentState extends State<ContainerListCountriesComponent> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surface,
        child: SizedBox(
          height: size.height * .75,
          width: size.width,
          child: Padding(
            padding: EdgeInsets.only(top: size.height * .03),
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Text(
                    AppLocalizations.of(context)!.selectYourCountry,
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
                SizedBox(height: size.height * .03),
                Expanded(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: widget._store.countries.length,
                          (_, index) => InkWell(
                            onTap: () => {widget._store.selectedCountry.value = widget._store.countries[index], Get.back()},
                            child: Animate(
                              effects: const <Effect>[FadeEffect(
                                duration: Duration(seconds: 1),
                                curve: Curves.fastEaseInToSlowEaseOut
                              )],
                              child: SizedBox(
                                width: size.width,
                                height: size.height * .065,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * .04),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: SizedBox(
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                flex: 0,
                                                child: ClipOval(
                                                  child: Container(
                                                    width: size.width * .065,
                                                    height: size.height * .028,
                                                    decoration: BoxDecoration(
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                          blurRadius: 5,
                                                          spreadRadius: 5,
                                                          color: Theme.of(context).colorScheme.onSurface
                                                        )
                                                      ]
                                                    ),
                                                    child: CountryPickerUtils.getDefaultFlagImage(widget._store.countries[index])
                                                  )
                                                ),
                                              ),
                                              SizedBox(width: size.width * .1),
                                              Expanded(
                                                child: SizedBox(
                                                  child: Text(
                                                    widget._store.countries[index].name ?? "",
                                                    style: AppStyleDesign.fontStyleInter(
                                                      size: size.height * .017,
                                                      fontWeight: FontWeight.w500,
                                                      color: Theme.of(context).colorScheme.onSurface
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ).animate()
                                          .moveX(
                                            begin: 200,
                                            duration: const Duration(seconds: 1),
                                            curve: Curves.fastEaseInToSlowEaseOut
                                          )
                                        )
                                      ),
                                      SizedBox(width: size.width * .03),
                                      Expanded(
                                        flex: 0,
                                        child: SizedBox(
                                          child: Text(
                                            "+${widget._store.countries[index].phoneCode}",
                                            style: AppStyleDesign.fontStyleInter(
                                              size: size.height * .017,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context).colorScheme.onSurface
                                            ),
                                          ),
                                        )
                                      ).animate()
                                      .moveX(
                                        begin: -200,
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.fastEaseInToSlowEaseOut
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ),
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}