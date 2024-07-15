// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ErrorResult {
  String? get message => throw _privateConstructorUsedError;

  int? get code => throw _privateConstructorUsedError;

  Exception? get exception => throw _privateConstructorUsedError;

  /// Create a copy of ErrorResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorResultCopyWith<ErrorResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorResultCopyWith<$Res> {
  factory $ErrorResultCopyWith(
          ErrorResult value, $Res Function(ErrorResult) then) =
      _$ErrorResultCopyWithImpl<$Res, ErrorResult>;

  @useResult
  $Res call({String? message, int? code, Exception? exception});
}

/// @nodoc
class _$ErrorResultCopyWithImpl<$Res, $Val extends ErrorResult>
    implements $ErrorResultCopyWith<$Res> {
  _$ErrorResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ErrorResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorResultImplCopyWith<$Res>
    implements $ErrorResultCopyWith<$Res> {
  factory _$$ErrorResultImplCopyWith(
          _$ErrorResultImpl value, $Res Function(_$ErrorResultImpl) then) =
      __$$ErrorResultImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({String? message, int? code, Exception? exception});
}

/// @nodoc
class __$$ErrorResultImplCopyWithImpl<$Res>
    extends _$ErrorResultCopyWithImpl<$Res, _$ErrorResultImpl>
    implements _$$ErrorResultImplCopyWith<$Res> {
  __$$ErrorResultImplCopyWithImpl(
      _$ErrorResultImpl _value, $Res Function(_$ErrorResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of ErrorResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$ErrorResultImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$ErrorResultImpl implements _ErrorResult {
  const _$ErrorResultImpl({this.message, this.code, this.exception});

  @override
  final String? message;
  @override
  final int? code;
  @override
  final Exception? exception;

  @override
  String toString() {
    return 'ErrorResult(message: $message, code: $code, exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorResultImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code, exception);

  /// Create a copy of ErrorResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorResultImplCopyWith<_$ErrorResultImpl> get copyWith =>
      __$$ErrorResultImplCopyWithImpl<_$ErrorResultImpl>(this, _$identity);
}

abstract class _ErrorResult implements ErrorResult {
  const factory _ErrorResult(
      {final String? message,
      final int? code,
      final Exception? exception}) = _$ErrorResultImpl;

  @override
  String? get message;

  @override
  int? get code;

  @override
  Exception? get exception;

  /// Create a copy of ErrorResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorResultImplCopyWith<_$ErrorResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
