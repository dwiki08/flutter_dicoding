import 'package:chopper/chopper.dart';
import 'package:dicoding_flutter/data/remote/request/login_request.dart';
import 'package:dicoding_flutter/data/remote/request/register_request.dart';
import 'package:dicoding_flutter/data/remote/response/detail_story_response.dart';
import 'package:dicoding_flutter/data/remote/response/general_response.dart';
import 'package:dicoding_flutter/data/remote/response/list_story_response.dart';
import 'package:dicoding_flutter/data/remote/response/login_response.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static ApiService create([ChopperClient? client]) => _$ApiService(client);

  @Post(path: '/register')
  Future<Response<GeneralResponse>> postRegister(@Body() RegisterRequest body);

  @Post(path: '/login')
  Future<Response<LoginResponse>> postLogin(@Body() LoginRequest body);

  @Get(path: '/stories')
  Future<Response<ListStoryResponse>> getListStory({
    @Query('page') int? page,
    @Query('size') int? size,
    @Query('location') int? location,
  });

  @Get(path: '/stories/{id}')
  Future<Response<DetailStoryResponse>> getDetailStory(@Path('id') String id);

  @Post(path: "/stories", headers: {'Content-Type': 'multipart/form-data'})
  @Multipart()
  Future<Response<GeneralResponse>> postStory(
    @PartMap() List<PartValue> requestParams,
  );
}
