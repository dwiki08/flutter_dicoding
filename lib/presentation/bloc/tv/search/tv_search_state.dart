part of 'tv_search_cubit.dart';

@freezed
class TvSearchState with _$TvSearchState {
  const factory TvSearchState.initial() = _Initial;

  const factory TvSearchState.loading() = _Loading;

  const factory TvSearchState.error(String msg) = _Error;

  const factory TvSearchState.data(List<Tv> list) = _Data;
}
