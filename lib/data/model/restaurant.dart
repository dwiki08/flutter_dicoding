import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String id,
    required String name,
    required String description,
    required String city,
    required String address,
    required String pictureId,
    required double rating,
    List<Category>? categories,
    Menus? menus,
    List<CustomerReview>? customerReviews,
  }) = _Restaurant;
}

@freezed
class Category with _$Category {
  const factory Category({
    required String name,
  }) = _Category;
}

@freezed
class Menus with _$Menus {
  const factory Menus({
    required List<Category> foods,
    required List<Category> drinks,
  }) = _Menus;
}

@freezed
class CustomerReview with _$CustomerReview {
  const factory CustomerReview({
    required String name,
    required String review,
    required String date,
  }) = _CustomerReview;
}
