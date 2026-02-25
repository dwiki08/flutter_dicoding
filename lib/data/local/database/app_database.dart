import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await sqflite.getDatabasesPath();
    final file = File(p.join(dbFolder, 'your_foods.db'));
    return NativeDatabase(file);
  });
}

class Restaurants extends Table {
  TextColumn get restaurantId => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get city => text()();
  TextColumn get address => text()();
  TextColumn get pictureId => text()();
  RealColumn get rating => real()();

  @override
  Set<Column> get primaryKey => {restaurantId};
}

@DriftDatabase(tables: [Restaurants])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
