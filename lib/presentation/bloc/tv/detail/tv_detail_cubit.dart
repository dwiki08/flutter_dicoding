import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_detail.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:ditonton/domain/usecases/tv/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/tv/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/tv/save_watchlist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_detail_cubit.freezed.dart';
part 'tv_detail_state.dart';

class TvDetailCubit extends Cubit<TvDetailState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  TvDetailCubit(
      {required GetTvDetail getTvDetail,
      required GetTvRecommendations getTvRecommendations,
      required GetTvWatchListStatus getTvWatchListStatus,
      required SaveTvWatchlist saveTvWatchlist,
      required RemoveTvWatchlist removeTvWatchlist})
      : _getTvDetail = getTvDetail,
        _getTvRecommendations = getTvRecommendations,
        _getTvWatchListStatus = getTvWatchListStatus,
        _saveTvWatchlist = saveTvWatchlist,
        _removeTvWatchlist = removeTvWatchlist,
        super(const TvDetailState.initial());

  final GetTvDetail _getTvDetail;
  final GetTvRecommendations _getTvRecommendations;
  final GetTvWatchListStatus _getTvWatchListStatus;
  final SaveTvWatchlist _saveTvWatchlist;
  final RemoveTvWatchlist _removeTvWatchlist;

  List<Tv> _dataRecommendations = [];

  Future<void> getData(int id) async {
    emit(TvDetailState.loading());
    final detail = await _getTvDetail.execute(id);
    final recommendations = await _getTvRecommendations.execute(id);
    final watchlistStatus = await _getTvWatchListStatus.execute(id);
    detail.fold(
      (failure) => emit(TvDetailState.error(failure.message)),
      (dataDetail) {
        recommendations.fold(
          (failure) {
            emit(TvDetailState.error(failure.message));
          },
          (dataRecommendations) {
            _dataRecommendations = dataRecommendations;
            emit(TvDetailState.data(
              detail: dataDetail,
              recommendations: dataRecommendations,
              isAddedWatchlist: watchlistStatus,
            ));
          },
        );
      },
    );
  }

  Future<void> addWatchlist(Tv tv) async {
    final result = await _saveTvWatchlist.execute(tv);
    result.fold(
      (failure) {
        emit(TvDetailState.error(failure.message));
      },
      (successMsg) {
        emit(TvDetailState.data(
          detail: tv,
          recommendations: _dataRecommendations,
          isAddedWatchlist: true,
        ));
      },
    );
  }

  Future<void> removeWatchlist(Tv tv) async {
    final result = await _removeTvWatchlist.execute(tv);
    result.fold(
      (failure) {
        emit(TvDetailState.error(failure.message));
      },
      (successMsg) {
        emit(TvDetailState.data(
          detail: tv,
          recommendations: _dataRecommendations,
          isAddedWatchlist: false,
        ));
      },
    );
  }
}
