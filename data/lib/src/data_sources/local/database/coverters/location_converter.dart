part of '../database.dart';

class LocationConverter extends TypeConverter<LocationDTO, String>
    with JsonTypeConverter2<LocationDTO, String, Map<String, dynamic>> {
  @override
  LocationDTO fromJson(Map<String, dynamic> json) {
    return LocationDTO.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(LocationDTO value) {
    return value.toJson();
  }

  @override
  LocationDTO fromSql(String fromDb) {
    return LocationDTO.fromJson(jsonDecode(fromDb));
  }

  @override
  String toSql(LocationDTO value) {
    return jsonEncode(value.toJson());
  }
}
