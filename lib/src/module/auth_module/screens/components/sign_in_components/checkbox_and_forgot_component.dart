import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../auth_exports.dart';

class CheckBoxAndForgotComponent extends StatefulWidget {
  CheckBoxAndForgotComponent({super.key});

  final AuthStore _store = GetIt.I.get<AuthStore>();

  @override
  State<CheckBoxAndForgotComponent> createState() => _CheckBoxAndForgotComponentState();
}

class _CheckBoxAndForgotComponentState extends State<CheckBoxAndForgotComponent> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            child: Row(
              children: <Widget>[
                SizedBox(
                  child: ValueListenableBuilder<bool>(
                    valueListenable: widget._store.rememberLogin,
                    builder: (_, value, __) {
                      return Transform.scale(
                        scale: .85,
                        child: Checkbox(
                          value: value,
                          splashRadius: size.height * .013,
                          visualDensity: VisualDensity.compact,
                          checkColor: Theme.of(context).colorScheme.surface,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          side: BorderSide(color: Theme.of(context).colorScheme.secondary),
                          onChanged: (value) => widget._store.rememberLogin.value = value ?? false,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                          fillColor: value ? 
                            WidgetStateProperty.all<Color?>(Theme.of(context).colorScheme.secondary) : 
                            WidgetStateProperty.all<Color?>(Theme.of(context).colorScheme.surface.withOpacity(.0)) 
                        ),  
                      );
                    }
                  ),
                ),
                SizedBox(width: size.width * .005),
                SizedBox(
                  child: Text(
                    AppLocalizations.of(context)!.rememberMe,
                    style: AppStyleDesign.fontStyleInter(
                      size: size.height * .015,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSurface
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * .001,
                  horizontal: size.width * .02
                ),
                child: Text(
                  AppLocalizations.of(context)!.forgotPassword,
                  style: AppStyleDesign.fontStyleInter(
                    size: size.height * .015,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onSurface
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}