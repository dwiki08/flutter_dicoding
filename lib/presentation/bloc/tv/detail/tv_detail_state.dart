part of 'tv_detail_cubit.dart';

@freezed
class TvDetailState with _$TvDetailState {
  const factory TvDetailState.initial() = _Initial;

  const factory TvDetailState.loading() = _Loading;

  const factory TvDetailState.error(String msg) = _Error;

  const factory TvDetailState.data(
      {required Tv detail,
      required List<Tv> recommendations,
      required bool isAddedWatchlist}) = _Data;
}
