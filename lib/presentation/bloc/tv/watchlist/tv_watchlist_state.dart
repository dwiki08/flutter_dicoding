part of 'tv_watchlist_cubit.dart';

@freezed
class TvWatchlistState with _$TvWatchlistState {
  const factory TvWatchlistState.initial() = _Initial;

  const factory TvWatchlistState.loading() = _Loading;

  const factory TvWatchlistState.error(String msg) = _Error;

  const factory TvWatchlistState.data(List<Tv> list) = _Data;
}
