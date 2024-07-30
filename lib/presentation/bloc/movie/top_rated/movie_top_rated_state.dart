part of 'movie_top_rated_cubit.dart';

@freezed
class MovieTopRatedState with _$MovieTopRatedState {
  const factory MovieTopRatedState.initial() = _Initial;

  const factory MovieTopRatedState.loading() = _Loading;

  const factory MovieTopRatedState.error(String msg) = _Error;

  const factory MovieTopRatedState.data(List<Movie> list) = _Data;
}
