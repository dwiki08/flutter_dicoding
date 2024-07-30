import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_watchlist_cubit.freezed.dart';
part 'movie_watchlist_state.dart';

class MovieWatchlistCubit extends Cubit<MovieWatchlistState> {
  MovieWatchlistCubit({required this.getWatchlistMovies})
      : super(const MovieWatchlistState.initial());

  final GetWatchlistMovies getWatchlistMovies;

  Future<void> fetchData() async {
    emit(MovieWatchlistState.loading());
    final result = await getWatchlistMovies.execute();
    result.fold(
      (failure) => emit(MovieWatchlistState.error(failure.message)),
      (moviesData) {
        emit(MovieWatchlistState.data(moviesData));
      },
    );
  }
}
