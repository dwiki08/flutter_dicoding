import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/movie/search_movies.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_search_cubit.freezed.dart';
part 'movie_search_state.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  MovieSearchCubit({required this.searchMovies})
      : super(const MovieSearchState.initial());

  final SearchMovies searchMovies;

  String _lastQuery = '';

  String get lastQuery => _lastQuery;

  Future<void> searchData(String query) async {
    emit(MovieSearchState.loading());
    _lastQuery = query;
    final result = await searchMovies.execute(query);
    result.fold(
      (failure) => emit(MovieSearchState.error(failure.message)),
      (moviesData) {
        emit(MovieSearchState.data(moviesData));
      },
    );
  }
}
