part of '../database.dart';

@DriftAccessor(tables: [CharactersTable, FavoriteCharactersTable])
class CharactersDAO extends DatabaseAccessor<AppDatabase>
    with _$CharactersDAOMixin {
  CharactersDAO(super.db);

  final _converter = CharacterConverter();

  Future<void> saveCharctersToCache(List<CharacterDTO> characters) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        charactersTable,
        characters.map(_converter.toTableRow),
      );
    });
  }

  Future<List<CharacterDTO>> getCharactersFromCache() async {
    final queryResult = await select(charactersTable).get();
    final characters = queryResult.map(_converter.fromTableRow).toList();

    return characters;
  }

  Future<void> addCharacterToFavorite(int characterId) async {
    await into(favoriteCharactersTable).insert(
      FavoriteCharactersTableCompanion.insert(characterId: Value(characterId)),
      mode: InsertMode.insertOrIgnore,
    );
  }

  Future<void> removeCharacterFromFavorite(int charcterId) async {
    await (delete(favoriteCharactersTable)
      ..where((favorite) => favorite.characterId.equals(charcterId))).go();
  }

  Future<bool> isCharacterFavorite(int characterId) async {
    final result =
        await (select(favoriteCharactersTable)..where(
          (favorite) => favorite.characterId.equals(characterId),
        )).getSingleOrNull();

    return result != null;
  }

  Future<List<int>> getFavoriteCharactersIds() async {
    final result = await select(favoriteCharactersTable).get();
    return result.map((favorite) => favorite.characterId).toList();
  }
}
