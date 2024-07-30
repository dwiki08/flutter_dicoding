part of 'tv_popular_cubit.dart';

@freezed
class TvPopularState with _$TvPopularState {
  const factory TvPopularState.initial() = _Initial;

  const factory TvPopularState.loading() = _Loading;

  const factory TvPopularState.error(String msg) = _Error;

  const factory TvPopularState.data(List<Tv> list) = _Data;
}
