// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TvDetailResponse _$TvDetailResponseFromJson(Map<String, dynamic> json) {
  return _TvDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$TvDetailResponse {
  bool? get adult => throw _privateConstructorUsedError;
  String? get backdropPath => throw _privateConstructorUsedError;
  String? get firstAirDate => throw _privateConstructorUsedError;
  List<GenreModel>? get genres => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get lastAirDate => throw _privateConstructorUsedError;
  TEpisodeToAirResponse? get lastEpisodeToAir =>
      throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  TEpisodeToAirResponse? get nextEpisodeToAir =>
      throw _privateConstructorUsedError;
  int? get numberOfEpisodes => throw _privateConstructorUsedError;
  int? get numberOfSeasons => throw _privateConstructorUsedError;
  String? get originalName => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  double? get popularity => throw _privateConstructorUsedError;
  String? get posterPath => throw _privateConstructorUsedError;
  List<SeasonResponse>? get seasons => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  double? get voteAverage => throw _privateConstructorUsedError;
  int? get voteCount => throw _privateConstructorUsedError;

  /// Serializes this TvDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TvDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvDetailResponseCopyWith<TvDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvDetailResponseCopyWith<$Res> {
  factory $TvDetailResponseCopyWith(
          TvDetailResponse value, $Res Function(TvDetailResponse) then) =
      _$TvDetailResponseCopyWithImpl<$Res, TvDetailResponse>;
  @useResult
  $Res call(
      {bool? adult,
      String? backdropPath,
      String? firstAirDate,
      List<GenreModel>? genres,
      int? id,
      String? lastAirDate,
      TEpisodeToAirResponse? lastEpisodeToAir,
      String? name,
      TEpisodeToAirResponse? nextEpisodeToAir,
      int? numberOfEpisodes,
      int? numberOfSeasons,
      String? originalName,
      String? overview,
      double? popularity,
      String? posterPath,
      List<SeasonResponse>? seasons,
      String? status,
      double? voteAverage,
      int? voteCount});

  $TEpisodeToAirResponseCopyWith<$Res>? get lastEpisodeToAir;
  $TEpisodeToAirResponseCopyWith<$Res>? get nextEpisodeToAir;
}

