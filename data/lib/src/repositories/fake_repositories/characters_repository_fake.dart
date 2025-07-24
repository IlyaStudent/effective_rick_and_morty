part of '../repositories.dart';

class CharactersRepositoryFake implements CharactersRepository {
  @override
  Future<void> addCharacterToFavorite(CharacterEntity character) async {}

  @override
  Future<CharactersListEntity> getAllCharacters({int page = 0}) async {
    return CharactersListEntity(
      info: CharactersListInfoEntity(count: 0, pages: 0),
      characters: [],
    );
  }

  @override
  Future<CharactersListEntity> getFavotiteCharacters() async {
    return CharactersListEntity(
      info: CharactersListInfoEntity(count: 0, pages: 0),
      characters: [],
    );
  }

  @override
  Future<bool> isCharacterFavorite(CharacterEntity character) async {
    return false;
  }

  @override
  Future<void> removeCharacterFromFavorite(CharacterEntity character) async {}
}
