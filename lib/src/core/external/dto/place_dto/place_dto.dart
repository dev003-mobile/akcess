import 'geometry_dto.dart';
import 'properties_dto.dart';
import '../../../domain/entities/place_entities/place_entity.dart';

class PlaceDTO extends PlaceEntity {
  PlaceDTO({
    super.type,
    super.geometry,
    super.properties,
  });

  PlaceDTO copyWith({
    String? type,
    GeometryDTO? geometry,
    PropertiesDTO? properties,
  }) => 
  PlaceDTO(
    type: type ?? this.type,
    properties: properties ?? this.properties,
    geometry: this.geometry,
  );

  factory PlaceDTO.fromJson(Map<String, dynamic> json) => PlaceDTO(
    type: json["type"],
    geometry: GeometryDTO.fromJson(json["geometry"]),
    properties: PropertiesDTO.fromJson(json["properties"]),
  );
}