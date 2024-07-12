import 'package:json_annotation/json_annotation.dart';

part 'restaurant_response.g.dart';

@JsonSerializable()
class RestaurantResponse {
  @JsonKey(name: "error")
  bool? error;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "restaurant")
  Restaurant? restaurant;

  RestaurantResponse({
    this.error,
    this.message,
    this.restaurant,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantResponseToJson(this);
}

@JsonSerializable()
class Restaurant {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "pictureId")
  String? pictureId;
  @JsonKey(name: "categories")
  List<Category>? categories;
  @JsonKey(name: "menus")
  Menus? menus;
  @JsonKey(name: "rating")
  double? rating;
  @JsonKey(name: "customerReviews")
  List<CustomerReview>? customerReviews;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.categories,
    this.menus,
    this.rating,
    this.customerReviews,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: "name")
  String? name;

  Category({
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class CustomerReview {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "review")
  String? review;
  @JsonKey(name: "date")
  String? date;

  CustomerReview({
    this.name,
    this.review,
    this.date,
  });

  factory CustomerReview.fromJson(Map<String, dynamic> json) =>
      _$CustomerReviewFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerReviewToJson(this);
}

@JsonSerializable()
class Menus {
  @JsonKey(name: "foods")
  List<Category>? foods;
  @JsonKey(name: "drinks")
  List<Category>? drinks;

  Menus({
    this.foods,
    this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => _$MenusFromJson(json);

  Map<String, dynamic> toJson() => _$MenusToJson(this);
}
