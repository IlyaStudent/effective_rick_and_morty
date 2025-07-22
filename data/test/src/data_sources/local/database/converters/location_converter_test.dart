import 'package:data/data.dart';
import 'package:test/test.dart';

void main() {
  late LocationConverter converter;

  setUp(() {
    converter = LocationConverter();
  });

  group('LocationConverter', () {
    final fakeLocationDTO = LocationDTO(
      name: 'Earth',
      url: 'https://rickandmortyapi.com/api/location/1',
    );

    const fakeLocationJson = {
      'name': 'Earth',
      'url': 'https://rickandmortyapi.com/api/location/1',
    };

    const fakeLocationSql =
        '{"name":"Earth","url":"https://rickandmortyapi.com/api/location/1"}';

    test('fromJson() should convert JSON to LocationDTO', () {
      // Act
      final result = converter.fromJson(fakeLocationJson);

      // Assert
      expect(result, equals(fakeLocationDTO));
    });

    test('toJson() should convert LocationDTO to JSON', () {
      // Act
      final result = converter.toJson(fakeLocationDTO);

      // Assert
      expect(result, equals(fakeLocationJson));
    });

    test('fromSql() should convert SQL string to LocationDTO', () {
      // Act
      final result = converter.fromSql(fakeLocationSql);

      // Assert
      expect(result, fakeLocationDTO);
    });

    test('toSql() should convert LocationDTO to SQL string', () {
      // Act
      final result = converter.toSql(fakeLocationDTO);

      // Assert
      expect(result, fakeLocationSql);
    });

    test('should have symmetric conversions', () {
      // JSON round-trip
      final jsonRoundTrip = converter.toJson(
        converter.fromJson(fakeLocationJson),
      );
      expect(jsonRoundTrip, equals(fakeLocationJson));

      // SQL round-trip
      final sqlRoundTrip = converter.toSql(converter.fromSql(fakeLocationSql));
      expect(sqlRoundTrip, equals(fakeLocationSql));
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
