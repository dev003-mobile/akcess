import 'geometry_entity.dart';
import 'properties_entity.dart';

class PlaceEntity {
  String? type;
  GeometryEntity? geometry;
  PropertiesEntity? properties;

  PlaceEntity({
    required this.type,
    required this.geometry,
    required this.properties,
  });
}