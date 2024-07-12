import 'dart:io';

import 'package:dicoding_flutter/data/mapper/response_mapper.dart';
import 'package:dicoding_flutter/data/model/error_result.dart';
import 'package:dicoding_flutter/data/model/restaurant.dart';
import 'package:dicoding_flutter/data/remote/request/add_review_request.dart';
import 'package:dicoding_flutter/data/remote/service/api_service.dart';
import 'package:dicoding_flutter/data/remote/service/chopper_client.dart';
import 'package:either_dart/either.dart';

class RemoteDataSource {
  late ApiService apiService;

  RemoteDataSource() {
    apiService = chopperClient.getService<ApiService>();
  }

  Future<Either<ErrorResult, List<Restaurant>>> getListRestaurants(
      {String? query}) async {
    try {
      final response = query == null
          ? await apiService.getRestaurants()
          : await apiService.searchRestaurants(query);
      if (response.isSuccessful) {
        List<Restaurant> list =
            response.body?.restaurants?.map((e) => e.toModel()).toList() ?? [];
        if (list.isNotEmpty) {
          return Right(list);
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
      final response = await apiService.getRestaurant(id);
      if (response.isSuccessful) {
        return Right(response.body!.restaurant!.toModel());
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
      final response = await apiService.addReview(
          AddReviewRequest(id: id, name: name, review: review).toJson());
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
