import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_top_rated_cubit.freezed.dart';
part 'movie_top_rated_state.dart';

class MovieTopRatedCubit extends Cubit<MovieTopRatedState> {
  MovieTopRatedCubit({required this.getTopRatedMovies})
      : super(const MovieTopRatedState.initial());

  final GetTopRatedMovies getTopRatedMovies;

  Future<void> fetchData() async {
    emit(MovieTopRatedState.loading());
    final result = await getTopRatedMovies.execute();
    result.fold(
      (failure) => emit(MovieTopRatedState.error(failure.message)),
      (moviesData) {
        emit(MovieTopRatedState.data(moviesData));
      },
    );
  }
}
