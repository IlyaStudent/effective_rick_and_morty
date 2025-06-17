part of '../data_sources.dart';

class CharactersLocalDataSource {
  final CharactersDAO dao;

  CharactersLocalDataSource({required this.dao});

  Future<void> saveCharactersToCache(List<CharacterEntity> characters) async {
    final charactersDTOList = characters.map(CharacterDTO.fromEntity).toList();
    dao.saveCharctersToCache(charactersDTOList);
  }

  Future<List<CharacterDTO>> getCharactersFromCache() async {
    return await dao.getCharactersFromCache();
  }

  Future<void> addCharacterToFavorite(int characterId) async {
    await dao.addCharacterToFavorite(characterId);
  }

  Future<bool> isCharacterFavorite(int characterId) async {
    return await dao.isCharacterFavorite(characterId);
  }

  Future<void> removeCharacterFromFavorite(int characterId) async {
    await dao.removeCharacterFromFavorite(characterId);
  }

  Future<List<int>> getFavoriteCharactersIds() async {
    return await dao.getFavoriteCharactersIds();
  }
}
