import 'package:dicoding_flutter/data/remote/response/restaurant_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_detail_response.g.dart';

@JsonSerializable()
class RestaurantDetailResponse {
  @JsonKey(name: "error")
  bool? error;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "restaurant")
  RestaurantResponse? restaurant;

  RestaurantDetailResponse({
    this.error,
    this.message,
    this.restaurant,
  });

  factory RestaurantDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantDetailResponseToJson(this);
}
