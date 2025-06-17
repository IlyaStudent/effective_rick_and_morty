part of '../../favorites.dart';

@freezed
class FavoriteCharactersListEvent with _$FavoriteCharactersListEvent {
  const factory FavoriteCharactersListEvent.getAllFavoriteCharacters() =
      _GetAllFavoriteCharactersEvent;
}
