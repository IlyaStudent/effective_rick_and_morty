part of '../database.dart';

class CharactersTable extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get status => text()();

  TextColumn get species => text()();

  TextColumn get type => text()();

  TextColumn get gender => text()();

  TextColumn get origin => text().map(LocationConverter())();

  TextColumn get location => text().map(LocationConverter())();

  TextColumn get image => text()();

  TextColumn get episode => text().map(ListConverter())();

  TextColumn get url => text()();

  TextColumn get created => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
