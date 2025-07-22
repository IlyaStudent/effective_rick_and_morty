import 'package:data/src/data_sources/local/database/database.dart';
import 'package:test/test.dart';

void main() {
  late ListConverter converter;

  setUp(() {
    converter = ListConverter();
  });

  group('ListConverter', () {
    test('should convert empty list to SQL and back', () {
      // Arrange
      const original = <String>[];

      // Act
      final sql = converter.toSql(original);
      final restored = converter.fromSql(sql);

      // Assert
      expect(sql, equals('[]'));
      expect(restored, equals(original));
    });

    test('should convert single-item list to SQL and back', () {
      // Arrange
      const original = ['item1'];

      // Act
      final sql = converter.toSql(original);
      final restored = converter.fromSql(sql);

      // Assert
      expect(sql, equals('["item1"]'));
      expect(restored, equals(original));
    });

    test('should convert multi-item list to SQL and back', () {
      // Arrange
      const original = ['item1', 'item2', 'item3'];

      // Act
      final sql = converter.toSql(original);
      final restored = converter.fromSql(sql);

      // Assert
      expect(sql, equals('["item1","item2","item3"]'));
      expect(restored, equals(original));
    });
  });

  test('should throw FormatException for invalid JSON', () {
    // Arrabge
    const invalidJson = '["item1", "item2"';

    // Assert
    expect(
      () => converter.fromSql(invalidJson),
      throwsA(isA<FormatException>()),
    );
  });
}
