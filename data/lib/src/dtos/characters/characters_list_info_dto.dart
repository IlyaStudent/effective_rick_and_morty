part of '../dtos.dart';

@JsonSerializable(createToJson: true)
class CharactersListInfoDTO extends CharactersListInfoEntity {
  @override
  @JsonKey(name: 'next')
  final String? nextPage;

  @override
  @JsonKey(name: 'prev')
  final String? prevPage;

  CharactersListInfoDTO({
    required super.count,
    required super.pages,
    this.nextPage,
    this.prevPage,
  }) : super(nextPage: nextPage, prevPage: prevPage);

  factory CharactersListInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$CharactersListInfoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersListInfoDTOToJson(this);
}
