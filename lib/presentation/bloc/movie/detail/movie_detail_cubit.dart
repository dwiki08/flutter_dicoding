import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/usecases/movie/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/movie/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/movie/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/movie/save_watchlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail_cubit.freezed.dart';
part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  MovieDetailCubit({
    required GetMovieDetail getMovieDetail,
    required GetMovieRecommendations getMovieRecommendations,
    required GetMovieWatchListStatus getMovieWatchListStatus,
    required SaveMovieWatchlist saveMovieWatchlist,
    required RemoveMovieWatchlist removeMovieWatchlist,
  })  : _getMovieWatchListStatus = getMovieWatchListStatus,
        _getMovieRecommendations = getMovieRecommendations,
        _getMovieDetail = getMovieDetail,
        _saveMovieWatchlist = saveMovieWatchlist,
        _removeMovieWatchlist = removeMovieWatchlist,
        super(const MovieDetailState.initial());

  final GetMovieDetail _getMovieDetail;
  final GetMovieRecommendations _getMovieRecommendations;
  final GetMovieWatchListStatus _getMovieWatchListStatus;
  final SaveMovieWatchlist _saveMovieWatchlist;
  final RemoveMovieWatchlist _removeMovieWatchlist;

  List<Movie> _dataRecommendations = [];

  Future<void> getData(int id) async {
    emit(MovieDetailState.loading());
    final detail = await _getMovieDetail.execute(id);
    final recommendations = await _getMovieRecommendations.execute(id);
    final watchlistStatus = await _getMovieWatchListStatus.execute(id);
    detail.fold(
      (failure) => emit(MovieDetailState.error(failure.message)),
      (dataDetail) {
        recommendations.fold(
          (failure) {
            emit(MovieDetailState.error(failure.message));
          },
          (dataRecommendations) {
            _dataRecommendations = dataRecommendations;
            emit(MovieDetailState.data(
              detail: dataDetail,
              recommendations: dataRecommendations,
              isAddedWatchlist: watchlistStatus,
            ));
          },
        );
      },
    );
  }

  Future<void> addWatchlist(MovieDetail movie) async {
    final result = await _saveMovieWatchlist.execute(movie);
    result.fold(
      (failure) {
        emit(MovieDetailState.error(failure.message));
      },
      (successMsg) {
        emit(MovieDetailState.data(
          detail: movie,
          recommendations: _dataRecommendations,
          isAddedWatchlist: true,
        ));
      },
    );
  }

  Future<void> removeWatchlist(MovieDetail movie) async {
    final result = await _removeMovieWatchlist.execute(movie);
    result.fold(
      (failure) {
        emit(MovieDetailState.error(failure.message));
      },
      (successMsg) {
        emit(MovieDetailState.data(
          detail: movie,
          recommendations: _dataRecommendations,
          isAddedWatchlist: false,
        ));
      },
    );
  }
}
