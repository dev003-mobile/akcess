import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:permission_handler/permission_handler.dart';

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

  late ValueNotifier<bool> hasMorePhotos;
  late ValueNotifier<bool> isLoadingPhotos;
  late ValueNotifier<int> currentPagePhotos;
  late ValueNotifier<List<Medium>> images;

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

  Future<void> fetchGalleryPhotos() async {
    try {
      if (await Permission.storage.request().isGranted) {
          final List<Album> albums = await PhotoGallery.listAlbums(mediumType: MediumType.image);

          if (albums.isNotEmpty) {
            final Album album = albums[0];
            final MediaPage mediaPage = await album.listMedia();
            images.value.addAll(mediaPage.items);
            isLoadingPhotos.value = false;
          }
        } else {
          await Permission.storage.request();
        }

      // if (permission.isAuth) {
      //   isLoadingPhotos.value = true;

      //   final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(type: RequestType.image);
      //   if (albums.isNotEmpty) {
      //     final List<AssetEntity> albumImages = await albums[0].getAssetListPaged(
      //       size: 30,
      //       page: currentPagePhotos.value,
      //     );

      //     if (albumImages.isEmpty) {
      //       hasMorePhotos.value = false;
      //     } else {
      //       currentPagePhotos.value++;
      //       images.value.addAll(albumImages);
      //     }

      //   }
      // } else {
      //   await Permission.storage.request();
      // }    
    } catch (e) {
      isLoadingPhotos.value = false;
    }
  }
}
