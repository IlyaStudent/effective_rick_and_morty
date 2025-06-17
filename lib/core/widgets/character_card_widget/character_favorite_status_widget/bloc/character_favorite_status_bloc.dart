part of '../../../widgets.dart';

typedef CharacterFavoriteStatusState = ApiResponseState<bool>;

class CharacterFavoriteStatusBloc
    extends Bloc<CharacterFavoriteStatusEvent, CharacterFavoriteStatusState> {
  final StateController stateController;
  final ToggleCharacterFavoriteStatusUseCase useCase;

  CharacterFavoriteStatusBloc({
    required this.stateController,
    required this.useCase,
  }) : super(CharacterFavoriteStatusState.initial()) {
    on<_ToggleFavoriteStatusEvent>(_onToggleFavoriteStatusEvent);
  }

  Future<void> _onToggleFavoriteStatusEvent(
    _ToggleFavoriteStatusEvent event,
    Emitter<CharacterFavoriteStatusState> emit,
  ) async {
    await stateController.handleProccess(
      () => useCase(event.character),
      onLoading: () {
        emit(CharacterFavoriteStatusState.loading());
      },
      onSuccess: (data) {
        emit(CharacterFavoriteStatusState.successful(data: data!));
      },
      onError: (exception) {
        emit(CharacterFavoriteStatusState.error(exception: exception));
      },
    );
  }
}
