import 'package:data/data.dart';
import 'package:data/src/data_sources/data_sources_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:test/test.dart';

void main() {
  late CharactersRemoteDataSource dataSource;
  late DioAdapter dioAdapter;
  late Dio dio;

  const int page = 1;

  setUp(() {
    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);

    dataSource = CharactersRemoteDataSource(dio);
  });

  group('Successful scenarios', () {
    test('return CharactersListDTO', () async {
      // Arrange
      const jsonResponse = {
        "info": {
          "count": 826,
          "pages": 42,
          "next": "https://rickandmortyapi.com/api/character/?page=2",
          "prev": null,
        },
        "results": [
          {
            "id": 1,
            "name": "Rick Sanchez",
            "status": "Alive",
            "species": "Human",
            "type": "",
            "gender": "Male",
            "origin": {
              "name": "Earth (C-137)",
              "url": "https://rickandmortyapi.com/api/location/1",
            },
            "location": {
              "name": "Citadel of Ricks",
              "url": "https://rickandmortyapi.com/api/location/3",
            },
            "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            "episode": [
              "https://rickandmortyapi.com/api/episode/1",
              "https://rickandmortyapi.com/api/episode/2",
              "https://rickandmortyapi.com/api/episode/3",
            ],
            "url": "https://rickandmortyapi.com/api/character/1",
            "created": "2017-11-04T18:48:46.250Z",
          },
        ],
      };

      dioAdapter.onGet(
        DataSourcesEndpoints.characters,
        (server) => server.reply(200, jsonResponse),
      );

      // Act
      final result = await dataSource.getAllCharacters(page);

      // Assert
      expect(result, isA<CharactersListDTO>());
    });
  });

  group('Error scenarios', () {
    test('throws DioExcpetion', () async {
      // Arrange
      dioAdapter.onGet(
        DataSourcesEndpoints.characters,
        (server) => server.reply(404, null),
      );

      // Act
      final result = dataSource.getAllCharacters(page);

      // Assert
      expect(result, throwsA(isA<DioException>()));
    });
  });
}
