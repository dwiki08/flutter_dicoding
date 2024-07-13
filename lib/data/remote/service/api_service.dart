import 'package:chopper/chopper.dart';
import 'package:dicoding_flutter/data/remote/request/add_review_request.dart';
import 'package:dicoding_flutter/data/remote/response/general_response.dart';
import 'package:dicoding_flutter/data/remote/response/restaurant_detail_response.dart';
import 'package:dicoding_flutter/data/remote/response/restaurant_list_response.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static ApiService create([ChopperClient? client]) => _$ApiService(client);

  @Get(path: '/list')
  Future<Response<RestaurantListResponse>> getRestaurants();

  @Get(path: '/detail/{id}')
  Future<Response<RestaurantDetailResponse>> getRestaurant(
      @Path('id') String id);

  @Get(path: '/search')
  Future<Response<RestaurantListResponse>> searchRestaurants(
      @Query('q') String query);

  @Post(path: '/review')
  Future<Response<GeneralResponse>> addReview(@Body() AddReviewRequest body);
}
