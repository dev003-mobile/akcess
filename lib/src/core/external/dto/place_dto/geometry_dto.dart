import '../../../domain/entities/place_entities/geometry_entity.dart';

class GeometryDTO extends GeometryEntity {
  GeometryDTO({
    super.coordinates,
    super.type,
  });

  GeometryDTO copyWith({
    List<double>? coordinates,
    String? type,
  }) => 
  GeometryDTO(
    coordinates: coordinates ?? this.coordinates,
    type: type ?? this.type,
  );

  factory GeometryDTO.fromJson(Map<String, dynamic> json) => GeometryDTO(
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
    type: json["type"],
  );
}