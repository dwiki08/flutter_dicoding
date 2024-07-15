import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_result.freezed.dart';

@freezed
class ErrorResult with _$ErrorResult {
  const factory ErrorResult({
    String? message,
    int? code,
    Exception? exception,
  }) = _ErrorResult;

  static ErrorResult createResult(Exception exception) {
    String errorMsg = 'Error';
    int code = 0;
    try {
      if (exception is HttpException) {
        code = int.parse(exception.message);
        errorMsg = ErrorMsg.unknownResponse.message;
      } else if (exception is IOException) {
        code = 1;
        errorMsg = ErrorMsg.networkError.message;
      } else {
        code = 0;
        errorMsg = ErrorMsg.unknownError.message;
      }
      return ErrorResult(message: errorMsg, exception: exception, code: code);
    } on Exception catch (e) {
      return ErrorResult(message: errorMsg, exception: e, code: code);
    }
  }
}

enum ErrorMsg {
  networkError("Network error"),
  unknownResponse("HTTP error"),
  unknownError("Unknown error");

  final String message;

  const ErrorMsg(this.message);
}
