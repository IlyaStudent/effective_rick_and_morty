part of '../use_cases.dart';

class GetAllCharactersUseCase {
  final CharactersRepository repository;

  GetAllCharactersUseCase({required this.repository});

  CharactersListInfoEntity _charactersListInfo = CharactersListInfoEntity(
    count: 0,
    pages: 0,
    nextPage: 'empty',
  );
  int page = 0;

  final List<CharacterEntity> _loadedCharacters = [];

  CharactersListEntity get charactersListEntity => CharactersListEntity(
    info: _charactersListInfo,
    characters: _loadedCharacters,
  );

  Future<CharactersListEntity> call() async {
    if (_charactersListInfo.hasReachEnd) {
      return charactersListEntity;
    }
    page++;

    CharactersListEntity response;
    response = await repository.getAllCharacters(page: page);

    _charactersListInfo = response.info;
    _loadedCharacters.addAll(response.characters);
    return charactersListEntity;
  }

  Future<CharactersListEntity> refresh() async {
    page = 0;
    _loadedCharacters.clear();
    _charactersListInfo = CharactersListInfoEntity(
      count: 0,
      pages: 0,
      nextPage: 'empty',
    );

    return await call();
  }
}
