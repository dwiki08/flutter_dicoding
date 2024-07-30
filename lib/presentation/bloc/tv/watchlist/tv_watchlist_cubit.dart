import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_watchlist_tv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_watchlist_cubit.freezed.dart';
part 'tv_watchlist_state.dart';

class TvWatchlistCubit extends Cubit<TvWatchlistState> {
  TvWatchlistCubit({required this.getWatchlistTv})
      : super(const TvWatchlistState.initial());

  final GetWatchlistTv getWatchlistTv;

  Future<void> fetchData() async {
    emit(TvWatchlistState.loading());
    final result = await getWatchlistTv.execute();
    result.fold(
      (failure) => emit(TvWatchlistState.error(failure.message)),
      (data) {
        emit(TvWatchlistState.data(data));
      },
    );
  }
}
