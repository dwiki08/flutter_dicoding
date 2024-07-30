import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_now_playing_cubit.freezed.dart';
part 'movie_now_playing_state.dart';

class MovieNowPlayingCubit extends Cubit<MovieNowPlayingState> {
  MovieNowPlayingCubit({required this.getNowPlayingMovies})
      : super(const MovieNowPlayingState.initial());

  final GetNowPlayingMovies getNowPlayingMovies;

  Future<void> fetchData() async {
    emit(MovieNowPlayingState.loading());
    final result = await getNowPlayingMovies.execute();
    result.fold(
      (failure) => emit(MovieNowPlayingState.error(failure.message)),
      (moviesData) {
        emit(MovieNowPlayingState.data(moviesData));
      },
    );
  }
}
