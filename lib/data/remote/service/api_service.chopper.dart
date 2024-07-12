// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ApiService;

  @override
  Future<Response<RestaurantsResponse>> getRestaurants() {
    final Uri $url = Uri.parse('/list');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<RestaurantsResponse, RestaurantsResponse>($request);
  }

  @override
  Future<Response<RestaurantResponse>> getRestaurant(String id) {
    final Uri $url = Uri.parse('/detail/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<RestaurantResponse, RestaurantResponse>($request);
  }

  @override
  Future<Response<RestaurantsResponse>> searchRestaurants(String query) {
    final Uri $url = Uri.parse('/search');
    final Map<String, dynamic> $params = <String, dynamic>{'q': query};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<RestaurantsResponse, RestaurantsResponse>($request);
  }

  @override
  Future<Response<RestaurantsResponse>> addReview(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/review');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<RestaurantsResponse, RestaurantsResponse>($request);
  }
}