/// @nodoc
class _$TvDetailResponseCopyWithImpl<$Res, $Val extends TvDetailResponse>
    implements $TvDetailResponseCopyWith<$Res> {
  _$TvDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = freezed,
    Object? backdropPath = freezed,
    Object? firstAirDate = freezed,
    Object? genres = freezed,
    Object? id = freezed,
    Object? lastAirDate = freezed,
    Object? lastEpisodeToAir = freezed,
    Object? name = freezed,
    Object? nextEpisodeToAir = freezed,
    Object? numberOfEpisodes = freezed,
    Object? numberOfSeasons = freezed,
    Object? originalName = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? seasons = freezed,
    Object? status = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
  }) {
    return _then(_value.copyWith(
      adult: freezed == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<GenreModel>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      lastAirDate: freezed == lastAirDate
          ? _value.lastAirDate
          : lastAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastEpisodeToAir: freezed == lastEpisodeToAir
          ? _value.lastEpisodeToAir
          : lastEpisodeToAir // ignore: cast_nullable_to_non_nullable
              as TEpisodeToAirResponse?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nextEpisodeToAir: freezed == nextEpisodeToAir
          ? _value.nextEpisodeToAir
          : nextEpisodeToAir // ignore: cast_nullable_to_non_nullable
              as TEpisodeToAirResponse?,
      numberOfEpisodes: freezed == numberOfEpisodes
          ? _value.numberOfEpisodes
          : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfSeasons: freezed == numberOfSeasons
          ? _value.numberOfSeasons
          : numberOfSeasons // ignore: cast_nullable_to_non_nullable
              as int?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      seasons: freezed == seasons
          ? _value.seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<SeasonResponse>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of TvDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TEpisodeToAirResponseCopyWith<$Res>? get lastEpisodeToAir {
    if (_value.lastEpisodeToAir == null) {
      return null;
    }

    return $TEpisodeToAirResponseCopyWith<$Res>(_value.lastEpisodeToAir!,
        (value) {
      return _then(_value.copyWith(lastEpisodeToAir: value) as $Val);
    });
  }

  /// Create a copy of TvDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TEpisodeToAirResponseCopyWith<$Res>? get nextEpisodeToAir {
    if (_value.nextEpisodeToAir == null) {
      return null;
    }

    return $TEpisodeToAirResponseCopyWith<$Res>(_value.nextEpisodeToAir!,
        (value) {
      return _then(_value.copyWith(nextEpisodeToAir: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TvDetailResponseImplCopyWith<$Res>
    implements $TvDetailResponseCopyWith<$Res> {
  factory _$$TvDetailResponseImplCopyWith(_$TvDetailResponseImpl value,
          $Res Function(_$TvDetailResponseImpl) then) =
      __$$TvDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? adult,
      String? backdropPath,
      String? firstAirDate,
      List<GenreModel>? genres,
      int? id,
      String? lastAirDate,
      TEpisodeToAirResponse? lastEpisodeToAir,
      String? name,
      TEpisodeToAirResponse? nextEpisodeToAir,
      int? numberOfEpisodes,
      int? numberOfSeasons,
      String? originalName,
      String? overview,
      double? popularity,
      String? posterPath,
      List<SeasonResponse>? seasons,
      String? status,
      double? voteAverage,
      int? voteCount});

  @override
  $TEpisodeToAirResponseCopyWith<$Res>? get lastEpisodeToAir;
  @override
  $TEpisodeToAirResponseCopyWith<$Res>? get nextEpisodeToAir;
}

/// @nodoc
class __$$TvDetailResponseImplCopyWithImpl<$Res>
    extends _$TvDetailResponseCopyWithImpl<$Res, _$TvDetailResponseImpl>
    implements _$$TvDetailResponseImplCopyWith<$Res> {
  __$$TvDetailResponseImplCopyWithImpl(_$TvDetailResponseImpl _value,
      $Res Function(_$TvDetailResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TvDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = freezed,
    Object? backdropPath = freezed,
    Object? firstAirDate = freezed,
    Object? genres = freezed,
    Object? id = freezed,
    Object? lastAirDate = freezed,
    Object? lastEpisodeToAir = freezed,
    Object? name = freezed,
    Object? nextEpisodeToAir = freezed,
    Object? numberOfEpisodes = freezed,
    Object? numberOfSeasons = freezed,
    Object? originalName = freezed,
    Object? overview = freezed,
    Object? popularity = freezed,
    Object? posterPath = freezed,
    Object? seasons = freezed,
    Object? status = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
  }) {
    return _then(_$TvDetailResponseImpl(
      adult: freezed == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<GenreModel>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      lastAirDate: freezed == lastAirDate
          ? _value.lastAirDate
          : lastAirDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastEpisodeToAir: freezed == lastEpisodeToAir
          ? _value.lastEpisodeToAir
          : lastEpisodeToAir // ignore: cast_nullable_to_non_nullable
              as TEpisodeToAirResponse?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nextEpisodeToAir: freezed == nextEpisodeToAir
          ? _value.nextEpisodeToAir
          : nextEpisodeToAir // ignore: cast_nullable_to_non_nullable
              as TEpisodeToAirResponse?,
      numberOfEpisodes: freezed == numberOfEpisodes
          ? _value.numberOfEpisodes
          : numberOfEpisodes // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfSeasons: freezed == numberOfSeasons
          ? _value.numberOfSeasons
          : numberOfSeasons // ignore: cast_nullable_to_non_nullable
              as int?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      seasons: freezed == seasons
          ? _value._seasons
          : seasons // ignore: cast_nullable_to_non_nullable
              as List<SeasonResponse>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TvDetailResponseImpl extends _TvDetailResponse {
  const _$TvDetailResponseImpl(
      {this.adult,
      this.backdropPath,
      this.firstAirDate,
      final List<GenreModel>? genres,
      this.id,
      this.lastAirDate,
      this.lastEpisodeToAir,
      this.name,
      this.nextEpisodeToAir,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      final List<SeasonResponse>? seasons,
      this.status,
      this.voteAverage,
      this.voteCount})
      : _genres = genres,
        _seasons = seasons,
        super._();

  factory _$TvDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TvDetailResponseImplFromJson(json);

  @override
  final bool? adult;
  @override
  final String? backdropPath;
  @override
  final String? firstAirDate;
  final List<GenreModel>? _genres;
  @override
  List<GenreModel>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? id;
  @override
  final String? lastAirDate;
  @override
  final TEpisodeToAirResponse? lastEpisodeToAir;
  @override
  final String? name;
  @override
  final TEpisodeToAirResponse? nextEpisodeToAir;
  @override
  final int? numberOfEpisodes;
  @override
  final int? numberOfSeasons;
  @override
  final String? originalName;
  @override
  final String? overview;
  @override
  final double? popularity;
  @override
  final String? posterPath;
  final List<SeasonResponse>? _seasons;
  @override
  List<SeasonResponse>? get seasons {
    final value = _seasons;
    if (value == null) return null;
    if (_seasons is EqualUnmodifiableListView) return _seasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;
  @override
  final double? voteAverage;
  @override
  final int? voteCount;

  @override
  String toString() {
    return 'TvDetailResponse(adult: $adult, backdropPath: $backdropPath, firstAirDate: $firstAirDate, genres: $genres, id: $id, lastAirDate: $lastAirDate, lastEpisodeToAir: $lastEpisodeToAir, name: $name, nextEpisodeToAir: $nextEpisodeToAir, numberOfEpisodes: $numberOfEpisodes, numberOfSeasons: $numberOfSeasons, originalName: $originalName, overview: $overview, popularity: $popularity, posterPath: $posterPath, seasons: $seasons, status: $status, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvDetailResponseImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.firstAirDate, firstAirDate) ||
                other.firstAirDate == firstAirDate) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastAirDate, lastAirDate) ||
                other.lastAirDate == lastAirDate) &&
            (identical(other.lastEpisodeToAir, lastEpisodeToAir) ||
                other.lastEpisodeToAir == lastEpisodeToAir) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nextEpisodeToAir, nextEpisodeToAir) ||
                other.nextEpisodeToAir == nextEpisodeToAir) &&
            (identical(other.numberOfEpisodes, numberOfEpisodes) ||
                other.numberOfEpisodes == numberOfEpisodes) &&
            (identical(other.numberOfSeasons, numberOfSeasons) ||
                other.numberOfSeasons == numberOfSeasons) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            const DeepCollectionEquality().equals(other._seasons, _seasons) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        adult,
        backdropPath,
        firstAirDate,
        const DeepCollectionEquality().hash(_genres),
        id,
        lastAirDate,
        lastEpisodeToAir,
        name,
        nextEpisodeToAir,
        numberOfEpisodes,
        numberOfSeasons,
        originalName,
        overview,
        popularity,
        posterPath,
        const DeepCollectionEquality().hash(_seasons),
        status,
        voteAverage,
        voteCount
      ]);

  /// Create a copy of TvDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TvDetailResponseImplCopyWith<_$TvDetailResponseImpl> get copyWith =>
      __$$TvDetailResponseImplCopyWithImpl<_$TvDetailResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TvDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _TvDetailResponse extends TvDetailResponse {
  const factory _TvDetailResponse(
      {final bool? adult,
      final String? backdropPath,
      final String? firstAirDate,
      final List<GenreModel>? genres,
      final int? id,
      final String? lastAirDate,
      final TEpisodeToAirResponse? lastEpisodeToAir,
      final String? name,
      final TEpisodeToAirResponse? nextEpisodeToAir,
      final int? numberOfEpisodes,
      final int? numberOfSeasons,
      final String? originalName,
      final String? overview,
      final double? popularity,
      final String? posterPath,
      final List<SeasonResponse>? seasons,
      final String? status,
      final double? voteAverage,
      final int? voteCount}) = _$TvDetailResponseImpl;
  const _TvDetailResponse._() : super._();

  factory _TvDetailResponse.fromJson(Map<String, dynamic> json) =
      _$TvDetailResponseImpl.fromJson;

  @override
  bool? get adult;
  @override
  String? get backdropPath;
  @override
  String? get firstAirDate;
  @override
  List<GenreModel>? get genres;
  @override
  int? get id;
  @override
  String? get lastAirDate;
  @override
  TEpisodeToAirResponse? get lastEpisodeToAir;
  @override
  String? get name;
  @override
  TEpisodeToAirResponse? get nextEpisodeToAir;
  @override
  int? get numberOfEpisodes;
  @override
  int? get numberOfSeasons;
  @override
  String? get originalName;
  @override
  String? get overview;
  @override
  double? get popularity;
  @override
  String? get posterPath;
  @override
  List<SeasonResponse>? get seasons;
  @override
  String? get status;
  @override
  double? get voteAverage;
  @override
  int? get voteCount;

  /// Create a copy of TvDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TvDetailResponseImplCopyWith<_$TvDetailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TEpisodeToAirResponse _$TEpisodeToAirResponseFromJson(
    Map<String, dynamic> json) {
  return _TEpisodeToAirResponse.fromJson(json);
}

/// @nodoc
mixin _$TEpisodeToAirResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  int? get voteAverage => throw _privateConstructorUsedError;
  int? get voteCount => throw _privateConstructorUsedError;
  String? get airDate => throw _privateConstructorUsedError;
  int? get episodeNumber => throw _privateConstructorUsedError;
  String? get stillPath => throw _privateConstructorUsedError;

  /// Serializes this TEpisodeToAirResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TEpisodeToAirResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TEpisodeToAirResponseCopyWith<TEpisodeToAirResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TEpisodeToAirResponseCopyWith<$Res> {
  factory $TEpisodeToAirResponseCopyWith(TEpisodeToAirResponse value,
          $Res Function(TEpisodeToAirResponse) then) =
      _$TEpisodeToAirResponseCopyWithImpl<$Res, TEpisodeToAirResponse>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? overview,
      int? voteAverage,
      int? voteCount,
      String? airDate,
      int? episodeNumber,
      String? stillPath});
}

/// @nodoc
class _$TEpisodeToAirResponseCopyWithImpl<$Res,
        $Val extends TEpisodeToAirResponse>
    implements $TEpisodeToAirResponseCopyWith<$Res> {
  _$TEpisodeToAirResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TEpisodeToAirResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? overview = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? airDate = freezed,
    Object? episodeNumber = freezed,
    Object? stillPath = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as int?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeNumber: freezed == episodeNumber
          ? _value.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      stillPath: freezed == stillPath
          ? _value.stillPath
          : stillPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TEpisodeToAirResponseImplCopyWith<$Res>
    implements $TEpisodeToAirResponseCopyWith<$Res> {
  factory _$$TEpisodeToAirResponseImplCopyWith(
          _$TEpisodeToAirResponseImpl value,
          $Res Function(_$TEpisodeToAirResponseImpl) then) =
      __$$TEpisodeToAirResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? overview,
      int? voteAverage,
      int? voteCount,
      String? airDate,
      int? episodeNumber,
      String? stillPath});
}

/// @nodoc
class __$$TEpisodeToAirResponseImplCopyWithImpl<$Res>
    extends _$TEpisodeToAirResponseCopyWithImpl<$Res,
        _$TEpisodeToAirResponseImpl>
    implements _$$TEpisodeToAirResponseImplCopyWith<$Res> {
  __$$TEpisodeToAirResponseImplCopyWithImpl(_$TEpisodeToAirResponseImpl _value,
      $Res Function(_$TEpisodeToAirResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TEpisodeToAirResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? overview = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? airDate = freezed,
    Object? episodeNumber = freezed,
    Object? stillPath = freezed,
  }) {
    return _then(_$TEpisodeToAirResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as int?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeNumber: freezed == episodeNumber
          ? _value.episodeNumber
          : episodeNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      stillPath: freezed == stillPath
          ? _value.stillPath
          : stillPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TEpisodeToAirResponseImpl implements _TEpisodeToAirResponse {
  const _$TEpisodeToAirResponseImpl(
      {this.id,
      this.name,
      this.overview,
      this.voteAverage,
      this.voteCount,
      this.airDate,
      this.episodeNumber,
      this.stillPath});

  factory _$TEpisodeToAirResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TEpisodeToAirResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? overview;
  @override
  final int? voteAverage;
  @override
  final int? voteCount;
  @override
  final String? airDate;
  @override
  final int? episodeNumber;
  @override
  final String? stillPath;

  @override
  String toString() {
    return 'TEpisodeToAirResponse(id: $id, name: $name, overview: $overview, voteAverage: $voteAverage, voteCount: $voteCount, airDate: $airDate, episodeNumber: $episodeNumber, stillPath: $stillPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TEpisodeToAirResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.airDate, airDate) || other.airDate == airDate) &&
            (identical(other.episodeNumber, episodeNumber) ||
                other.episodeNumber == episodeNumber) &&
            (identical(other.stillPath, stillPath) ||
                other.stillPath == stillPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, overview, voteAverage,
      voteCount, airDate, episodeNumber, stillPath);

  /// Create a copy of TEpisodeToAirResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TEpisodeToAirResponseImplCopyWith<_$TEpisodeToAirResponseImpl>
      get copyWith => __$$TEpisodeToAirResponseImplCopyWithImpl<
          _$TEpisodeToAirResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TEpisodeToAirResponseImplToJson(
      this,
    );
  }
}

abstract class _TEpisodeToAirResponse implements TEpisodeToAirResponse {
  const factory _TEpisodeToAirResponse(
      {final int? id,
      final String? name,
      final String? overview,
      final int? voteAverage,
      final int? voteCount,
      final String? airDate,
      final int? episodeNumber,
      final String? stillPath}) = _$TEpisodeToAirResponseImpl;

  factory _TEpisodeToAirResponse.fromJson(Map<String, dynamic> json) =
      _$TEpisodeToAirResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get overview;
  @override
  int? get voteAverage;
  @override
  int? get voteCount;
  @override
  String? get airDate;
  @override
  int? get episodeNumber;
  @override
  String? get stillPath;

  /// Create a copy of TEpisodeToAirResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TEpisodeToAirResponseImplCopyWith<_$TEpisodeToAirResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SeasonResponse _$SeasonResponseFromJson(Map<String, dynamic> json) {
  return _SeasonResponse.fromJson(json);
}

/// @nodoc
mixin _$SeasonResponse {
  String? get airDate => throw _privateConstructorUsedError;
  int? get episodeCount => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  String? get posterPath => throw _privateConstructorUsedError;
  int? get seasonNumber => throw _privateConstructorUsedError;
  double? get voteAverage => throw _privateConstructorUsedError;

  /// Serializes this SeasonResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeasonResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeasonResponseCopyWith<SeasonResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonResponseCopyWith<$Res> {
  factory $SeasonResponseCopyWith(
          SeasonResponse value, $Res Function(SeasonResponse) then) =
      _$SeasonResponseCopyWithImpl<$Res, SeasonResponse>;
  @useResult
  $Res call(
      {String? airDate,
      int? episodeCount,
      int? id,
      String? name,
      String? overview,
      String? posterPath,
      int? seasonNumber,
      double? voteAverage});
}

/// @nodoc
class _$SeasonResponseCopyWithImpl<$Res, $Val extends SeasonResponse>
    implements $SeasonResponseCopyWith<$Res> {
  _$SeasonResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeasonResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airDate = freezed,
    Object? episodeCount = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? seasonNumber = freezed,
    Object? voteAverage = freezed,
  }) {
    return _then(_value.copyWith(
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeCount: freezed == episodeCount
          ? _value.episodeCount
          : episodeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      seasonNumber: freezed == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeasonResponseImplCopyWith<$Res>
    implements $SeasonResponseCopyWith<$Res> {
  factory _$$SeasonResponseImplCopyWith(_$SeasonResponseImpl value,
          $Res Function(_$SeasonResponseImpl) then) =
      __$$SeasonResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? airDate,
      int? episodeCount,
      int? id,
      String? name,
      String? overview,
      String? posterPath,
      int? seasonNumber,
      double? voteAverage});
}

/// @nodoc
class __$$SeasonResponseImplCopyWithImpl<$Res>
    extends _$SeasonResponseCopyWithImpl<$Res, _$SeasonResponseImpl>
    implements _$$SeasonResponseImplCopyWith<$Res> {
  __$$SeasonResponseImplCopyWithImpl(
      _$SeasonResponseImpl _value, $Res Function(_$SeasonResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeasonResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airDate = freezed,
    Object? episodeCount = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? overview = freezed,
    Object? posterPath = freezed,
    Object? seasonNumber = freezed,
    Object? voteAverage = freezed,
  }) {
    return _then(_$SeasonResponseImpl(
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeCount: freezed == episodeCount
          ? _value.episodeCount
          : episodeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      seasonNumber: freezed == seasonNumber
          ? _value.seasonNumber
          : seasonNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeasonResponseImpl implements _SeasonResponse {
  const _$SeasonResponseImpl(
      {this.airDate,
      this.episodeCount,
      this.id,
      this.name,
      this.overview,
      this.posterPath,
      this.seasonNumber,
      this.voteAverage});

  factory _$SeasonResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeasonResponseImplFromJson(json);

  @override
  final String? airDate;
  @override
  final int? episodeCount;
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? overview;
  @override
  final String? posterPath;
  @override
  final int? seasonNumber;
  @override
  final double? voteAverage;

  @override
  String toString() {
    return 'SeasonResponse(airDate: $airDate, episodeCount: $episodeCount, id: $id, name: $name, overview: $overview, posterPath: $posterPath, seasonNumber: $seasonNumber, voteAverage: $voteAverage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeasonResponseImpl &&
            (identical(other.airDate, airDate) || other.airDate == airDate) &&
            (identical(other.episodeCount, episodeCount) ||
                other.episodeCount == episodeCount) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.seasonNumber, seasonNumber) ||
                other.seasonNumber == seasonNumber) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, airDate, episodeCount, id, name,
      overview, posterPath, seasonNumber, voteAverage);

  /// Create a copy of SeasonResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeasonResponseImplCopyWith<_$SeasonResponseImpl> get copyWith =>
      __$$SeasonResponseImplCopyWithImpl<_$SeasonResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeasonResponseImplToJson(
      this,
    );
  }
}

abstract class _SeasonResponse implements SeasonResponse {
  const factory _SeasonResponse(
      {final String? airDate,
      final int? episodeCount,
      final int? id,
      final String? name,
      final String? overview,
      final String? posterPath,
      final int? seasonNumber,
      final double? voteAverage}) = _$SeasonResponseImpl;

  factory _SeasonResponse.fromJson(Map<String, dynamic> json) =
      _$SeasonResponseImpl.fromJson;

  @override
  String? get airDate;
  @override
  int? get episodeCount;
  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get overview;
  @override
  String? get posterPath;
  @override
  int? get seasonNumber;
  @override
  double? get voteAverage;

  /// Create a copy of SeasonResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeasonResponseImplCopyWith<_$SeasonResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
