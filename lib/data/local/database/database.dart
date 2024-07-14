import 'dart:async';

import 'package:dicoding_flutter/data/local/dao/restaurant_dao.dart';
import 'package:dicoding_flutter/data/local/entity/favorite_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [RestaurantEntity])
abstract class AppDatabase extends FloorDatabase {
  RestaurantDao get restaurantDao;
}
