part of 'database.dart';

@DriftDatabase(
  tables: [ImagesTable, CharactersTable, FavoriteCharactersTable],
  daos: [ImagesDAO, CharactersDAO],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
