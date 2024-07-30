import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_now_playing_tv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_now_playing_cubit.freezed.dart';
part 'tv_now_playing_state.dart';

class TvNowPlayingCubit extends Cubit<TvNowPlayingState> {
  TvNowPlayingCubit({required this.getNowPlayingTv})
      : super(const TvNowPlayingState.initial());

  final GetNowPlayingTv getNowPlayingTv;

  Future<void> fetchData() async {
    emit(TvNowPlayingState.loading());
    final result = await getNowPlayingTv.execute();
    result.fold(
      (failure) => emit(TvNowPlayingState.error(failure.message)),
      (moviesData) {
        emit(TvNowPlayingState.data(moviesData));
      },
    );
  }
}
