import 'package:dartz/dartz.dart';

import '../../exceptions/failure_exception.dart';
import '../../repositories/i_place_repository.dart';
import '../../entities/place_entities/place_entity.dart';

class GetPlacesUsecase {
  final IPlaceRepository _iPlaceRepository;

  GetPlacesUsecase(this._iPlaceRepository);

  Future<Either<FailureException, List<PlaceEntity>>> call(String place) async {
    if (place.isEmpty) return const Right(<PlaceEntity>[]);
    return await _iPlaceRepository.getPlaces(place);
  }
}
