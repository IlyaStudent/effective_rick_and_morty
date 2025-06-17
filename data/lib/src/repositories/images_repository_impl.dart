part of 'repositories.dart';

class ImagesRepositoryImpl implements ImagesRepository {
  final ImagesLocalDataSource localDataSource;
  final ImagesRemoteDataSource remoteDataSource;

  ImagesRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Uint8List?> getImagefromCache(String imageUrl) async {
    return await localDataSource.getImageFromCache(imageUrl);
  }

  @override
  Future<Uint8List?> saveImageToDB(String imageUrl) async {
    final imageData = await remoteDataSource.getImageData(imageUrl);
    final image = ImageEntity(url: imageUrl, data: imageData ?? Uint8List(0));
    localDataSource.saveImageToCache(image);

    return imageData;
  }
}
