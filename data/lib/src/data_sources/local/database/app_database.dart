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
    return LazyDatabase(() async {
      final dbFolder = Directory.current;
      await dbFolder.create(recursive: true);

      final file = File(join(dbFolder.path, 'my_database.sqlite'));
      return NativeDatabase(file);
    });
  }
}
