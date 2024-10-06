import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../_stores/finish_sign_up_store.dart';
import '../../../../core/presenter/common/design/app_style_design.dart';
import '../../../../core/presenter/utils/constants/app_name_constants.dart';
import '../../../../core/presenter/common/widgets/custom_textfield_widget.dart';
import '../components/finish_sign_up_components/choose_your_gender_component.dart';
import '../components/finish_sign_up_components/choose_your_birthday_component.dart';

class AddDataSignUpScreen extends StatefulWidget {
  AddDataSignUpScreen({super.key});

  final FinishSignUpStore _store = GetIt.I.get<FinishSignUpStore>();

  @override
  State<AddDataSignUpScreen> createState() => _AddDataSignUpScreenState();
}

class _AddDataSignUpScreenState extends State<AddDataSignUpScreen> {
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _birthDayController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _genderController.dispose();
    _birthDayController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              child: Padding(
                padding: EdgeInsets.only(top: size.height * .04),
                child: Text(
                  AppLocalizations.of(context)!.additionalData,
                  style: AppStyleDesign.fontStyleInter(
                    size: size.height * .035,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onSurface
                  ),
                ),
              ),
            ).animate()
             .fadeIn(
              curve: Curves.fastEaseInToSlowEaseOut,
              duration: const Duration(milliseconds: 1500), 
            ),
            SizedBox(height: size.height * .06),
            ValueListenableBuilder<DateTime>(
              valueListenable: widget._store.birthDate,
              builder: (_, value, __) {
                return CustomTextfieldWidget(
                  readOnly: true,
                  enableBorder: false,
                  controller: _birthDayController,
                  textInputAction: TextInputAction.done,
                  title: AppLocalizations.of(context)!.birthDate,
                  fillColor: PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                    Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                    Theme.of(context).colorScheme.onSurface.withOpacity(.08),
                  onChanged: (value) {},
                  onTap: () => showModalBottomSheet(
                    context: context,
                    enableDrag: false,
                    isDismissible: false,
                    isScrollControlled: true,
                    backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(.0),
                    builder: (_) => ChooseYourBirthdayComponent(
                      initialDateTime: value,
                      onDateTimeChanged: (dateTime) => widget._store.birthDate.value = dateTime,
                      onSelectDate: () {
                        _birthDayController.text = "${widget._store.birthDate.value.day.toString().length > 1 ? widget._store.birthDate.value.day : '0${widget._store.birthDate.value.day}'}/${widget._store.birthDate.value.month.toString().length > 1 ? widget._store.birthDate.value.month : '0${widget._store.birthDate.value.month}'}/${widget._store.birthDate.value.year}";
                        Get.back();
                      },
                    )
                  ),
                );
              }
            ),
            SizedBox(height: size.height * .025),
            CustomTextfieldWidget(
              readOnly: true,
              controller: _genderController,
              title: AppLocalizations.of(context)!.gender,
              fillColor: PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                Theme.of(context).colorScheme.onSurface.withOpacity(.08),
              prefixIcon: SizedBox(
                width: size.width * .175,
                child: GestureDetector(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    enableDrag: false,
                    isDismissible: false,
                    isScrollControlled: true,
                    backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(.0),
                    builder: (_) => ChooseYourGenderComponent(
                      onTapMale: () => {_genderController.text = AppNameConstants.male, Get.back()},
                      onTapFemale: () => {_genderController.text = AppNameConstants.female, Get.back()}
                    )
                  ),
                  child: Icon(
                    size: size.height * .02,
                    LucideIcons.chevronDown,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}