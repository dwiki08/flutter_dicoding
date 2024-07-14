// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
mixin _$Restaurant {
  String get id => throw _privateConstructorUsedError;

  String get name => throw _privateConstructorUsedError;

  String get description => throw _privateConstructorUsedError;

  String get city => throw _privateConstructorUsedError;

  String get address => throw _privateConstructorUsedError;

  String get pictureId => throw _privateConstructorUsedError;

  double get rating => throw _privateConstructorUsedError;

  List<Category>? get categories => throw _privateConstructorUsedError;

  Menus? get menus => throw _privateConstructorUsedError;

  List<CustomerReview>? get customerReviews =>
      throw _privateConstructorUsedError;

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
      String city,
      String address,
      String pictureId,
      double rating,
      List<Category>? categories,
      Menus? menus,
      List<CustomerReview>? customerReviews});

  $MenusCopyWith<$Res>? get menus;
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
    Object? city = null,
    Object? address = null,
    Object? pictureId = null,
    Object? rating = null,
    Object? categories = freezed,
    Object? menus = freezed,
    Object? customerReviews = freezed,
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
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      pictureId: null == pictureId
          ? _value.pictureId
          : pictureId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      menus: freezed == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as Menus?,
      customerReviews: freezed == customerReviews
          ? _value.customerReviews
          : customerReviews // ignore: cast_nullable_to_non_nullable
              as List<CustomerReview>?,
    ) as $Val);
  }

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenusCopyWith<$Res>? get menus {
    if (_value.menus == null) {
      return null;
    }

    return $MenusCopyWith<$Res>(_value.menus!, (value) {
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
      String city,
      String address,
      String pictureId,
      double rating,
      List<Category>? categories,
      Menus? menus,
      List<CustomerReview>? customerReviews});

  @override
  $MenusCopyWith<$Res>? get menus;
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
    Object? city = null,
    Object? address = null,
    Object? pictureId = null,
    Object? rating = null,
    Object? categories = freezed,
    Object? menus = freezed,
    Object? customerReviews = freezed,
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
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      pictureId: null == pictureId
          ? _value.pictureId
          : pictureId // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      menus: freezed == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as Menus?,
      customerReviews: freezed == customerReviews
          ? _value._customerReviews
          : customerReviews // ignore: cast_nullable_to_non_nullable
              as List<CustomerReview>?,
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
      required this.city,
      required this.address,
      required this.pictureId,
      required this.rating,
      final List<Category>? categories,
      this.menus,
      final List<CustomerReview>? customerReviews})
      : _categories = categories,
        _customerReviews = customerReviews;

  factory _$RestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String city;
  @override
  final String address;
  @override
  final String pictureId;
  @override
  final double rating;
  final List<Category>? _categories;

  @override
  List<Category>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Menus? menus;
  final List<CustomerReview>? _customerReviews;

  @override
  List<CustomerReview>? get customerReviews {
    final value = _customerReviews;
    if (value == null) return null;
    if (_customerReviews is EqualUnmodifiableListView) return _customerReviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Restaurant(id: $id, name: $name, description: $description, city: $city, address: $address, pictureId: $pictureId, rating: $rating, categories: $categories, menus: $menus, customerReviews: $customerReviews)';
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
            (identical(other.city, city) || other.city == city) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pictureId, pictureId) ||
                other.pictureId == pictureId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.menus, menus) || other.menus == menus) &&
            const DeepCollectionEquality()
                .equals(other._customerReviews, _customerReviews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      city,
      address,
      pictureId,
      rating,
      const DeepCollectionEquality().hash(_categories),
      menus,
      const DeepCollectionEquality().hash(_customerReviews));

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
      required final String city,
      required final String address,
      required final String pictureId,
      required final double rating,
      final List<Category>? categories,
      final Menus? menus,
      final List<CustomerReview>? customerReviews}) = _$RestaurantImpl;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$RestaurantImpl.fromJson;

  @override
  String get id;

  @override
  String get name;

  @override
  String get description;

  @override
  String get city;

  @override
  String get address;

  @override
  String get pictureId;

  @override
  double get rating;

  @override
  List<Category>? get categories;

  @override
  Menus? get menus;

  @override
  List<CustomerReview>? get customerReviews;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;

  @useResult
  $Res call({String name});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
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
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$CategoryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  const _$CategoryImpl({required this.name});

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'Category(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category({required final String name}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  String get name;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Menus _$MenusFromJson(Map<String, dynamic> json) {
  return _Menus.fromJson(json);
}

