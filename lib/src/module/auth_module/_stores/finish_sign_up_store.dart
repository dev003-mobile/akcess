import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/domain/exceptions/failure_exception.dart';
import '../../../core/domain/entities/place_entities/place_entity.dart';
import '../../../core/domain/usecases/place_usecases/get_places_usecase.dart';

class FinishSignUpStore {
  final GetPlacesUsecase _getPlacesUsecase;

  FinishSignUpStore(this._getPlacesUsecase);

  late ValueNotifier<int> currentPage;
  late ValueNotifier<DateTime> birthDate;

  late ValueNotifier<bool> loadingCityPlaces;
  late ValueNotifier<bool> loadingAddressPlaces;

  late ValueNotifier<List<PlaceEntity>> citiesPlaces;
  late ValueNotifier<List<PlaceEntity>> addressPlaces;

  Future<(List<PlaceEntity>?, String?)> getCitiesPlaces(String place) async {
    String? exception;

    loadingCityPlaces.value = true;

    try {
      if (place.isEmpty) {
        citiesPlaces.value = <PlaceEntity>[];
        return (<PlaceEntity>[], null);
      } 
      final Either<FailureException, List<PlaceEntity>> placesResult = await _getPlacesUsecase(place);
      placesResult.fold(
        (error) => exception = error.message,
        (success) => citiesPlaces.value = success
      );
      return (citiesPlaces.value, exception);
    } catch (e) {
      return (<PlaceEntity>[], null);
    } finally {
      loadingCityPlaces.value = false;
    }
  }

  Future<(List<PlaceEntity>?, String?)> getAddressPlaces(String place) async {
    String? exception;

    loadingAddressPlaces.value = true;

    try {
      if (place.isEmpty) {
        addressPlaces.value = <PlaceEntity>[];
        return (<PlaceEntity>[], null);
      } 
      final Either<FailureException, List<PlaceEntity>> placesResult = await _getPlacesUsecase(place);
      placesResult.fold(
        (error) => exception = error.message,
        (success) => addressPlaces.value = success
      );
      return (addressPlaces.value, exception);
    } catch (e) {
      return (<PlaceEntity>[], null);
    } finally {
      loadingAddressPlaces.value = false;
    }
  }
}
