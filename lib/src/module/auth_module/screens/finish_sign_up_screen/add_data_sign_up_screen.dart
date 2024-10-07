import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../exports/auth_exports.dart';

class AddDataSignUpScreen extends StatefulWidget {
  AddDataSignUpScreen({super.key});

  final FinishSignUpStore _store = GetIt.I.get<FinishSignUpStore>();

  @override
  State<AddDataSignUpScreen> createState() => _AddDataSignUpScreenState();
}

class _AddDataSignUpScreenState extends State<AddDataSignUpScreen> {
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();

  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _birthDayController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget._store.loadingCityPlaces = ValueNotifier<bool>(false);
    widget._store.loadingAddressPlaces = ValueNotifier<bool>(false);
    widget._store.citiesPlaces = ValueNotifier<List<PlaceDTO>>(<PlaceDTO>[]);
    widget._store.addressPlaces = ValueNotifier<List<PlaceDTO>>(<PlaceDTO>[]);
  }

  @override
  void dispose() {
    super.dispose();
    _cityFocusNode.dispose();
    _addressFocusNode.dispose();
    _genderController.dispose();
    _addressController.dispose();
    _birthDayController.dispose();

    widget._store.citiesPlaces.dispose();
    widget._store.addressPlaces.dispose();
    widget._store.loadingCityPlaces.dispose();
    widget._store.loadingAddressPlaces.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        _addressFocusNode.unfocus();
        widget._store.citiesPlaces.value = <PlaceDTO>[];
        widget._store.addressPlaces.value = <PlaceDTO>[];
      },
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * .04,
                    left: size.width * .07,
                    right: size.width * .07
                  ),
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
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .07),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        child: CustomTextfieldWidget(
                          focusNode: _cityFocusNode,
                          controller: _cityController,
                          textInputAction: TextInputAction.done,
                          title: AppLocalizations.of(context)!.city,
                          fillColor: PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                            Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                            Theme.of(context).colorScheme.onSurface.withOpacity(.08),
                          onChanged: (value) async {
                            widget._store.addressPlaces.value = <PlaceDTO>[];
                            if (value.isEmpty) return widget._store.citiesPlaces.value = <PlaceDTO>[];
                            await widget._store.getCitiesPlaces(value);
                          }
                        ),
                      ),
                      SizedBox(
                        child: ValueListenableBuilder<bool>(
                          valueListenable: widget._store.loadingCityPlaces,
                          builder: (_,  value, __) {
                            return Visibility(
                              visible: value,
                              child: LinearProgressIndicator(
                                minHeight: size.height * .0015,
                                valueColor: AlwaysStoppedAnimation<Color?>(Theme.of(context).colorScheme.secondary),
                                backgroundColor: PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                                  Theme.of(context).colorScheme.onSurface.withOpacity(.05) :
                                  Theme.of(context).colorScheme.onSurface.withOpacity(.15),
                              ),
                            );
                          }
                        )
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * .0251),
              SizedBox(
                child: ValueListenableBuilder<List<PlaceEntity>>(
                  valueListenable: widget._store.citiesPlaces,
                  builder: (_, value, __) {
                    return Visibility(
                      visible: value.isNotEmpty,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * .07),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          color: PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                            Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                            Theme.of(context).colorScheme.onSurface.withOpacity(.08),
                          child: SizedBox(
                            width: size.width,
                            height: size.height * .35,
                            child: ListView.builder(
                              itemCount: value.length,
                              itemBuilder: (_, index) => InkWell(
                                onTap: () {
                                  _cityFocusNode.unfocus();
                                  widget._store.citiesPlaces.value = <PlaceDTO>[];
                                  _cityController.text = "${value[index].properties?.name}, ${value[index].properties?.country}";
                                },
                                borderRadius: BorderRadius.only(
                                  topLeft: index == 0 ? const Radius.circular(10) : Radius.zero,
                                  topRight: index == 0 ? const Radius.circular(10) : Radius.zero,
                                  bottomLeft: index == 6 ? const Radius.circular(10) : Radius.zero,
                                  bottomRight: index == 6 ? const Radius.circular(10) : Radius.zero
                                ),
                                child: SizedBox(
                                  width: size.width,
                                  height: size.height * .05,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          child: Icon(
                                            LucideIcons.mapPin,
                                            size: size.height * .018,
                                          ),
                                        ),
                                        SizedBox(width: size.width * .02),
                                        Expanded(
                                          child: Text(
                                            "${value[index].properties?.name}, ${value[index].properties?.country}",
                                            style: AppStyleDesign.fontStyleInter(
                                              size: size.height * .017,
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context).colorScheme.onSurface,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ),
                          ),
                        ).animate()
                         .moveX(
                          begin: -300,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastEaseInToSlowEaseOut,
                        ),
                      ),
                    );
                  }
                ),
              ),
              SizedBox(
                child: ValueListenableBuilder<List<PlaceEntity>>(
                  valueListenable: widget._store.citiesPlaces,
                  builder: (_, value, __) {
                    return Visibility(
                      visible: value.isEmpty,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: size.width * .07,
                          right: size.width * .07,
                          bottom: size.height * .0251
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              child: CustomTextfieldWidget(
                                focusNode: _addressFocusNode,
                                controller: _addressController,
                                textInputAction: TextInputAction.done,
                                title: AppLocalizations.of(context)!.address,
                                fillColor: PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                                  Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                                  Theme.of(context).colorScheme.onSurface.withOpacity(.08),
                                onChanged: (value) async {
                                  widget._store.citiesPlaces.value = <PlaceDTO>[];
                                  if (value.isEmpty) return widget._store.addressPlaces.value = <PlaceDTO>[];
                                  await widget._store.getAddressPlaces(value);
                                }
                              ),
                            ),
                            SizedBox(
                              child: ValueListenableBuilder<bool>(
                                valueListenable: widget._store.loadingAddressPlaces,
                                builder: (_,  value, __) {
                                  return Visibility(
                                    visible: value,
                                    child: LinearProgressIndicator(
                                      minHeight: size.height * .0015,
                                      valueColor: AlwaysStoppedAnimation<Color?>(Theme.of(context).colorScheme.secondary),
                                      backgroundColor: PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                                        Theme.of(context).colorScheme.onSurface.withOpacity(.05) :
                                        Theme.of(context).colorScheme.onSurface.withOpacity(.15),
                                    ),
                                  );
                                }
                              )
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
              SizedBox(
                child: ValueListenableBuilder<List<PlaceEntity>>(
                  valueListenable: widget._store.addressPlaces,
                  builder: (_, value, __) {
                    return Visibility(
                      visible: value.isNotEmpty,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * .07),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          color: PlatformDispatcher.instance.platformBrightness == Brightness.dark ?
                            Theme.of(context).colorScheme.onSecondary.withOpacity(.3) :
                            Theme.of(context).colorScheme.onSurface.withOpacity(.08),
                          child: SizedBox(
                            width: size.width,
                            height: size.height * .35,
                            child: ListView.builder(
                              itemCount: value.length,
                              itemBuilder: (_, index) => InkWell(
                                onTap: () {
                                  _addressFocusNode.unfocus();
                                  widget._store.addressPlaces.value = <PlaceDTO>[];
                                  _addressController.text = "${value[index].properties?.name}, ${value[index].properties?.country}";
                                },
                                borderRadius: BorderRadius.only(
                                  topLeft: index == 0 ? const Radius.circular(10) : Radius.zero,
                                  topRight: index == 0 ? const Radius.circular(10) : Radius.zero,
                                  bottomLeft: index == 6 ? const Radius.circular(10) : Radius.zero,
                                  bottomRight: index == 6 ? const Radius.circular(10) : Radius.zero
                                ),
                                child: SizedBox(
                                  width: size.width,
                                  height: size.height * .05,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          child: Icon(
                                            LucideIcons.mapPin,
                                            size: size.height * .018,
                                          ),
                                        ),
                                        SizedBox(width: size.width * .02),
                                        Expanded(
                                          child: Text(
                                            "${value[index].properties?.name}, ${value[index].properties?.country}",
                                            style: AppStyleDesign.fontStyleInter(
                                              size: size.height * .017,
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context).colorScheme.onSurface,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ),
                          ),
                        ).animate()
                         .moveX(
                          begin: -300,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastEaseInToSlowEaseOut,
                        ),
                      ),
                    );
                  }
                ),
              ),
              SizedBox(
                child: ValueListenableBuilder<List<PlaceEntity>>(
                  valueListenable: widget._store.citiesPlaces,
                  builder: (_, cities, __) {
                    return ValueListenableBuilder<List<PlaceEntity>>(
                      valueListenable: widget._store.addressPlaces,
                      builder: (_, address, __) {
                        return Visibility(
                          visible: address.isEmpty && cities.isEmpty,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * .07),
                            child: Column(
                              children: <Widget>[
                                ValueListenableBuilder<DateTime>(
                                  valueListenable: widget._store.birthDate,
                                  builder: (_, value, __) {
                                    return CustomTextfieldWidget(
                                      readOnly: true,
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
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(right: size.width * .02),
                                    child: SizedBox(
                                      width: size.width * .15,
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
                                ),
                              ],
                            ),
                          )
                        );
                      }
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}