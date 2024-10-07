import 'package:dartz/dartz.dart';

import '../../../domain/exceptions/failure_exception.dart';
import '../../../domain/entities/place_entities/place_entity.dart';

abstract class IPlaceContractDatasource {
  Future<Either<FailureException, List<PlaceEntity>>> getPlaces(String place);
}