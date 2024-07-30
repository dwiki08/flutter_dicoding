import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/movie/get_popular_movies.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_popular_cubit.freezed.dart';
part 'movie_popular_state.dart';

class MoviePopularCubit extends Cubit<MoviePopularState> {
  MoviePopularCubit({required this.getPopularMovies})
      : super(MoviePopularState.initial());

  final GetPopularMovies getPopularMovies;

  Future<void> fetchData() async {
    emit(MoviePopularState.loading());
    final result = await getPopularMovies.execute();
    result.fold(
      (failure) => emit(MoviePopularState.error(failure.message)),
      (moviesData) {
        emit(MoviePopularState.data(moviesData));
      },
    );
  }
}
