part of '../repositories.dart';

class ImagesRepositoryFake implements ImagesRepository {
  @override
  Future<Uint8List?> getImagefromCache(String imageUrl) async {
    return Uint8List(0);
  }

  @override
  Future<Uint8List?> saveImageToDB(String imageUrl) async {
    return Uint8List(0);
  }
}
