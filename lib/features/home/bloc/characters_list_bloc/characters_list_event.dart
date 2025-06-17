part of '../../home.dart';

@freezed
class CharactersListEvent with _$CharactersListEvent {
  const factory CharactersListEvent.getAllCharacters() = _GetAllCharactersEvent;

  const factory CharactersListEvent.refreshCharactersList() =
      _RefreshCharactersListEvent;
}
