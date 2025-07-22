import 'dart:typed_data';

import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:test/test.dart';

void main() {
  late ImagesRemoteDataSource dataSource;
  late DioAdapter dioAdapter;
  late Dio dio;

  const String fakeImageUrl = '/images/1';

  setUp(() {
    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);

    dataSource = ImagesRemoteDataSource(dio);
  });

  group('Successful scenarios', () {
    test('return Uint8List', () async {
      // Arrange
      final Uint8List imageResponse = Uint8List.fromList([]);

      dioAdapter.onGet(
        fakeImageUrl,
        (server) => server.reply(200, imageResponse),
      );

      // Act
      final result = await dataSource.getImageData(fakeImageUrl);

      // Assert
      expect(result, isA<Uint8List>());
    });
  });

  group('Error scenarios', () {
    test('return Null', () async {
      // Arrange
      dioAdapter.onGet(fakeImageUrl, (server) => server.reply(404, null));

      // Act
      final result = await dataSource.getImageData(fakeImageUrl);

      // Assert
      expect(result, isNull);
    });
  });
}
