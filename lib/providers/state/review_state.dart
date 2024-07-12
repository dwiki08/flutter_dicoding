import 'package:dicoding_flutter/data/model/error_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_state.freezed.dart';

@freezed
class ReviewState with _$ReviewState {
  const factory ReviewState({
    @Default(false) bool isLoading,
    ErrorResult? error,
    @Default(false) bool addSuccess,
  }) = _ReviewState;
}
