part of 'database.dart';

@DriftDatabase(
  tables: [ImagesTable, CharactersTable, FavoriteCharactersTable],
  daos: [ImagesDAO, CharactersDAO],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  factory AppDatabase.inMemory() {
    return AppDatabase(NativeDatabase.memory());
  }

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();

      final file = File(join(dbFolder.path, 'my_database.sqlite'));

      if (!await file.parent.exists()) {
        await file.parent.create(recursive: true);
      }
      return NativeDatabase(file);
    });
  }
}
