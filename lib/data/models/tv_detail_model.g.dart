// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file


part of 'tv_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TvDetailResponseImpl _$$TvDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TvDetailResponseImpl(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      firstAirDate: json['first_air_date'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num?)?.toInt(),
      lastAirDate: json['last_air_date'] as String?,
      lastEpisodeToAir: json['last_episode_to_air'] == null
          ? null
          : TEpisodeToAirResponse.fromJson(
              json['last_episode_to_air'] as Map<String, dynamic>),
      name: json['name'] as String?,
      nextEpisodeToAir: json['next_episode_to_air'] == null
          ? null
          : TEpisodeToAirResponse.fromJson(
              json['next_episode_to_air'] as Map<String, dynamic>),
      numberOfEpisodes: (json['number_of_episodes'] as num?)?.toInt(),
      numberOfSeasons: (json['number_of_seasons'] as num?)?.toInt(),
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => SeasonResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TvDetailResponseImplToJson(
        _$TvDetailResponseImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'first_air_date': instance.firstAirDate,
      'genres': instance.genres,
      'id': instance.id,
      'last_air_date': instance.lastAirDate,
      'last_episode_to_air': instance.lastEpisodeToAir,
      'name': instance.name,
      'next_episode_to_air': instance.nextEpisodeToAir,
      'number_of_episodes': instance.numberOfEpisodes,
      'number_of_seasons': instance.numberOfSeasons,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'seasons': instance.seasons,
      'status': instance.status,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

_$TEpisodeToAirResponseImpl _$$TEpisodeToAirResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TEpisodeToAirResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toInt(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      airDate: json['air_date'] as String?,
      episodeNumber: (json['episode_number'] as num?)?.toInt(),
      stillPath: json['still_path'] as String?,
    );

Map<String, dynamic> _$$TEpisodeToAirResponseImplToJson(
        _$TEpisodeToAirResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'air_date': instance.airDate,
      'episode_number': instance.episodeNumber,
      'still_path': instance.stillPath,
    };

_$SeasonResponseImpl _$$SeasonResponseImplFromJson(Map<String, dynamic> json) =>
    _$SeasonResponseImpl(
      airDate: json['air_date'] as String?,
      episodeCount: (json['episode_count'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      seasonNumber: (json['season_number'] as num?)?.toInt(),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SeasonResponseImplToJson(
        _$SeasonResponseImpl instance) =>
    <String, dynamic>{
      'air_date': instance.airDate,
      'episode_count': instance.episodeCount,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'season_number': instance.seasonNumber,
      'vote_average': instance.voteAverage,
    };
