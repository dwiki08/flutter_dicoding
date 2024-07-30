part of 'movie_detail_cubit.dart';

@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState.initial() = _Initial;

  const factory MovieDetailState.loading() = _Loading;

  const factory MovieDetailState.error(String msg) = _Error;

  const factory MovieDetailState.data(
      {required MovieDetail detail,
      required List<Movie> recommendations,
      required bool isAddedWatchlist}) = _Data;
}
