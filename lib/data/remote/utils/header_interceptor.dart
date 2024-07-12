import 'dart:async';

import 'package:chopper/chopper.dart';

class HeaderInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    Request modifiedRequest = chain.request;
    modifiedRequest =
        applyHeader(modifiedRequest, 'content-type', 'application/json');
    return chain.proceed(modifiedRequest);
  }
}
