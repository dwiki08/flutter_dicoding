part of 'movie_now_playing_cubit.dart';

@freezed
class MovieNowPlayingState with _$MovieNowPlayingState {
  const factory MovieNowPlayingState.initial() = _Initial;

  const factory MovieNowPlayingState.loading() = _Loading;

  const factory MovieNowPlayingState.error(String msg) = _Error;

  const factory MovieNowPlayingState.data(List<Movie> list) = _Data;
}
