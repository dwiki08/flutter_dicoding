// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantListResponse _$RestaurantListResponseFromJson(
        Map<String, dynamic> json) =>
    RestaurantListResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      count: (json['count'] as num?)?.toInt(),
      restaurants: (json['restaurants'] as List<dynamic>?)
          ?.map((e) => RestaurantResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantListResponseToJson(
        RestaurantListResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'count': instance.count,
      'restaurants': instance.restaurants,
    };
