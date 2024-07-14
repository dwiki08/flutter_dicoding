import 'package:dicoding_flutter/data/local/entity/favorite_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class RestaurantDao {
  @Query('SELECT * FROM restaurant')
  Future<List<RestaurantEntity>> getRestaurants();

  @Query('SELECT * FROM restaurant WHERE restaurantId = :id LIMIT 1')
  Future<RestaurantEntity?> getRestaurantById(String id);

  @insert
  Future<void> insertRestaurant(RestaurantEntity entity);

  @Query('DELETE FROM restaurant WHERE restaurantId = :id;')
  Future<void> deleteRestaurant(String id);
}
