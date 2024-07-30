import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_detail_model.freezed.dart';
part 'tv_detail_model.g.dart';

@freezed
class TvDetailResponse with _$TvDetailResponse {
  const factory TvDetailResponse({
    bool? adult,
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
    int? voteCount,
  }) = _TvDetailResponse;

  factory TvDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$TvDetailResponseFromJson(json);

  const TvDetailResponse._();

  Tv toEntity() {
    final tvGenres = genres?.map((e) => Genre(id: e.id, name: e.name)).toList();
    final tvLastEpisode = TEpisodeToAir(
      id: lastEpisodeToAir?.id ?? 0,
      name: lastEpisodeToAir?.name ?? '',
      overview: lastEpisodeToAir?.overview ?? '',
      voteCount: lastEpisodeToAir?.voteCount ?? 0,
      voteAverage: lastEpisodeToAir?.voteAverage ?? 0,
      airDate: lastEpisodeToAir?.airDate ?? '',
      episodeNumber: lastEpisodeToAir?.episodeNumber ?? 0,
      stillPath: lastEpisodeToAir?.stillPath ?? '',
    );
    final tvNextEpisode = TEpisodeToAir(
      id: nextEpisodeToAir?.id ?? 0,
      name: nextEpisodeToAir?.name ?? '',
      overview: nextEpisodeToAir?.overview ?? '',
      voteCount: nextEpisodeToAir?.voteCount ?? 0,
      voteAverage: nextEpisodeToAir?.voteAverage ?? 0,
      airDate: nextEpisodeToAir?.airDate ?? '',
      episodeNumber: nextEpisodeToAir?.episodeNumber ?? 0,
      stillPath: nextEpisodeToAir?.stillPath ?? '',
    );
    final tvSeasons = seasons
        ?.map((e) => Season(
            airDate: e.airDate ?? '',
            episodeCount: e.episodeCount ?? 0,
            id: e.id ?? 0,
            name: e.name ?? '',
            overview: e.overview ?? '',
            posterPath: '',
            seasonNumber: e.seasonNumber ?? 0,
            voteAverage: e.voteAverage ?? 0))
        .toList();
    return Tv(
        id: id ?? 0,
        name: name ?? '',
        overview: overview ?? '',
        posterPath: posterPath ?? '',
        backdropPath: backdropPath,
        adult: adult,
        firstAirDate: firstAirDate,
        genres: tvGenres,
        lastAirDate: lastAirDate,
        lastEpisodeToAir: tvLastEpisode,
        nextEpisodeToAir: tvNextEpisode,
        numberOfEpisodes: numberOfEpisodes,
        numberOfSeasons: numberOfSeasons,
        popularity: popularity,
        seasons: tvSeasons ?? [],
        status: status,
        voteAverage: voteAverage,
        voteCount: voteCount);
  }
}

@freezed
class TEpisodeToAirResponse with _$TEpisodeToAirResponse {
  const factory TEpisodeToAirResponse({
    int? id,
    String? name,
    String? overview,
    int? voteAverage,
    int? voteCount,
    String? airDate,
    int? episodeNumber,
    String? stillPath,
  }) = _TEpisodeToAirResponse;

  factory TEpisodeToAirResponse.fromJson(Map<String, dynamic> json) =>
      _$TEpisodeToAirResponseFromJson(json);
}

@freezed
class SeasonResponse with _$SeasonResponse {
  const factory SeasonResponse({
    String? airDate,
    int? episodeCount,
    int? id,
    String? name,
    String? overview,
    String? posterPath,
    int? seasonNumber,
    double? voteAverage,
  }) = _SeasonResponse;

  factory SeasonResponse.fromJson(Map<String, dynamic> json) =>
      _$SeasonResponseFromJson(json);
}
