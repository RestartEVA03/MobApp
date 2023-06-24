import 'app_database.dart';

class DatabaseProvider {
  AppDatabase? _database;

  Future<AppDatabase> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<AppDatabase> _initDatabase() async {
    return $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }
}