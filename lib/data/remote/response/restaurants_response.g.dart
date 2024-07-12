// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurants_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantsResponse _$RestaurantsResponseFromJson(Map<String, dynamic> json) =>
    RestaurantsResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      count: (json['count'] as num?)?.toInt(),
      restaurants: (json['restaurants'] as List<dynamic>?)
          ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantsResponseToJson(
        RestaurantsResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'count': instance.count,
      'restaurants': instance.restaurants,
    };
