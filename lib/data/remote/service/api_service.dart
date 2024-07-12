import 'package:chopper/chopper.dart';
import 'package:dicoding_flutter/data/remote/response/restaurant_response.dart';
import 'package:dicoding_flutter/data/remote/response/restaurants_response.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static ApiService create([ChopperClient? client]) => _$ApiService(client);

  @Get(path: '/list')
  Future<Response<RestaurantsResponse>> getRestaurants();

  @Get(path: '/detail/{id}')
  Future<Response<RestaurantResponse>> getRestaurant(@Path('id') String id);

  @Get(path: '/search')
  Future<Response<RestaurantsResponse>> searchRestaurants(
      @Query('q') String query);

  @Post(path: '/review')
  Future<Response<RestaurantsResponse>> addReview(
      @Body() Map<String, dynamic> body);
}
