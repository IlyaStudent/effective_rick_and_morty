part of '../data_sources.dart';

class ImagesLocalDataSource {
  final ImagesDAO dao;

  ImagesLocalDataSource({required this.dao});

  Future<void> saveImageToCache(ImageEntity image) async {
    await dao.saveImageToCache(image);
  }

  Future<Uint8List?> getImageFromCache(String imageUrl) async {
    return await dao.getImageFromCache(imageUrl);
  }
}
