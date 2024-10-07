import '../../../domain/entities/place_entities/properties_entity.dart';

class PropertiesDTO extends PropertiesEntity {
  PropertiesDTO({
    super.city,
    super.country,
    super.name,
  });

  PropertiesDTO copyWith({
    String? city,
    String? country,
    String? name,
  }) => 
  PropertiesDTO(
    city: city ?? this.city,
    country: country ?? this.country,
    name: name ?? this.name,
  );

  factory PropertiesDTO.fromJson(Map<String, dynamic> json) => PropertiesDTO(
    city: json["city"],
    country: json["country"],
    name: json["name"],
  );
}