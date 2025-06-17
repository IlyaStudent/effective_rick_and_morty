part of '../../widgets.dart';

typedef ImageState = ApiResponseState<Uint8List?>;

class ImageCubit extends Cubit<ImageState> {
  final StateController stateController;
  final GetImageDataUseCase useCase;
  ImageCubit({required this.stateController, required this.useCase})
    : super(ImageState.initial());

  Future<void> loadImage(String imageUrl) async {
    await stateController.handleProccess(
      () => useCase.call(imageUrl),
      onLoading: () {
        emit(ImageState.loading());
      },
      onSuccess: (data) {
        emit(ImageState.successful(data: data));
      },
      onError: (exception) {
        emit(ImageState.error(exception: exception));
      },
    );
  }
}
