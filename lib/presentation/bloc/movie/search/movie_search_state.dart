part of 'movie_search_cubit.dart';

@freezed
class MovieSearchState with _$MovieSearchState {
  const factory MovieSearchState.initial() = _Initial;

  const factory MovieSearchState.loading() = _Loading;

  const factory MovieSearchState.error(String msg) = _Error;

  const factory MovieSearchState.data(List<Movie> list) = _Data;
}
