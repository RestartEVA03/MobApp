// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WeatherDao? _weatherDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Weather` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `locationName` TEXT NOT NULL, `temperature` REAL NOT NULL, `description` TEXT NOT NULL, `humidity` TEXT NOT NULL, `windSpeed` TEXT NOT NULL, `iconUrl` TEXT NOT NULL, `dateTime` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WeatherDao get weatherDao {
    return _weatherDaoInstance ??= _$WeatherDao(database, changeListener);
  }
}

class _$WeatherDao extends WeatherDao {
  _$WeatherDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _weatherInsertionAdapter = InsertionAdapter(
            database,
            'Weather',
            (Weather item) => <String, Object?>{
                  'id': item.id,
                  'locationName': item.locationName,
                  'temperature': item.temperature,
                  'description': item.description,
                  'humidity': item.humidity,
                  'windSpeed': item.windSpeed,
                  'iconUrl': item.iconUrl,
                  'dateTime': _dateTimeConverter.encode(item.dateTime)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Weather> _weatherInsertionAdapter;

  @override
  Future<Weather?> findLatestWeatherByCity(String locationName) async {
    return _queryAdapter.query(
        'SELECT * FROM Weather WHERE locationName = ?1 ORDER BY dateTime DESC LIMIT 1',
        mapper: (Map<String, Object?> row) => Weather(id: row['id'] as int?, locationName: row['locationName'] as String, temperature: row['temperature'] as double, description: row['description'] as String, humidity: row['humidity'] as String, windSpeed: row['windSpeed'] as String, dateTime: _dateTimeConverter.decode(row['dateTime'] as int), iconUrl: row['iconUrl'] as String),
        arguments: [locationName]);
  }

  @override
  Future<void> insertWeather(Weather weather) async {
    await _weatherInsertionAdapter.insert(weather, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
