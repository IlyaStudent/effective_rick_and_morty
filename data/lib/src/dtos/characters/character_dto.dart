part of '../dtos.dart';

@JsonSerializable(createToJson: true, explicitToJson: true)
class CharacterDTO extends CharacterEntity {
  @override
  final LocationDTO origin;

  @override
  final LocationDTO location;

  CharacterDTO({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.type,
    required super.gender,
    required this.origin,
    required this.location,
    required super.image,
    required super.episode,
    required super.url,
    required super.created,
    super.isFavorite = false,
  }) : super(origin: origin, location: location);

  factory CharacterDTO.fromJson(Map<String, dynamic> json) =>
      _$CharacterDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterDTOToJson(this);

  CharacterDTO copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    LocationDTO? origin,
    LocationDTO? location,
    String? image,
    List<String>? episode,
    String? url,
    String? created,
    bool? isFavorite,
  }) {
    return CharacterDTO(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image ?? this.image,
      episode: episode ?? this.episode,
      url: url ?? this.url,
      created: created ?? this.created,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory CharacterDTO.fromEntity(CharacterEntity character) => CharacterDTO(
    id: character.id,
    name: character.name,
    status: character.status,
    species: character.species,
    type: character.type,
    gender: character.gender,
    origin: LocationDTO.fromEntity(character.origin),
    location: LocationDTO.fromEntity(character.location),
    image: character.image,
    episode: character.episode,
    url: character.url,
    created: character.created,
  );
}
