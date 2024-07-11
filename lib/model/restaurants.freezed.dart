// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurants.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Restaurants _$RestaurantsFromJson(Map<String, dynamic> json) {
  return _Restaurants.fromJson(json);
}

/// @nodoc
mixin _$Restaurants {
  List<Restaurant> get restaurants => throw _privateConstructorUsedError;

  /// Serializes this Restaurants to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Restaurants
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantsCopyWith<Restaurants> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantsCopyWith<$Res> {
  factory $RestaurantsCopyWith(
          Restaurants value, $Res Function(Restaurants) then) =
      _$RestaurantsCopyWithImpl<$Res, Restaurants>;

  @useResult
  $Res call({List<Restaurant> restaurants});
}

/// @nodoc
class _$RestaurantsCopyWithImpl<$Res, $Val extends Restaurants>
    implements $RestaurantsCopyWith<$Res> {
  _$RestaurantsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Restaurants
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurants = null,
  }) {
    return _then(_value.copyWith(
      restaurants: null == restaurants
          ? _value.restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantsImplCopyWith<$Res>
    implements $RestaurantsCopyWith<$Res> {
  factory _$$RestaurantsImplCopyWith(
          _$RestaurantsImpl value, $Res Function(_$RestaurantsImpl) then) =
      __$$RestaurantsImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({List<Restaurant> restaurants});
}

/// @nodoc
class __$$RestaurantsImplCopyWithImpl<$Res>
    extends _$RestaurantsCopyWithImpl<$Res, _$RestaurantsImpl>
    implements _$$RestaurantsImplCopyWith<$Res> {
  __$$RestaurantsImplCopyWithImpl(
      _$RestaurantsImpl _value, $Res Function(_$RestaurantsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Restaurants
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurants = null,
  }) {
    return _then(_$RestaurantsImpl(
      restaurants: null == restaurants
          ? _value._restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantsImpl implements _Restaurants {
  const _$RestaurantsImpl({required final List<Restaurant> restaurants})
      : _restaurants = restaurants;

  factory _$RestaurantsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantsImplFromJson(json);

  final List<Restaurant> _restaurants;

  @override
  List<Restaurant> get restaurants {
    if (_restaurants is EqualUnmodifiableListView) return _restaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restaurants);
  }

  @override
  String toString() {
    return 'Restaurants(restaurants: $restaurants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantsImpl &&
            const DeepCollectionEquality()
                .equals(other._restaurants, _restaurants));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_restaurants));

  /// Create a copy of Restaurants
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantsImplCopyWith<_$RestaurantsImpl> get copyWith =>
      __$$RestaurantsImplCopyWithImpl<_$RestaurantsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantsImplToJson(
      this,
    );
  }
}

abstract class _Restaurants implements Restaurants {
  const factory _Restaurants({required final List<Restaurant> restaurants}) =
      _$RestaurantsImpl;

  factory _Restaurants.fromJson(Map<String, dynamic> json) =
      _$RestaurantsImpl.fromJson;

  @override
  List<Restaurant> get restaurants;

  /// Create a copy of Restaurants
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantsImplCopyWith<_$RestaurantsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
mixin _$Restaurant {
  String get id => throw _privateConstructorUsedError;

  String get name => throw _privateConstructorUsedError;

  String get description => throw _privateConstructorUsedError;

  String get pictureId => throw _privateConstructorUsedError;

  String get city => throw _privateConstructorUsedError;

  double get rating => throw _privateConstructorUsedError;

  Menus get menus => throw _privateConstructorUsedError;

  /// Serializes this Restaurant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantCopyWith<Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res, Restaurant>;

  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String pictureId,
      String city,
      double rating,
      Menus menus});

  $MenusCopyWith<$Res> get menus;
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res, $Val extends Restaurant>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? pictureId = null,
    Object? city = null,
    Object? rating = null,
    Object? menus = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pictureId: null == pictureId
          ? _value.pictureId
          : pictureId // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      menus: null == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as Menus,
    ) as $Val);
  }

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenusCopyWith<$Res> get menus {
    return $MenusCopyWith<$Res>(_value.menus, (value) {
      return _then(_value.copyWith(menus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestaurantImplCopyWith<$Res>
    implements $RestaurantCopyWith<$Res> {
  factory _$$RestaurantImplCopyWith(
          _$RestaurantImpl value, $Res Function(_$RestaurantImpl) then) =
      __$$RestaurantImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String pictureId,
      String city,
      double rating,
      Menus menus});

  @override
  $MenusCopyWith<$Res> get menus;
}

/// @nodoc
class __$$RestaurantImplCopyWithImpl<$Res>
    extends _$RestaurantCopyWithImpl<$Res, _$RestaurantImpl>
    implements _$$RestaurantImplCopyWith<$Res> {
  __$$RestaurantImplCopyWithImpl(
      _$RestaurantImpl _value, $Res Function(_$RestaurantImpl) _then)
      : super(_value, _then);

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? pictureId = null,
    Object? city = null,
    Object? rating = null,
    Object? menus = null,
  }) {
    return _then(_$RestaurantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      pictureId: null == pictureId
          ? _value.pictureId
          : pictureId // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      menus: null == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as Menus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantImpl implements _Restaurant {
  const _$RestaurantImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating,
      required this.menus});

  factory _$RestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String pictureId;
  @override
  final String city;
  @override
  final double rating;
  @override
  final Menus menus;

  @override
  String toString() {
    return 'Restaurant(id: $id, name: $name, description: $description, pictureId: $pictureId, city: $city, rating: $rating, menus: $menus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pictureId, pictureId) ||
                other.pictureId == pictureId) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.menus, menus) || other.menus == menus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, pictureId, city, rating, menus);

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      __$$RestaurantImplCopyWithImpl<_$RestaurantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantImplToJson(
      this,
    );
  }
}

