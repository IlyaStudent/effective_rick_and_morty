part of '../dtos.dart';

@JsonSerializable(createToJson: true)
class LocationDTO extends LocationEntity {
  LocationDTO({required super.name, required super.url}) : super();

  factory LocationDTO.fromJson(Map<String, dynamic> json) =>
      _$LocationDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDTOToJson(this);

  factory LocationDTO.fromEntity(LocationEntity location) =>
      LocationDTO(name: location.name, url: location.url);
}
