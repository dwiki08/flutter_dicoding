part of 'tv_top_rated_cubit.dart';

@freezed
class TvTopRatedState with _$TvTopRatedState {
  const factory TvTopRatedState.initial() = _Initial;

  const factory TvTopRatedState.loading() = _Loading;

  const factory TvTopRatedState.error(String msg) = _Error;

  const factory TvTopRatedState.data(List<Tv> list) = _Data;
}
