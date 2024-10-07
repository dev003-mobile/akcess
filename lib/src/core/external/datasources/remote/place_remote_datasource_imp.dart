import 'dart:io';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../servers/api_server.dart';
import '../../dto/place_dto/place_dto.dart';
import '../contracts/i_place_contract_datasource.dart';
import '../../../domain/exceptions/failure_exception.dart';
import '../../../presenter/utils/context/app_context.dart';
import '../../../domain/entities/place_entities/place_entity.dart';

class PlaceRemoteDatasourceImp implements IPlaceContractDatasource {
  final APIServer _apiServer;

  PlaceRemoteDatasourceImp(this._apiServer);

  @override
  Future<Either<FailureException, List<PlaceEntity>>> getPlaces(String place) async { 
    final String url = "https://photon.komoot.io/api/?q=$place&limit=7";
    try {
      final http.Response response = await _apiServer.get(url);    
      final Map<String, dynamic> jsonParse = jsonDecode(response.body);

      if (response.statusCode == HttpStatus.ok) {
        final List<PlaceEntity> places = List.from((jsonParse["features"]) as List).map((e) => PlaceDTO.fromJson(e)).toList();
        return Right(places);
      }

      return const Right(<PlaceEntity>[]);
    } on SocketException catch (_) {
      return Left(FailureException(AppLocalizations.of(AppContext.navigatorKey.currentContext!)!.checkYourInternetConnection));
    } catch (_) {
      return Left(FailureException(AppLocalizations.of(AppContext.navigatorKey.currentContext!)!.thereWasAProblem));
    }
  }
}