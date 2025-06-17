part of '../database.dart';

class CharacterConverter extends TypeConverter<CharacterDTO, String>
    with JsonTypeConverter2<CharacterDTO, String, Map<String, dynamic>> {
  @override
  CharacterDTO fromJson(Map<String, dynamic> json) {
    return CharacterDTO.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(CharacterDTO value) {
    return value.toJson();
  }

  @override
  CharacterDTO fromSql(String fromDb) {
    return fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(CharacterDTO value) {
    return jsonEncode(toJson(value));
  }

  CharacterDTO fromTableRow(CharactersTableData charcterRow) {
    return CharacterDTO(
      id: charcterRow.id,
      name: charcterRow.name,
      status: charcterRow.status,
      species: charcterRow.species,
      type: charcterRow.type,
      gender: charcterRow.gender,
      origin: charcterRow.origin,
      location: charcterRow.location,
      image: charcterRow.image,
      episode: charcterRow.episode,
      url: charcterRow.url,
      created: charcterRow.created,
    );
  }

  CharactersTableCompanion toTableRow(CharacterDTO charcter) {
    return CharactersTableCompanion(
      id: Value(charcter.id),
      name: Value(charcter.name),
      status: Value(charcter.status),
      species: Value(charcter.species),
      type: Value(charcter.type),
      gender: Value(charcter.gender),
      origin: Value(charcter.origin),
      location: Value(charcter.location),
      image: Value(charcter.image),
      episode: Value(charcter.episode),
      url: Value(charcter.url),
      created: Value(charcter.created),
    );
  }
}
