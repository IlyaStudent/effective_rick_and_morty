part of '../database.dart';

@DriftAccessor(tables: [ImagesTable])
class ImagesDAO extends DatabaseAccessor<AppDatabase> with _$ImagesDAOMixin {
  ImagesDAO(super.db);

  final _converter = ImagesConverter();

  Future<void> saveImageToCache(ImageEntity image) async {
    await into(
      imagesTable,
    ).insertOnConflictUpdate(_converter.toTableRow(image));
  }

  Future<Uint8List?> getImageFromCache(String imageUrl) async {
    final result =
        await (select(imagesTable)
          ..where((image) => image.url.equals(imageUrl))).getSingleOrNull();

    return result?.data;
  }
}
