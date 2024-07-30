part of 'tv_now_playing_cubit.dart';

@freezed
class TvNowPlayingState with _$TvNowPlayingState {
  const factory TvNowPlayingState.initial() = _Initial;

  const factory TvNowPlayingState.loading() = _Loading;

  const factory TvNowPlayingState.error(String msg) = _Error;

  const factory TvNowPlayingState.data(List<Tv> list) = _Data;
}
