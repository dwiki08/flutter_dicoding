import 'package:dicoding_flutter/data/local/entity/favorite_entity.dart';
import 'package:dicoding_flutter/data/local/database/app_database.dart';

class RestaurantDao {
  final AppDatabase _db;

  RestaurantDao(this._db);

  Future<List<RestaurantEntity>> getRestaurants() async {
    final rows = await _db.select(_db.restaurants).get();
    return rows
        .map((r) => RestaurantEntity(
              r.restaurantId,
              r.name,
              r.description,
              r.city,
              r.address,
              r.pictureId,
              r.rating,
            ))
        .toList();
  }

  Future<RestaurantEntity?> getRestaurantById(String id) async {
    final row = await (_db.select(_db.restaurants)..where((t) => t.restaurantId.equals(id))).getSingleOrNull();
    if (row == null) return null;
    return RestaurantEntity(
      row.restaurantId,
      row.name,
      row.description,
      row.city,
      row.address,
      row.pictureId,
      row.rating,
    );
  }

  Future<void> insertRestaurant(RestaurantEntity entity) async {
    await _db.into(_db.restaurants).insert(
          RestaurantsCompanion.insert(
            restaurantId: entity.restaurantId,
            name: entity.name,
            description: entity.description,
            city: entity.city,
            address: entity.address,
            pictureId: entity.pictureId,
            rating: entity.rating,
          ),
        );
  }

  Future<void> deleteRestaurant(String id) async {
    await (_db.delete(_db.restaurants)..where((t) => t.restaurantId.equals(id))).go();
  }
}
