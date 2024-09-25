import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../auth_exports.dart';

class ListAuthButtonComponent extends StatefulWidget {
  ListAuthButtonComponent(this._pageController, {super.key});

  final PageController _pageController;
  final AuthStore _store = GetIt.I.get<AuthStore>();
  final DeviceTheme _deviceTheme = GetIt.I.get<DeviceTheme>();

  @override
  State<ListAuthButtonComponent> createState() => _ListAuthButtonComponentState();
}

class _ListAuthButtonComponentState extends State<ListAuthButtonComponent> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Expanded(
      flex: 0,
      child: SizedBox(
        width: size.width,
        height: size.height * .045,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: widget._deviceTheme.currentTheme == ThemeData.dark() ? 
              Theme.of(context).colorScheme.tertiary.withOpacity(.2) :
              Theme.of(context).colorScheme.tertiary.withOpacity(.7)
          ),
          child: ValueListenableBuilder<int>(
            valueListenable: widget._store.authSelectedButton,
            builder: (_, value, __) {
              return Padding(
                padding: EdgeInsets.all(size.height * .005),
                child: Row(
                  children: <Widget>[
                    AuthButtonOptionComponent(
                      onTap: () {
                        widget._store.authSelectedButton.value = 0;
                        widget._pageController.animateToPage(
                          0, 
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 300), 
                        );
                        widget._store.hideRegisterButton.value = true;
                        FocusScope.of(context).unfocus();
                      },
                      title: AppLocalizations.of(context)!.signIn,
                      isSelected: value == 0,
                    ),
                    SizedBox(width: size.width * .01),
                    AuthButtonOptionComponent(
                      onTap: () {
                        widget._store.authSelectedButton.value = 1;
                        widget._pageController.animateToPage(
                          1, 
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds: 300), 
                        );
                        FocusScope.of(context).unfocus();
                      },
                      title: AppLocalizations.of(context)!.signUp,
                      isSelected: value == 1,
                    )
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}