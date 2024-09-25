import 'package:country_currency_pickers/utils/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:country_currency_pickers/country.dart';

import '../../auth_exports.dart';

class DropButtonCountryComponent extends StatelessWidget {
  DropButtonCountryComponent({super.key});

  final AuthStore _store = GetIt.I.get<AuthStore>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return ValueListenableBuilder<Country?>(
      valueListenable: _store.selectedCountry,
      builder: (_, value, __) {
        return Container(
          width: size.width * .175,
          margin: EdgeInsets.only(right: size.width * .03),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: value != null ? SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
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
                      child: CountryPickerUtils.getDefaultFlagImage(value)
                    )
                  ),
                ),
                SizedBox(width: size.width * .02),
                SizedBox(
                  child: Icon(
                    size: size.height * .02,
                    LucideIcons.chevronDown,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ) : Center(
            child: Icon(
              size: size.height * .02,
              LucideIcons.chevronDown,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        );
      }
    );
  }
}
