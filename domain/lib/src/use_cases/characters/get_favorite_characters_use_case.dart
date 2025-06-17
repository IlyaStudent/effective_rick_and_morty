part of '../use_cases.dart';

class GetFavoriteCharactersUseCase {
  final CharactersRepository repository;

  GetFavoriteCharactersUseCase({required this.repository});

  Future<CharactersListEntity> call() async {
    return await repository.getFavotiteCharacters();
  }
}
