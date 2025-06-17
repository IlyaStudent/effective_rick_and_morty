part of '../../home.dart';

typedef CharactersListState = ApiResponseState<CharactersListEntity>;

class CharactersListBloc
    extends Bloc<CharactersListEvent, CharactersListState> {
  final StateController stateController;
  final GetAllCharactersUseCase useCase;
  CharactersListBloc({required this.stateController, required this.useCase})
    : super(CharactersListState.initial()) {
    on<_GetAllCharactersEvent>(_onGetAllCharactersEvent);
    on<_RefreshCharactersListEvent>(_onRefreshCharactersListEvent);
  }

  Future<void> _onGetAllCharactersEvent(
    _GetAllCharactersEvent event,
    Emitter<CharactersListState> emit,
  ) async {
    final currentState = state;
    await stateController.handleProccess(
      useCase.call,
      onLoading: () {
        emit(ApiResponseState.loading(data: currentState.data));
      },
      onSuccess: (data) {
        emit(ApiResponseState.successful(data: data!));
      },
      onError: (exception) {
        emit(
          ApiResponseState.error(exception: exception, data: currentState.data),
        );
      },
    );
  }

  Future<void> _onRefreshCharactersListEvent(
    _RefreshCharactersListEvent event,
    Emitter<CharactersListState> emit,
  ) async {
    await stateController.handleProccess(
      useCase.refresh,
      onLoading: () {
        emit(ApiResponseState.loading());
      },
      onSuccess: (data) {
        emit(ApiResponseState.successful(data: data!));
      },
      onError: (exception) {
        emit(ApiResponseState.error(exception: exception));
      },
    );
  }
}
