part of 'movie_watchlist_cubit.dart';

@freezed
class MovieWatchlistState with _$MovieWatchlistState {
  const factory MovieWatchlistState.initial() = _Initial;

  const factory MovieWatchlistState.loading() = _Loading;

  const factory MovieWatchlistState.error(String msg) = _Error;

  const factory MovieWatchlistState.data(List<Movie> list) = _Data;
}
