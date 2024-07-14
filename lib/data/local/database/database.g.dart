// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
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

  RestaurantDao? _restaurantDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `restaurant` (`restaurantId` TEXT NOT NULL, `name` TEXT NOT NULL, `description` TEXT NOT NULL, `city` TEXT NOT NULL, `address` TEXT NOT NULL, `pictureId` TEXT NOT NULL, `rating` REAL NOT NULL, PRIMARY KEY (`restaurantId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  RestaurantDao get restaurantDao {
    return _restaurantDaoInstance ??= _$RestaurantDao(database, changeListener);
  }
}

class _$RestaurantDao extends RestaurantDao {
  _$RestaurantDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _restaurantEntityInsertionAdapter = InsertionAdapter(
            database,
            'restaurant',
            (RestaurantEntity item) => <String, Object?>{
                  'restaurantId': item.restaurantId,
                  'name': item.name,
                  'description': item.description,
                  'city': item.city,
                  'address': item.address,
                  'pictureId': item.pictureId,
                  'rating': item.rating
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RestaurantEntity> _restaurantEntityInsertionAdapter;

  @override
  Future<List<RestaurantEntity>> getRestaurants() async {
    return _queryAdapter.queryList('SELECT * FROM restaurant',
        mapper: (Map<String, Object?> row) => RestaurantEntity(
            row['restaurantId'] as String,
            row['name'] as String,
            row['description'] as String,
            row['city'] as String,
            row['address'] as String,
            row['pictureId'] as String,
            row['rating'] as double));
  }

  @override
  Future<RestaurantEntity?> getRestaurantById(String id) async {
    return _queryAdapter.query(
        'SELECT * FROM restaurant WHERE restaurantId = ?1 LIMIT 1',
        mapper: (Map<String, Object?> row) => RestaurantEntity(
            row['restaurantId'] as String,
            row['name'] as String,
            row['description'] as String,
            row['city'] as String,
            row['address'] as String,
            row['pictureId'] as String,
            row['rating'] as double),
        arguments: [id]);
  }

  @override
  Future<void> deleteRestaurant(String id) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM restaurant WHERE restaurantId = ?1;',
        arguments: [id]);
  }

  @override
  Future<void> insertRestaurant(RestaurantEntity entity) async {
    await _restaurantEntityInsertionAdapter.insert(
        entity, OnConflictStrategy.abort);
  }
}
