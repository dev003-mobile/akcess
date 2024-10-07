import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../exports/auth_exports.dart';

class ChooseYourBirthdayComponent extends StatelessWidget {
  const ChooseYourBirthdayComponent({
    super.key, 
    this.onSelectDate, 
    this.initialDateTime,
    required this.onDateTimeChanged
  });

  final DateTime? initialDateTime;
  final VoidCallback? onSelectDate;
  final Function(DateTime) onDateTimeChanged;

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
              height: size.height * .58,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  SizedBox(
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.surface,
                      child: SizedBox(
                        height: size.height * .49,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * .03),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 0,
                                child: SizedBox(
                                  child: Text(
                                    AppLocalizations.of(context)!.yourAge,
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
                              ),
                              SizedBox(height: size.height * .015),
                              SizedBox(
                                height: size.height * .3,
                                child: CupertinoDatePicker(
                                  use24hFormat: true,
                                  showDayOfWeek: false,
                                  maximumDate: DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month,
                                    DateTime.now().day,
                                  ),
                                  initialDateTime: DateTime(
                                    initialDateTime!.year,
                                    initialDateTime!.month,
                                    initialDateTime!.day,
                                  ),
                                  mode: CupertinoDatePickerMode.date,
                                  dateOrder: DatePickerDateOrder.dmy,
                                  onDateTimeChanged: onDateTimeChanged,
                                  backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(.0),
                                ),
                              ),
                              SizedBox(height: size.height * .015),
                              Expanded(
                                flex: 0,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * .07),
                                  child: ButtonDefaultWidget(
                                    onTap: onSelectDate,            
                                    title: AppLocalizations.of(context)!.select
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