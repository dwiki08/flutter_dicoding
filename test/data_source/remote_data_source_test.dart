import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:dicoding_flutter/data/mapper/response_mapper.dart';
import 'package:dicoding_flutter/data/model/error_result.dart';
import 'package:dicoding_flutter/data/remote/remote_data_source.dart';
import 'package:dicoding_flutter/data/remote/response/general_response.dart';
import 'package:dicoding_flutter/data/remote/response/restaurant_detail_response.dart';
import 'package:dicoding_flutter/data/remote/response/restaurant_list_response.dart';
import 'package:dicoding_flutter/data/remote/service/api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../mock/mock_json.dart';
import 'remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ApiService>()])
void main() {
  late RemoteDataSource remoteDataSource;
  late MockApiService mockApiService;

  Response<GeneralResponse> dummyGeneralResponse(Map<String, dynamic> json) {
    return Response<GeneralResponse>(
        http.Response('{}', 200), GeneralResponse.fromJson(json));
  }

  Response<RestaurantListResponse> dummyRestaurantsResponse(
      Map<String, dynamic> json) {
    return Response<RestaurantListResponse>(
        http.Response('{}', 200), RestaurantListResponse.fromJson(json));
  }

  Response<RestaurantDetailResponse> dummyRestaurantDetailResponse(
      Map<String, dynamic> json) {
    return Response<RestaurantDetailResponse>(
        http.Response('{}', 200), RestaurantDetailResponse.fromJson(json));
  }

  setUp(() {
    mockApiService = MockApiService();
    remoteDataSource = RemoteDataSource(apiService: mockApiService);

    provideDummy(dummyGeneralResponse(<String, dynamic>{}));
    provideDummy(dummyRestaurantsResponse(<String, dynamic>{}));
    provideDummy(dummyRestaurantDetailResponse(<String, dynamic>{}));
  });

  const int dummyHttpCode = 500;
  final Exception dummyException = HttpException(dummyHttpCode.toString());

  group('getListRestaurants()', () {
    final restaurantListResponse =
        RestaurantListResponse.fromJson(restaurantListJson);
    group('POSITIVE Either.isRight', () {
      test('get list restaurants', () async {
        when(mockApiService.getRestaurants()).thenAnswer((_) async {
          return dummyRestaurantsResponse(restaurantListJson);
        });
        final result = await remoteDataSource.getListRestaurants();
        expect(result.isRight, true);
        result.fold((e) {}, (m) {
          expect(
            m,
            restaurantListResponse.restaurants?.map((i) => i.toModel()),
          );
        });
      });

      test('search restaurant or menu', () async {
        String query = 'kopi';
        when(mockApiService.searchRestaurants(any)).thenAnswer((_) async {
          return dummyRestaurantsResponse(restaurantListJson);
        });
        final result = await remoteDataSource.getListRestaurants(query: query);
        expect(result.isRight, true);
        result.fold((e) {}, (m) {
          expect(
            m,
            restaurantListResponse.restaurants?.map((i) => i.toModel()),
          );
        });
      });
    });

    group('NEGATIVE Either.isLeft', () {
      test('catch any Exception', () async {
        when(mockApiService.getRestaurants()).thenThrow(dummyException);
        final result = await remoteDataSource.getListRestaurants();
        expect(result.isLeft, true);
        result.fold((e) {
          expect(e.code, dummyHttpCode);
          expect(e, ErrorResult.createResult(dummyException));
        }, (m) {});
      });

      test('restaurant list is empty', () async {
        String query = 'kopi';
        when(mockApiService.searchRestaurants(query)).thenAnswer((_) async {
          return dummyRestaurantsResponse(restaurantListEmptyJson);
        });
        final result = await remoteDataSource.getListRestaurants(query: query);
        expect(result.isLeft, true);
        result.fold((e) {
          expect(e.code, 404);
          expect(e, ErrorResult.createResult(const HttpException('404')));
        }, (m) {});
      });
    });
  });

  group('getRestaurant()', () {
    final restaurantDetailResponse =
        RestaurantDetailResponse.fromJson(restaurantDetailJson);
    const restaurantId = 'xxx';

    group('POSITIVE Either.isRight', () {
      test('get detail restaurant', () async {
        when(mockApiService.getRestaurant(any)).thenAnswer((_) async {
          return dummyRestaurantDetailResponse(restaurantDetailJson);
        });
        final result = await remoteDataSource.getRestaurant(restaurantId);
        expect(result.isRight, true);
        result.fold((e) {}, (m) {
          expect(
            m,
            restaurantDetailResponse.restaurant?.toModel(),
          );
        });
      });
    });

    group('NEGATIVE Either.isLeft', () {
      test('catch any Exception', () async {
        when(mockApiService.getRestaurant(any)).thenThrow(dummyException);
        final result = await remoteDataSource.getRestaurant(restaurantId);
        expect(result.isLeft, true);
        result.fold((e) {
          expect(e.code, dummyHttpCode);
          expect(e, ErrorResult.createResult(dummyException));
        }, (m) {});
      });

      test('restaurant not found', () async {
        when(mockApiService.getRestaurant(restaurantId)).thenAnswer((_) async {
          return dummyRestaurantDetailResponse(restaurantDetailNotFoundJson);
        });
        final result = await remoteDataSource.getRestaurant(restaurantId);
        expect(result.isLeft, true);
        result.fold((e) {
          expect(e.code, 404);
        }, (m) {});
      });
    });
  });

  group('addReview()', () {
    group('POSITIVE Either.isRight', () {
      test('add review', () async {
        when(mockApiService.addReview(any)).thenAnswer((_) async {
          return dummyGeneralResponse(restaurantDetailJson);
        });
        final result =
            await remoteDataSource.addReview(id: '', name: '', review: '');
        expect(result.isRight, true);
        result.fold((e) {}, (m) {
          expect(m, true);
        });
      });
    });

    group('NEGATIVE Either.isLeft', () {
      test('catch any Exception', () async {
        when(mockApiService.addReview(any)).thenThrow(dummyException);
        final result =
            await remoteDataSource.addReview(id: '', name: '', review: '');
        expect(result.isLeft, true);
        result.fold((e) {
          expect(e.code, dummyHttpCode);
          expect(e, ErrorResult.createResult(dummyException));
        }, (m) {});
      });
    });
  });
}
