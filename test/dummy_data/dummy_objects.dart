import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/tv.dart';

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

final testTvList = [testTvDetail];

final testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testTvDetail = Tv(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 0, name: '')],
  id: 1,
  name: 'name',
  overview: 'overview',
  posterPath: 'posterPath',
  firstAirDate: '01-01-2020',
  voteAverage: 1,
  voteCount: 1,
  popularity: 1,
  status: 'status',
  lastAirDate: '01-01-2020',
  lastEpisodeToAir: TEpisodeToAir(
      id: 0,
      overview: '',
      voteAverage: 0,
      voteCount: 0,
      airDate: '',
      episodeNumber: 0,
      stillPath: '',
      name: ''),
  nextEpisodeToAir: TEpisodeToAir(
      id: 0,
      overview: '',
      voteAverage: 0,
      voteCount: 0,
      airDate: '',
      episodeNumber: 0,
      stillPath: '',
      name: ''),
  numberOfEpisodes: 1,
  numberOfSeasons: 1,
  seasons: [
    Season(
        airDate: '',
        episodeCount: 0,
        id: 0,
        name: '',
        overview: '',
        posterPath: '',
        seasonNumber: 0,
        voteAverage: 0)
  ],
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testWatchlistTv = Tv(
  id: 1,
  overview: 'overview',
  posterPath: 'posterPath',
  name: 'name',
);

final testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
  isTv: 0,
);

final testTvTable = MovieTable(
  id: 1,
  title: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
  isTv: 1,
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
  'isTv': 0
};
