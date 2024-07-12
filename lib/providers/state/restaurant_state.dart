import 'package:dicoding_flutter/data/model/error_result.dart';
import 'package:dicoding_flutter/data/model/restaurant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_state.freezed.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const factory RestaurantState({
    @Default(false) bool isLoading,
    ErrorResult? error,
    @Default([]) List<Restaurant> listRestaurants,
    Restaurant? restaurant,
  }) = _RestaurantState;
}
