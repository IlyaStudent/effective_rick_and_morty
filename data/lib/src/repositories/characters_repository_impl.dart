part of 'repositories.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersRemoteDataSource remoteDataSource;
  final CharactersLocalDataSource localDataSource;

  CharactersRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<CharactersListEntity> getAllCharacters({int page = 0}) async {
    CharactersListDTO charactersList;

    try {
      charactersList = await remoteDataSource.getAllCharacters(page);
      await localDataSource.saveCharactersToCache(charactersList.characters);
    } on DioException catch (e) {
      final isNetworkError =
          e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout;

      if (!isNetworkError) {
        rethrow;
      }
      final cacheCharacters = await localDataSource.getCharactersFromCache();

      charactersList = CharactersListDTO(
        info: CharactersListInfoDTO(count: cacheCharacters.length, pages: 1),
        characters: cacheCharacters,
      );
    }

    charactersList = await _markFavoriteCharacters(charactersList);

    return charactersList;
  }

  @override
  Future<void> addCharacterToFavorite(CharacterEntity character) async {
    await localDataSource.addCharacterToFavorite(character.id);
  }

  @override
  Future<void> removeCharacterFromFavorite(CharacterEntity character) async {
    await localDataSource.removeCharacterFromFavorite(character.id);
  }

  @override
  Future<bool> isCharacterFavorite(CharacterEntity character) async {
    return await localDataSource.isCharacterFavorite(character.id);
  }

  @override
  Future<CharactersListEntity> getFavotiteCharacters() async {
    final characters = await localDataSource.getCharactersFromCache();

    final favoriteCharacters = await _markFavoriteCharacters(
      CharactersListDTO(
        info: CharactersListInfoDTO(count: characters.length, pages: 1),
        characters: characters,
      ),
    );

    favoriteCharacters.characters.removeWhere(
      (character) => !character.isFavorite,
    );

    return favoriteCharacters;
  }

  Future<CharactersListDTO> _markFavoriteCharacters(
    CharactersListDTO charactersList,
  ) async {
    final favoriteIds = await localDataSource.getFavoriteCharactersIds();

    return charactersList.copyWith(
      characters:
          charactersList.characters
              .map(
                (character) => character.copyWith(
                  isFavorite: favoriteIds.contains(character.id),
                ),
              )
              .toList(),
    );
  }
}