/// @nodoc
mixin _$Menus {
  List<Category> get foods => throw _privateConstructorUsedError;

  List<Category> get drinks => throw _privateConstructorUsedError;

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
  $Res call({List<Category> foods, List<Category> drinks});
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
              as List<Category>,
      drinks: null == drinks
          ? _value.drinks
          : drinks // ignore: cast_nullable_to_non_nullable
              as List<Category>,
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
  $Res call({List<Category> foods, List<Category> drinks});
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
              as List<Category>,
      drinks: null == drinks
          ? _value._drinks
          : drinks // ignore: cast_nullable_to_non_nullable
              as List<Category>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenusImpl implements _Menus {
  const _$MenusImpl(
      {required final List<Category> foods,
      required final List<Category> drinks})
      : _foods = foods,
        _drinks = drinks;

  factory _$MenusImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenusImplFromJson(json);

  final List<Category> _foods;

  @override
  List<Category> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  final List<Category> _drinks;

  @override
  List<Category> get drinks {
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
      {required final List<Category> foods,
      required final List<Category> drinks}) = _$MenusImpl;

  factory _Menus.fromJson(Map<String, dynamic> json) = _$MenusImpl.fromJson;

  @override
  List<Category> get foods;

  @override
  List<Category> get drinks;

  /// Create a copy of Menus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenusImplCopyWith<_$MenusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerReview _$CustomerReviewFromJson(Map<String, dynamic> json) {
  return _CustomerReview.fromJson(json);
}

/// @nodoc
mixin _$CustomerReview {
  String get name => throw _privateConstructorUsedError;

  String get review => throw _privateConstructorUsedError;

  String get date => throw _privateConstructorUsedError;

  /// Serializes this CustomerReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerReviewCopyWith<CustomerReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerReviewCopyWith<$Res> {
  factory $CustomerReviewCopyWith(
          CustomerReview value, $Res Function(CustomerReview) then) =
      _$CustomerReviewCopyWithImpl<$Res, CustomerReview>;

  @useResult
  $Res call({String name, String review, String date});
}

/// @nodoc
class _$CustomerReviewCopyWithImpl<$Res, $Val extends CustomerReview>
    implements $CustomerReviewCopyWith<$Res> {
  _$CustomerReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? review = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerReviewImplCopyWith<$Res>
    implements $CustomerReviewCopyWith<$Res> {
  factory _$$CustomerReviewImplCopyWith(_$CustomerReviewImpl value,
          $Res Function(_$CustomerReviewImpl) then) =
      __$$CustomerReviewImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({String name, String review, String date});
}

/// @nodoc
class __$$CustomerReviewImplCopyWithImpl<$Res>
    extends _$CustomerReviewCopyWithImpl<$Res, _$CustomerReviewImpl>
    implements _$$CustomerReviewImplCopyWith<$Res> {
  __$$CustomerReviewImplCopyWithImpl(
      _$CustomerReviewImpl _value, $Res Function(_$CustomerReviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? review = null,
    Object? date = null,
  }) {
    return _then(_$CustomerReviewImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerReviewImpl implements _CustomerReview {
  const _$CustomerReviewImpl(
      {required this.name, required this.review, required this.date});

  factory _$CustomerReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerReviewImplFromJson(json);

  @override
  final String name;
  @override
  final String review;
  @override
  final String date;

  @override
  String toString() {
    return 'CustomerReview(name: $name, review: $review, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerReviewImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, review, date);

  /// Create a copy of CustomerReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerReviewImplCopyWith<_$CustomerReviewImpl> get copyWith =>
      __$$CustomerReviewImplCopyWithImpl<_$CustomerReviewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerReviewImplToJson(
      this,
    );
  }
}

abstract class _CustomerReview implements CustomerReview {
  const factory _CustomerReview(
      {required final String name,
      required final String review,
      required final String date}) = _$CustomerReviewImpl;

  factory _CustomerReview.fromJson(Map<String, dynamic> json) =
      _$CustomerReviewImpl.fromJson;

  @override
  String get name;

  @override
  String get review;

  @override
  String get date;

  /// Create a copy of CustomerReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerReviewImplCopyWith<_$CustomerReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
