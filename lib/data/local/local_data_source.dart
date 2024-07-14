import 'package:dicoding_flutter/data/local/dao/restaurant_dao.dart';
import 'package:dicoding_flutter/data/mapper/entity_mapper.dart';
import 'package:dicoding_flutter/data/model/restaurant.dart';
import 'package:dicoding_flutter/utils/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefSetting {
  notification("notification"),
  theme("theme");

  final String key;

  const PrefSetting(this.key);
}

class LocalDataSource {
  late RestaurantDao restaurantDao = getIt<RestaurantDao>();

  Future<bool> setSettingNotification(bool isActive) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(PrefSetting.notification.key, isActive);
  }

  Future<bool> getSettingNotification() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PrefSetting.notification.key) ?? false;
  }

  Future<List<Restaurant>> getFavoriteRestaurants() async {
    final data = await restaurantDao.getRestaurants();
    return data.map((e) => e.toModel()).toList();
  }

  Future<Restaurant?> getFavoriteRestaurant(String id) async {
    final data = await restaurantDao.getRestaurantById(id);
    return data?.toModel();
  }

  Future<void> insertFavoriteRestaurant(Restaurant restaurant) async {
    await restaurantDao.insertRestaurant(restaurant.toEntity());
  }

  Future<void> deleteFavoriteRestaurant(String id) async {
    await restaurantDao.deleteRestaurant(id);
  }
}
