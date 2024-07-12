import 'package:dicoding_flutter/data/remote/response/restaurant_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurants_response.g.dart';

@JsonSerializable()
class RestaurantsResponse {
  @JsonKey(name: "error")
  bool? error;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "count")
  int? count;
  @JsonKey(name: "restaurants")
  List<Restaurant>? restaurants;

  RestaurantsResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestaurantsResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantsResponseToJson(this);
}
