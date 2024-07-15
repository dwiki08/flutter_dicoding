import 'package:chopper/chopper.dart';
import 'package:dicoding_flutter/data/remote/response/detail_story_response.dart';
import 'package:dicoding_flutter/data/remote/response/general_response.dart';
import 'package:dicoding_flutter/data/remote/response/list_story_response.dart';
import 'package:dicoding_flutter/data/remote/response/login_response.dart';
import 'package:dicoding_flutter/data/remote/utils/header_interceptor.dart';
import 'package:dicoding_flutter/data/remote/utils/json_converter.dart';

import 'api_service.dart';

const baseUrl = 'https://story-api.dicoding.dev/v1';

final chopperClient = ChopperClient(
  baseUrl: Uri.parse(baseUrl),
  services: [ApiService.create()],
  converter: JsonToTypeConverter({
    GeneralResponse: (json) => GeneralResponse.fromJson(json),
    LoginResponse: (json) => LoginResponse.fromJson(json),
    ListStoryResponse: (json) => ListStoryResponse.fromJson(json),
    DetailStoryResponse: (json) => DetailStoryResponse.fromJson(json),
  }),
  interceptors: [
    HeaderInterceptor(),
  ],
);
