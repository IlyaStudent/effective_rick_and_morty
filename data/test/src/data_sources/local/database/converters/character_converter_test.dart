import 'package:data/data.dart';
import 'package:test/test.dart';

void main() {
  late CharacterConverter converter;

  setUp(() {
    converter = CharacterConverter();
  });

  group('CharacterConverter', () {
    final fakeCharacterDTO = CharacterDTO(
      id: 1,
      name: "Rick Sanchez",
      status: "Alive",
      species: "Human",
      type: "",
      gender: "Male",
      origin: LocationDTO(
        name: "Earth (C-137)",
        url: "https://rickandmortyapi.com/api/location/1",
      ),
      location: LocationDTO(
        name: "Citadel of Ricks",
        url: "https://rickandmortyapi.com/api/location/3",
      ),
      image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      episode: ["https://rickandmortyapi.com/api/episode/1"],
      url: "https://rickandmortyapi.com/api/character/1",
      created: "2017-11-04T18:48:46.250Z",
      isFavorite: false,
    );

    const fakeCharacterJson = {
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
      "episode": ["https://rickandmortyapi.com/api/episode/1"],
      "url": "https://rickandmortyapi.com/api/character/1",
      "created": "2017-11-04T18:48:46.250Z",
      'isFavorite': false,
    };

    const fakeCharacterSql =
        '{"id":1,"name":"Rick Sanchez","status":"Alive","species":"Human","type":"","gender":"Male","image":"https://rickandmortyapi.com/api/character/avatar/1.jpeg","episode":["https://rickandmortyapi.com/api/episode/1"],"url":"https://rickandmortyapi.com/api/character/1","created":"2017-11-04T18:48:46.250Z","isFavorite":false,"origin":{"name":"Earth (C-137)","url":"https://rickandmortyapi.com/api/location/1"},"location":{"name":"Citadel of Ricks","url":"https://rickandmortyapi.com/api/location/3"}}';

    test('fromJson() should convert JSON to CharacterDTO', () {
      // Act
      final result = converter.fromJson(fakeCharacterJson);

      // Assert
      expect(result, equals(fakeCharacterDTO));
    });

    test('toJson() should convert CharacterDTO to JSON', () {
      // Act
      final result = converter.toJson(fakeCharacterDTO);

      // Assert
      expect(result, equals(fakeCharacterJson));
    });

    test('fromSql() should convert SQL string to CharacterDTO', () {
      // Act
      final result = converter.fromSql(fakeCharacterSql);

      // Assert
      expect(result, fakeCharacterDTO);
    });

    test('toSql() should convert CharacterDTO to SQL string', () {
      // Act
      final result = converter.toSql(fakeCharacterDTO);

      // Assert
      expect(result, fakeCharacterSql);
    });

    test('should have symmetric conversions', () {
      // JSON round-trip
      final jsonRoundTrip = converter.toJson(
        converter.fromJson(fakeCharacterJson),
      );
      expect(jsonRoundTrip, equals(fakeCharacterJson));

      // SQL round-trip
      final sqlRoundTrip = converter.toSql(converter.fromSql(fakeCharacterSql));
      expect(sqlRoundTrip, equals(fakeCharacterSql));
    });

    test('should throw for invalid SQL format', () {
      const invalidJson = '{invalid-json}';
      expect(
        () => converter.fromSql(invalidJson),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
