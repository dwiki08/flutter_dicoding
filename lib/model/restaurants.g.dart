// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurants.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantsImpl _$$RestaurantsImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantsImpl(
      restaurants: (json['restaurants'] as List<dynamic>)
          .map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RestaurantsImplToJson(_$RestaurantsImpl instance) =>
    <String, dynamic>{
      'restaurants': instance.restaurants,
    };

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      pictureId: json['pictureId'] as String,
      city: json['city'] as String,
      rating: (json['rating'] as num).toDouble(),
      menus: Menus.fromJson(json['menus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RestaurantImplToJson(_$RestaurantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'pictureId': instance.pictureId,
      'city': instance.city,
      'rating': instance.rating,
      'menus': instance.menus,
    };

_$MenusImpl _$$MenusImplFromJson(Map<String, dynamic> json) => _$MenusImpl(
      foods: (json['foods'] as List<dynamic>)
          .map((e) => Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
      drinks: (json['drinks'] as List<dynamic>)
          .map((e) => Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MenusImplToJson(_$MenusImpl instance) =>
    <String, dynamic>{
      'foods': instance.foods,
      'drinks': instance.drinks,
    };

_$MenuImpl _$$MenuImplFromJson(Map<String, dynamic> json) => _$MenuImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$MenuImplToJson(_$MenuImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
