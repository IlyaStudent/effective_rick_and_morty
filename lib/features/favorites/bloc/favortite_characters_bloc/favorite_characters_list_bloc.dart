part of '../../favorites.dart';

typedef FavoriteCharactersListState = ApiResponseState<CharactersListEntity>;

class FavoriteCharactersListBloc
    extends Bloc<FavoriteCharactersListEvent, FavoriteCharactersListState> {
  final StateController stateController;
  final GetFavoriteCharactersUseCase useCase;
  FavoriteCharactersListBloc({
    required this.stateController,
    required this.useCase,
  }) : super(FavoriteCharactersListState.initial()) {
    on<_GetAllFavoriteCharactersEvent>(_onGetAllFavoriteCharactersEvent);
  }

  Future<void> _onGetAllFavoriteCharactersEvent(
    _GetAllFavoriteCharactersEvent event,
    Emitter<FavoriteCharactersListState> emit,
  ) async {
    await stateController.handleProccess(
      useCase.call,
      onLoading: () {
        emit(FavoriteCharactersListState.loading());
      },
      onSuccess: (data) {
        emit(FavoriteCharactersListState.successful(data: data!));
      },
      onError: (exception) {
        emit(FavoriteCharactersListState.error(exception: exception));
      },
    );
  }
}
