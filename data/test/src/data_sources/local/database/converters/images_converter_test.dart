import 'dart:typed_data';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:test/test.dart';

void main() {
  late ImagesConverter converter;

  setUp(() {
    converter = ImagesConverter();
  });

  group('ImagesConverter', () {
    final fakeImageEntity = ImageEntity(
      url: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      data: Uint8List.fromList([1, 2, 3]),
    );

    final fakeTableRow = ImagesTableData(
      url: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      data: Uint8List.fromList([1, 2, 3]),
    );

    test('fromTableRow should convert table row to ImageEntity', () {
      // Act
      final result = converter.fromTableRow(fakeTableRow);

      // Assert
      expect(result.url, equals(fakeImageEntity.url));
      expect(result.data, equals(fakeImageEntity.data));
    });

    test('toTableRow should convert ImageEntity to table companion', () {
      // Act
      final result = converter.toTableRow(fakeImageEntity);

      // Assert
      expect(result.url.value, equals(fakeImageEntity.url));
      expect(result.data.value, equals(fakeImageEntity.data));

      expect(result, isA<ImagesTableCompanion>());
    });

    test('should have symmetric conversions', () {
      // Act
      final companion = converter.toTableRow(fakeImageEntity);
      final tableData = ImagesTableData(
        url: companion.url.value,
        data: companion.data.value,
      );
      final restoredEntity = converter.fromTableRow(tableData);

      // Assert
      expect(restoredEntity.url, equals(fakeImageEntity.url));
      expect(restoredEntity.data, equals(fakeImageEntity.data));
    });

    test('should handle empty image data', () {
      // Arrange
      final emptyImage = ImageEntity(url: 'empty.jpg', data: Uint8List(0));

      // Act
      final companion = converter.toTableRow(emptyImage);
      final restored = converter.fromTableRow(
        ImagesTableData(url: companion.url.value, data: companion.data.value),
      );

      // Assert
      expect(restored.data.isEmpty, isTrue);
      expect(restored.url, equals('empty.jpg'));
    });
  });
}
