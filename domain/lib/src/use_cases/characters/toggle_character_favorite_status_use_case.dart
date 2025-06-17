part of '../use_cases.dart';

class ToggleCharacterFavoriteStatusUseCase {
  final CharactersRepository repository;

  ToggleCharacterFavoriteStatusUseCase({required this.repository});

  Future<bool> call(CharacterEntity character) async {
    final isFavorite = await repository.isCharacterFavorite(character);

    if (isFavorite) {
      await repository.removeCharacterFromFavorite(character);
    } else {
      await repository.addCharacterToFavorite(character);
    }

    return !isFavorite;
  }
}
