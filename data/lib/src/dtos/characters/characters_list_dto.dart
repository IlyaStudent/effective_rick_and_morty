part of '../dtos.dart';

@JsonSerializable()
class CharactersListDTO extends CharactersListEntity {
  @override
  final CharactersListInfoDTO info;

  @JsonKey(name: 'results')
  @override
  final List<CharacterDTO> characters;

  CharactersListDTO({required this.info, required this.characters})
    : super(info: info, characters: characters);

  factory CharactersListDTO.fromJson(Map<String, dynamic> json) =>
      _$CharactersListDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersListDTOToJson(this);

  CharactersListDTO copyWith({
    CharactersListInfoDTO? info,
    List<CharacterDTO>? characters,
  }) {
    return CharactersListDTO(
      info: info ?? this.info,
      characters: characters ?? this.characters,
    );
  }
}
