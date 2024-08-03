import 'package:ditonton/domain/entities/genre.dart';
import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  Tv({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    this.backdropPath,
    this.adult,
    this.firstAirDate,
    this.genres,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.nextEpisodeToAir,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.popularity,
    this.seasons,
    this.status,
    this.voteAverage,
    this.voteCount,
    this.genreIds,
  });

  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final String? backdropPath;
  final bool? adult;
  final String? firstAirDate;
  final List<Genre>? genres;
  final String? lastAirDate;
  final TEpisodeToAir? lastEpisodeToAir;
  final TEpisodeToAir? nextEpisodeToAir;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final double? popularity;
  final List<Season>? seasons;
  final String? status;
  final double? voteAverage;
  final int? voteCount;
  final List<int>? genreIds;

  @override
  List<Object?> get props => [
        id,
        name,
        overview,
        posterPath,
      ];
}

class TEpisodeToAir {
  TEpisodeToAir({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.stillPath,
  });

  final int id;
  final String name;
  final String overview;
  final int voteAverage;
  final int voteCount;
  final String airDate;
  final int episodeNumber;
  final String stillPath;
}

class Season {
  Season({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  final String airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final int seasonNumber;
  final double voteAverage;
}
