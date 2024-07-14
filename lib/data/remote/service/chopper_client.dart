import 'package:chopper/chopper.dart';
import 'package:dicoding_flutter/data/remote/response/general_response.dart';
import 'package:dicoding_flutter/data/remote/response/restaurant_detail_response.dart';
import 'package:dicoding_flutter/data/remote/response/restaurant_list_response.dart';
import 'package:dicoding_flutter/data/remote/utils/header_interceptor.dart';
import 'package:dicoding_flutter/data/remote/utils/json_converter.dart';

import 'api_service.dart';

const baseUrl = 'https://restaurant-api.dicoding.dev';

final chopperClient = ChopperClient(
  baseUrl: Uri.parse(baseUrl),
  services: [ApiService.create()],
  converter: JsonToTypeConverter({
    GeneralResponse: (json) => GeneralResponse.fromJson(json),
    RestaurantListResponse: (json) => RestaurantListResponse.fromJson(json),
    RestaurantDetailResponse: (json) => RestaurantDetailResponse.fromJson(json),
  }),
  interceptors: [
    HeaderInterceptor(),
  ],
);
