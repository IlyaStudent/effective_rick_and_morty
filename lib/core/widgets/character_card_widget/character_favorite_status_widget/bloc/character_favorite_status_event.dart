part of '../../../widgets.dart';

@freezed
sealed class CharacterFavoriteStatusEvent with _$CharacterFavoriteStatusEvent {
  const factory CharacterFavoriteStatusEvent.toggleFavoriteStatus({
    required CharacterEntity character,
  }) = _ToggleFavoriteStatusEvent;
}
