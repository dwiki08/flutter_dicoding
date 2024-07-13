// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantDetailResponse _$RestaurantDetailResponseFromJson(
        Map<String, dynamic> json) =>
    RestaurantDetailResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      restaurant: json['restaurant'] == null
          ? null
          : RestaurantResponse.fromJson(
              json['restaurant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RestaurantDetailResponseToJson(
        RestaurantDetailResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'restaurant': instance.restaurant,
    };
