part of '../use_cases.dart';

class GetImageDataUseCase {
  final ImagesRepository repository;

  GetImageDataUseCase({required this.repository});

  Future<Uint8List?> call(String imageUrl) async {
    final cacheImageData = await repository.getImagefromCache(imageUrl);

    if (cacheImageData?.isNotEmpty ?? false) {
      return cacheImageData!;
    }

    return await repository.saveImageToDB(imageUrl);
  }
}
