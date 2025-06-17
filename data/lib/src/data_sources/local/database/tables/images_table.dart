part of '../database.dart';

class ImagesTable extends Table {
  TextColumn get url => text()();

  BlobColumn get data => blob()();

  @override
  Set<Column<Object>>? get primaryKey => {url};
}
