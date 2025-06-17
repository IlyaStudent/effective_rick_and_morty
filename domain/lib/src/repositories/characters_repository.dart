part of 'repositories.dart';

abstract class CharactersRepository {
  Future<CharactersListEntity> getAllCharacters({int page = 0});

  Future<void> addCharacterToFavorite(CharacterEntity character);

  Future<void> removeCharacterFromFavorite(CharacterEntity character);

  Future<CharactersListEntity> getFavotiteCharacters();

  Future<bool> isCharacterFavorite(CharacterEntity character);
}
