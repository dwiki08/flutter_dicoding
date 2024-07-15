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
  Future<Response<GeneralResponse>> postRegister(RegisterRequest body) {
    final Uri $url = Uri.parse('/register');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<GeneralResponse, GeneralResponse>($request);
  }

  @override
  Future<Response<LoginResponse>> postLogin(LoginRequest body) {
    final Uri $url = Uri.parse('/login');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<ListStoryResponse>> getListStory({
    int? page,
    int? size,
    int? location,
  }) {
    final Uri $url = Uri.parse('/stories');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'size': size,
      'location': location,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ListStoryResponse, ListStoryResponse>($request);
  }

  @override
  Future<Response<DetailStoryResponse>> getDetailStory(String id) {
    final Uri $url = Uri.parse('/stories/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<DetailStoryResponse, DetailStoryResponse>($request);
  }

  @override
  Future<Response<GeneralResponse>> postStory(
      List<PartValue<dynamic>> requestParams) {
    final Uri $url = Uri.parse('/stories');
    final Map<String, String> $headers = {
      'Content-Type': 'multipart/form-data',
    };
    final List<PartValue> $parts = requestParams;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      headers: $headers,
    );
    return client.send<GeneralResponse, GeneralResponse>($request);
  }
}
