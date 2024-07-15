import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:dicoding_flutter/data/mapper/response_mapper.dart';
import 'package:dicoding_flutter/data/model/error_result.dart';
import 'package:dicoding_flutter/data/model/story.dart';
import 'package:dicoding_flutter/data/remote/request/login_request.dart';
import 'package:dicoding_flutter/data/remote/request/register_request.dart';
import 'package:dicoding_flutter/data/remote/service/api_service.dart';
import 'package:dicoding_flutter/utils/injection.dart';
import 'package:either_dart/either.dart';

class RemoteDataSource {
  final ApiService _apiService = getIt.get<ApiService>();

  Future<Either<ErrorResult, bool>> register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await _apiService
          .postRegister(RegisterRequest(name, email, password));
      if (response.isSuccessful) {
        return const Right(true);
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, String>> login(
      {required String email, required String password}) async {
    try {
      final response =
          await _apiService.postLogin(LoginRequest(email, password));
      if (response.isSuccessful) {
        final token = response.body?.loginResult?.token ?? '';
        return Right(token);
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, List<Story>>> getListStory() async {
    try {
      final response = await _apiService.getListStory();
      if (response.isSuccessful) {
        return Right(
            response.body?.listStory!.map((i) => i.toModel()).toList() ?? []);
      } else {
        throw HttpException(response.statusCode.toString());
      }
    } on Exception catch (e) {
      return Left(ErrorResult.createResult(e));
    }
  }

  Future<Either<ErrorResult, Story>> getStory({required String storyId}) async {
    try {
      final response = await _apiService.getDetailStory(storyId);
      if (response.isSuccessful) {
        if (response.body?.story != null) {
          return Right(response.body!.story!.toModel());
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

  Future<Either<ErrorResult, bool>> addStory(
      {required String description, required String filePath}) async {
    try {
      List<PartValue> requestParams = [
        PartValue("description", description),
        PartValueFile("photo", filePath),
      ];
      final response = await _apiService.postStory(requestParams);
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
