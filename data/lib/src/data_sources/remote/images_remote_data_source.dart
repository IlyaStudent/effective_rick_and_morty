part of '../data_sources.dart';

class ImagesRemoteDataSource {
  final Dio dio;
  final Pool _pool = Pool(3);

  ImagesRemoteDataSource(this.dio);

  Future<Uint8List?> getImageData(String imageUrl) async {
    final resource = await _pool.request();
    try {
      final response = await dio.get<Uint8List>(
        imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );
      return response.data;
    } catch (e) {
      return null;
    } finally {
      resource.release();
    }
  }
}
