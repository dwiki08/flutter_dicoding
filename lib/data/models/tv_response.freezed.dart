// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TvResponse _$TvResponseFromJson(Map<String, dynamic> json) {
  return _TvResponse.fromJson(json);
}

/// @nodoc
mixin _$TvResponse {
  int? get page => throw _privateConstructorUsedError;
  List<TvModel>? get results => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;

  /// Serializes this TvResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TvResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvResponseCopyWith<TvResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvResponseCopyWith<$Res> {
  factory $TvResponseCopyWith(
          TvResponse value, $Res Function(TvResponse) then) =
      _$TvResponseCopyWithImpl<$Res, TvResponse>;
  @useResult
  $Res call(
      {int? page, List<TvModel>? results, int? totalPages, int? totalResults});
}

/// @nodoc
class _$TvResponseCopyWithImpl<$Res, $Val extends TvResponse>
    implements $TvResponseCopyWith<$Res> {
  _$TvResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TvModel>?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvResponseImplCopyWith<$Res>
    implements $TvResponseCopyWith<$Res> {
  factory _$$TvResponseImplCopyWith(
          _$TvResponseImpl value, $Res Function(_$TvResponseImpl) then) =
      __$$TvResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? page, List<TvModel>? results, int? totalPages, int? totalResults});
}

/// @nodoc
class __$$TvResponseImplCopyWithImpl<$Res>
    extends _$TvResponseCopyWithImpl<$Res, _$TvResponseImpl>
    implements _$$TvResponseImplCopyWith<$Res> {
  __$$TvResponseImplCopyWithImpl(
      _$TvResponseImpl _value, $Res Function(_$TvResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TvResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_$TvResponseImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<TvModel>?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TvResponseImpl implements _TvResponse {
  const _$TvResponseImpl(
      {this.page,
      final List<TvModel>? results,
      this.totalPages,
      this.totalResults})
      : _results = results;

  factory _$TvResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvResponseImplFromJson(json);

  @override
  final int? page;
  final List<TvModel>? _results;
  @override
  List<TvModel>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalPages;
  @override
  final int? totalResults;

  @override
  String toString() {
    return 'TvResponse(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvResponseImpl &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page,
      const DeepCollectionEquality().hash(_results), totalPages, totalResults);

  /// Create a copy of TvResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TvResponseImplCopyWith<_$TvResponseImpl> get copyWith =>
      __$$TvResponseImplCopyWithImpl<_$TvResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvResponseImplToJson(
      this,
    );
  }
}

abstract class _TvResponse implements TvResponse {
  const factory _TvResponse(
      {final int? page,
      final List<TvModel>? results,
      final int? totalPages,
      final int? totalResults}) = _$TvResponseImpl;

  factory _TvResponse.fromJson(Map<String, dynamic> json) =
      _$TvResponseImpl.fromJson;

  @override
  int? get page;
  @override
  List<TvModel>? get results;
  @override
  int? get totalPages;
  @override
  int? get totalResults;

  /// Create a copy of TvResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TvResponseImplCopyWith<_$TvResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
