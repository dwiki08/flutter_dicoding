import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:dicoding_flutter/data/local/local_data_source.dart';
import 'package:dicoding_flutter/utils/injection.dart';

class HeaderInterceptor implements Interceptor {
  final LocalDataSource localData = getIt.get();

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    Request modifiedRequest = chain.request;
    final token = await localData.getAuthToken();
    if (token != null) {
      modifiedRequest =
          applyHeader(modifiedRequest, 'Authorization', 'Bearer $token');
    }
    modifiedRequest =
        applyHeader(modifiedRequest, 'Content-Type', 'application/json');
    return chain.proceed(modifiedRequest);
  }
}
