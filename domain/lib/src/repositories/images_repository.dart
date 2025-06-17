part of 'repositories.dart';

abstract class ImagesRepository {
  Future<Uint8List?> saveImageToDB(String imageUrl);

  Future<Uint8List?> getImagefromCache(String imageUrl);
}
