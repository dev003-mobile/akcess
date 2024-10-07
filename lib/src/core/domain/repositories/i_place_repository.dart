import 'package:dartz/dartz.dart';

import '../exceptions/failure_exception.dart';
import '../entities/place_entities/place_entity.dart';

abstract class IPlaceRepository {
  Future<Either<FailureException, List<PlaceEntity>>> getPlaces(String place);
}
