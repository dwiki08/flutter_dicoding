// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantResponse _$RestaurantResponseFromJson(Map<String, dynamic> json) =>
    RestaurantResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      pictureId: json['pictureId'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      menus: json['menus'] == null
          ? null
          : MenusResponse.fromJson(json['menus'] as Map<String, dynamic>),
      rating: (json['rating'] as num?)?.toDouble(),
      customerReviews: (json['customerReviews'] as List<dynamic>?)
          ?.map(
              (e) => CustomerReviewResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantResponseToJson(RestaurantResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'city': instance.city,
      'address': instance.address,
      'pictureId': instance.pictureId,
      'categories': instance.categories,
      'menus': instance.menus,
      'rating': instance.rating,
      'customerReviews': instance.customerReviews,
    };

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

CustomerReviewResponse _$CustomerReviewResponseFromJson(
        Map<String, dynamic> json) =>
    CustomerReviewResponse(
      name: json['name'] as String?,
      review: json['review'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$CustomerReviewResponseToJson(
        CustomerReviewResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'review': instance.review,
      'date': instance.date,
    };

MenusResponse _$MenusResponseFromJson(Map<String, dynamic> json) =>
    MenusResponse(
      foods: (json['foods'] as List<dynamic>?)
          ?.map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      drinks: (json['drinks'] as List<dynamic>?)
          ?.map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenusResponseToJson(MenusResponse instance) =>
    <String, dynamic>{
      'foods': instance.foods,
      'drinks': instance.drinks,
    };
