import 'dart:io';

import 'package:dicoding_flutter/data/mapper/response_mapper.dart';
import 'package:dicoding_flutter/data/model/error_result.dart';
import 'package:dicoding_flutter/data/model/restaurant.dart';
import 'package:dicoding_flutter/data/remote/request/add_review_request.dart';
import 'package:dicoding_flutter/data/remote/service/api_service.dart';
import 'package:dicoding_flutter/utils/injection.dart';
import 'package:either_dart/either.dart';

class RemoteDataSource {
  late ApiService api;

  RemoteDataSource({ApiService? apiService}) {
    api = apiService ?? getIt.get<ApiService>();
  }

  Future<Either<ErrorResult, List<Restaurant>>> getListRestaurants(
      {String? query}) async {
    try {
      final response = query == null
          ? await api.getRestaurants()
          : await api.searchRestaurants(query);
      if (response.isSuccessful) {
        List<Restaurant> data =
            response.body?.restaurants?.map((e) => e.toModel()).toList() ?? [];
        if (data.isNotEmpty) {
          return Right(data);
        } else {
          throw const HttpException('404');
        }
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, Restaurant>> getRestaurant(String id) async {
    try {
      final response = await api.getRestaurant(id);
      if (response.isSuccessful) {
        final data = response.body?.restaurant?.toModel();
        if (data != null) {
          return Right(data);
        } else {
          throw const HttpException('404');
        }
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, bool>> addReview(
      {required String id,
      required String name,
      required String review}) async {
    try {
      final response = await api
          .addReview(AddReviewRequest(id: id, name: name, review: review));
      if (response.isSuccessful) {
        return const Right(true);
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }
}
