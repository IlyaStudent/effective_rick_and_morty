part of '../dtos.dart';

@JsonSerializable(createToJson: true)
class LocationDTO extends LocationEntity {
  const LocationDTO({required super.name, required super.url}) : super();

  factory LocationDTO.fromJson(Map<String, dynamic> json) =>
      _$LocationDTOFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDTOToJson(this);

  factory LocationDTO.fromEntity(LocationEntity location) =>
      LocationDTO(name: location.name, url: location.url);

  @override
  int get hashCode => name.hashCode ^ url.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is LocationDTO &&
            runtimeType == other.runtimeType &&
            name == other.name &&
            url == other.url;
  }
}
