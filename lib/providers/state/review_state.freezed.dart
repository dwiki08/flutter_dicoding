// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReviewState {
  bool get isLoading => throw _privateConstructorUsedError;

  ErrorResult? get error => throw _privateConstructorUsedError;

  bool get addSuccess => throw _privateConstructorUsedError;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewStateCopyWith<ReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewStateCopyWith<$Res> {
  factory $ReviewStateCopyWith(
          ReviewState value, $Res Function(ReviewState) then) =
      _$ReviewStateCopyWithImpl<$Res, ReviewState>;

  @useResult
  $Res call({bool isLoading, ErrorResult? error, bool addSuccess});

  $ErrorResultCopyWith<$Res>? get error;
}

/// @nodoc
class _$ReviewStateCopyWithImpl<$Res, $Val extends ReviewState>
    implements $ReviewStateCopyWith<$Res> {
  _$ReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? addSuccess = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResult?,
      addSuccess: null == addSuccess
          ? _value.addSuccess
          : addSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorResultCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $ErrorResultCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewStateImplCopyWith<$Res>
    implements $ReviewStateCopyWith<$Res> {
  factory _$$ReviewStateImplCopyWith(
          _$ReviewStateImpl value, $Res Function(_$ReviewStateImpl) then) =
      __$$ReviewStateImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({bool isLoading, ErrorResult? error, bool addSuccess});

  @override
  $ErrorResultCopyWith<$Res>? get error;
}

/// @nodoc
class __$$ReviewStateImplCopyWithImpl<$Res>
    extends _$ReviewStateCopyWithImpl<$Res, _$ReviewStateImpl>
    implements _$$ReviewStateImplCopyWith<$Res> {
  __$$ReviewStateImplCopyWithImpl(
      _$ReviewStateImpl _value, $Res Function(_$ReviewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? addSuccess = null,
  }) {
    return _then(_$ReviewStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResult?,
      addSuccess: null == addSuccess
          ? _value.addSuccess
          : addSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ReviewStateImpl implements _ReviewState {
  const _$ReviewStateImpl(
      {this.isLoading = false, this.error, this.addSuccess = false});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final ErrorResult? error;
  @override
  @JsonKey()
  final bool addSuccess;

  @override
  String toString() {
    return 'ReviewState(isLoading: $isLoading, error: $error, addSuccess: $addSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.addSuccess, addSuccess) ||
                other.addSuccess == addSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error, addSuccess);

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewStateImplCopyWith<_$ReviewStateImpl> get copyWith =>
      __$$ReviewStateImplCopyWithImpl<_$ReviewStateImpl>(this, _$identity);
}

abstract class _ReviewState implements ReviewState {
  const factory _ReviewState(
      {final bool isLoading,
      final ErrorResult? error,
      final bool addSuccess}) = _$ReviewStateImpl;

  @override
  bool get isLoading;

  @override
  ErrorResult? get error;

  @override
  bool get addSuccess;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewStateImplCopyWith<_$ReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
