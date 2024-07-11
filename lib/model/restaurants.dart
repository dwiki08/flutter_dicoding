import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurants.freezed.dart';
part 'restaurants.g.dart';

@freezed
class Restaurants with _$Restaurants {
  const factory Restaurants({
    required List<Restaurant> restaurants,
  }) = _Restaurants;

  factory Restaurants.fromJson(Map<String, Object?> json) =>
      _$RestaurantsFromJson(json);
}

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String id,
    required String name,
    required String description,
    required String pictureId,
    required String city,
    required double rating,
    required Menus menus,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, Object?> json) =>
      _$RestaurantFromJson(json);
}

@freezed
class Menus with _$Menus {
  const factory Menus({
    required List<Menu> foods,
    required List<Menu> drinks,
  }) = _Menus;

  factory Menus.fromJson(Map<String, Object?> json) => _$MenusFromJson(json);
}

@freezed
class Menu with _$Menu {
  const factory Menu({
    required String name,
  }) = _Menu;

  factory Menu.fromJson(Map<String, Object?> json) => _$MenuFromJson(json);
}
