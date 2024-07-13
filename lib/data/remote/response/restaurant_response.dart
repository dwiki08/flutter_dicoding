import 'package:json_annotation/json_annotation.dart';

part 'restaurant_response.g.dart';

@JsonSerializable()
class RestaurantResponse {
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
  List<CategoryResponse>? categories;
  @JsonKey(name: "menus")
  MenusResponse? menus;
  @JsonKey(name: "rating")
  double? rating;
  @JsonKey(name: "customerReviews")
  List<CustomerReviewResponse>? customerReviews;

  RestaurantResponse({
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

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantResponseToJson(this);
}

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: "name")
  String? name;

  CategoryResponse({
    this.name,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}

@JsonSerializable()
class CustomerReviewResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "review")
  String? review;
  @JsonKey(name: "date")
  String? date;

  CustomerReviewResponse({
    this.name,
    this.review,
    this.date,
  });

  factory CustomerReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerReviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerReviewResponseToJson(this);
}

@JsonSerializable()
class MenusResponse {
  @JsonKey(name: "foods")
  List<CategoryResponse>? foods;
  @JsonKey(name: "drinks")
  List<CategoryResponse>? drinks;

  MenusResponse({
    this.foods,
    this.drinks,
  });

  factory MenusResponse.fromJson(Map<String, dynamic> json) =>
      _$MenusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MenusResponseToJson(this);
}
