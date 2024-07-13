import 'package:dicoding_flutter/data/remote/response/restaurant_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_list_response.g.dart';

@JsonSerializable()
class RestaurantListResponse {
  @JsonKey(name: "error")
  bool? error;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "count")
  int? count;
  @JsonKey(name: "restaurants")
  List<RestaurantResponse>? restaurants;

  RestaurantListResponse({
    this.error,
    this.message,
    this.count,
    this.restaurants,
  });

  factory RestaurantListResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantListResponseToJson(this);
}
