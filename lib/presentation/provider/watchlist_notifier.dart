import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:ditonton/domain/usecases/tv/get_watchlist_tv.dart';
import 'package:flutter/foundation.dart';

class WatchlistNotifier extends ChangeNotifier {
  var _watchlistMovies = <Movie>[];

  List<Movie> get watchlistMovies => _watchlistMovies;

  var _watchlistMovieState = RequestState.Empty;

  RequestState get watchlistMovieState => _watchlistMovieState;

  var _watchlistTv = <Tv>[];

  List<Tv> get watchlistTv => _watchlistTv;

  var _watchlistTvState = RequestState.Empty;

  RequestState get watchlistTvState => _watchlistTvState;

  String _message = '';

  String get message => _message;

  WatchlistNotifier({
    required this.getWatchlistMovies,
    required this.getWatchlistTv,
  });

  final GetWatchlistMovies getWatchlistMovies;
  final GetWatchlistTv getWatchlistTv;

  Future<void> fetchWatchlistMovies() async {
    _watchlistMovieState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistMovies.execute();
    result.fold(
      (failure) {
        _watchlistMovieState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (data) {
        _watchlistMovieState = RequestState.Loaded;
        _watchlistMovies = data;
        notifyListeners();
      },
    );
  }

  Future<void> fetchWatchlistTv() async {
    _watchlistTvState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTv.execute();
    result.fold(
      (failure) {
        _watchlistTvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (data) {
        _watchlistTvState = RequestState.Loaded;
        _watchlistTv = data;
        notifyListeners();
      },
    );
  }
}