abstract class _Restaurant implements Restaurant {
  const factory _Restaurant(
      {required final String id,
      required final String name,
      required final String description,
      required final String pictureId,
      required final String city,
      required final double rating,
      required final Menus menus}) = _$RestaurantImpl;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$RestaurantImpl.fromJson;

  @override
  String get id;

  @override
  String get name;

  @override
  String get description;

  @override
  String get pictureId;

  @override
  String get city;

  @override
  double get rating;

  @override
  Menus get menus;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Menus _$MenusFromJson(Map<String, dynamic> json) {
  return _Menus.fromJson(json);
}

/// @nodoc
mixin _$Menus {
  List<Menu> get foods => throw _privateConstructorUsedError;

  List<Menu> get drinks => throw _privateConstructorUsedError;

  /// Serializes this Menus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Menus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenusCopyWith<Menus> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenusCopyWith<$Res> {
  factory $MenusCopyWith(Menus value, $Res Function(Menus) then) =
      _$MenusCopyWithImpl<$Res, Menus>;

  @useResult
  $Res call({List<Menu> foods, List<Menu> drinks});
}

/// @nodoc
class _$MenusCopyWithImpl<$Res, $Val extends Menus>
    implements $MenusCopyWith<$Res> {
  _$MenusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Menus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
    Object? drinks = null,
  }) {
    return _then(_value.copyWith(
      foods: null == foods
          ? _value.foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
      drinks: null == drinks
          ? _value.drinks
          : drinks // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenusImplCopyWith<$Res> implements $MenusCopyWith<$Res> {
  factory _$$MenusImplCopyWith(
          _$MenusImpl value, $Res Function(_$MenusImpl) then) =
      __$$MenusImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({List<Menu> foods, List<Menu> drinks});
}

/// @nodoc
class __$$MenusImplCopyWithImpl<$Res>
    extends _$MenusCopyWithImpl<$Res, _$MenusImpl>
    implements _$$MenusImplCopyWith<$Res> {
  __$$MenusImplCopyWithImpl(
      _$MenusImpl _value, $Res Function(_$MenusImpl) _then)
      : super(_value, _then);

  /// Create a copy of Menus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
    Object? drinks = null,
  }) {
    return _then(_$MenusImpl(
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
      drinks: null == drinks
          ? _value._drinks
          : drinks // ignore: cast_nullable_to_non_nullable
              as List<Menu>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenusImpl implements _Menus {
  const _$MenusImpl(
      {required final List<Menu> foods, required final List<Menu> drinks})
      : _foods = foods,
        _drinks = drinks;

  factory _$MenusImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenusImplFromJson(json);

  final List<Menu> _foods;

  @override
  List<Menu> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  final List<Menu> _drinks;

  @override
  List<Menu> get drinks {
    if (_drinks is EqualUnmodifiableListView) return _drinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drinks);
  }

  @override
  String toString() {
    return 'Menus(foods: $foods, drinks: $drinks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenusImpl &&
            const DeepCollectionEquality().equals(other._foods, _foods) &&
            const DeepCollectionEquality().equals(other._drinks, _drinks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_foods),
      const DeepCollectionEquality().hash(_drinks));

  /// Create a copy of Menus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenusImplCopyWith<_$MenusImpl> get copyWith =>
      __$$MenusImplCopyWithImpl<_$MenusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenusImplToJson(
      this,
    );
  }
}

abstract class _Menus implements Menus {
  const factory _Menus(
      {required final List<Menu> foods,
      required final List<Menu> drinks}) = _$MenusImpl;

  factory _Menus.fromJson(Map<String, dynamic> json) = _$MenusImpl.fromJson;

  @override
  List<Menu> get foods;

  @override
  List<Menu> get drinks;

  /// Create a copy of Menus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenusImplCopyWith<_$MenusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return _Menu.fromJson(json);
}

/// @nodoc
mixin _$Menu {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this Menu to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuCopyWith<Menu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res, Menu>;

  @useResult
  $Res call({String name});
}

/// @nodoc
class _$MenuCopyWithImpl<$Res, $Val extends Menu>
    implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuImplCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$$MenuImplCopyWith(
          _$MenuImpl value, $Res Function(_$MenuImpl) then) =
      __$$MenuImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$MenuImplCopyWithImpl<$Res>
    extends _$MenuCopyWithImpl<$Res, _$MenuImpl>
    implements _$$MenuImplCopyWith<$Res> {
  __$$MenuImplCopyWithImpl(_$MenuImpl _value, $Res Function(_$MenuImpl) _then)
      : super(_value, _then);

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$MenuImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuImpl implements _Menu {
  const _$MenuImpl({required this.name});

  factory _$MenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'Menu(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      __$$MenuImplCopyWithImpl<_$MenuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuImplToJson(
      this,
    );
  }
}

abstract class _Menu implements Menu {
  const factory _Menu({required final String name}) = _$MenuImpl;

  factory _Menu.fromJson(Map<String, dynamic> json) = _$MenuImpl.fromJson;

  @override
  String get name;

  /// Create a copy of Menu
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuImplCopyWith<_$MenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
