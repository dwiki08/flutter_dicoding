// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RestaurantState {
  bool get isLoading => throw _privateConstructorUsedError;

  ErrorResult? get error => throw _privateConstructorUsedError;

  List<Restaurant> get listRestaurants => throw _privateConstructorUsedError;

  Restaurant? get restaurant => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantStateCopyWith<RestaurantState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantStateCopyWith<$Res> {
  factory $RestaurantStateCopyWith(
          RestaurantState value, $Res Function(RestaurantState) then) =
      _$RestaurantStateCopyWithImpl<$Res, RestaurantState>;

  @useResult
  $Res call(
      {bool isLoading,
      ErrorResult? error,
      List<Restaurant> listRestaurants,
      Restaurant? restaurant});
}

/// @nodoc
class _$RestaurantStateCopyWithImpl<$Res, $Val extends RestaurantState>
    implements $RestaurantStateCopyWith<$Res> {
  _$RestaurantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? listRestaurants = null,
    Object? restaurant = freezed,
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
      listRestaurants: null == listRestaurants
          ? _value.listRestaurants
          : listRestaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
      restaurant: freezed == restaurant
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as Restaurant?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantStateImplCopyWith<$Res>
    implements $RestaurantStateCopyWith<$Res> {
  factory _$$RestaurantStateImplCopyWith(_$RestaurantStateImpl value,
          $Res Function(_$RestaurantStateImpl) then) =
      __$$RestaurantStateImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {bool isLoading,
      ErrorResult? error,
      List<Restaurant> listRestaurants,
      Restaurant? restaurant});
}

/// @nodoc
class __$$RestaurantStateImplCopyWithImpl<$Res>
    extends _$RestaurantStateCopyWithImpl<$Res, _$RestaurantStateImpl>
    implements _$$RestaurantStateImplCopyWith<$Res> {
  __$$RestaurantStateImplCopyWithImpl(
      _$RestaurantStateImpl _value, $Res Function(_$RestaurantStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestaurantState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? listRestaurants = null,
    Object? restaurant = freezed,
  }) {
    return _then(_$RestaurantStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResult?,
      listRestaurants: null == listRestaurants
          ? _value._listRestaurants
          : listRestaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
      restaurant: freezed == restaurant
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as Restaurant?,
    ));
  }
}

/// @nodoc

class _$RestaurantStateImpl implements _RestaurantState {
  const _$RestaurantStateImpl(
      {this.isLoading = false,
      this.error,
      final List<Restaurant> listRestaurants = const [],
      this.restaurant})
      : _listRestaurants = listRestaurants;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final ErrorResult? error;
  final List<Restaurant> _listRestaurants;

  @override
  @JsonKey()
  List<Restaurant> get listRestaurants {
    if (_listRestaurants is EqualUnmodifiableListView) return _listRestaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listRestaurants);
  }

  @override
  final Restaurant? restaurant;

  @override
  String toString() {
    return 'RestaurantState(isLoading: $isLoading, error: $error, listRestaurants: $listRestaurants, restaurant: $restaurant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._listRestaurants, _listRestaurants) &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error,
      const DeepCollectionEquality().hash(_listRestaurants), restaurant);

  /// Create a copy of RestaurantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantStateImplCopyWith<_$RestaurantStateImpl> get copyWith =>
      __$$RestaurantStateImplCopyWithImpl<_$RestaurantStateImpl>(
          this, _$identity);
}

abstract class _RestaurantState implements RestaurantState {
  const factory _RestaurantState(
      {final bool isLoading,
      final ErrorResult? error,
      final List<Restaurant> listRestaurants,
      final Restaurant? restaurant}) = _$RestaurantStateImpl;

  @override
  bool get isLoading;

  @override
  ErrorResult? get error;

  @override
  List<Restaurant> get listRestaurants;

  @override
  Restaurant? get restaurant;

  /// Create a copy of RestaurantState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantStateImplCopyWith<_$RestaurantStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
