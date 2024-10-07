import 'package:dartz/dartz.dart';

import '../../domain/exceptions/failure_exception.dart';
import '../../domain/repositories/i_place_repository.dart';
import '../../domain/entities/place_entities/place_entity.dart';
import '../datasources/contracts/i_place_contract_datasource.dart';

class PlaceRepositoryImp implements IPlaceRepository {
  final IPlaceContractDatasource _placeContractDatasource;

  PlaceRepositoryImp(this._placeContractDatasource);

  @override
  Future<Either<FailureException, List<PlaceEntity>>> getPlaces(String place) async => await _placeContractDatasource.getPlaces(place);
}