import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:equatable/equatable.dart';

class MovieTable extends Equatable {
  final int id;
  final String? title;
  final String? posterPath;
  final String? overview;
  final int isTv;

  MovieTable(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.overview,
      required this.isTv});

  factory MovieTable.fromTvEntity(Tv movie) => MovieTable(
        id: movie.id,
        title: movie.name,
        posterPath: movie.posterPath,
        overview: movie.overview,
        isTv: 1,
      );

  factory MovieTable.fromMovieEntity(MovieDetail movie) => MovieTable(
        id: movie.id,
        title: movie.title,
        posterPath: movie.posterPath,
        overview: movie.overview,
        isTv: 0,
      );

  factory MovieTable.fromMap(Map<String, dynamic> map) => MovieTable(
        id: map['id'],
        title: map['title'],
        posterPath: map['posterPath'],
        overview: map['overview'],
        isTv: map['isTv'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'posterPath': posterPath,
        'overview': overview,
        'isTv': isTv,
      };

  Movie toMovieEntity() => Movie.watchlist(
        id: id,
        overview: overview,
        posterPath: posterPath,
        title: title,
      );

  Tv toTvEntity() => Tv(
        id: id,
        overview: overview ?? '',
        posterPath: posterPath ?? '',
        name: title ?? '',
      );

  @override
  List<Object?> get props => [id, title, posterPath, overview, isTv];
}
