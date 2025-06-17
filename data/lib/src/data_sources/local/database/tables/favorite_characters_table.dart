part of '../database.dart';

class FavoriteCharactersTable extends Table {
  IntColumn get characterId => integer()();

  @override
  Set<Column<Object>>? get primaryKey => {characterId};
}
