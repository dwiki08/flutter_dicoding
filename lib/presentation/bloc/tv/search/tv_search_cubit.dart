import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/search_tv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_search_cubit.freezed.dart';
part 'tv_search_state.dart';

class TvSearchCubit extends Cubit<TvSearchState> {
  TvSearchCubit({required this.searchTv})
      : super(const TvSearchState.initial());

  final SearchTv searchTv;

  String _lastQuery = '';

  String get lastQuery => _lastQuery;

  Future<void> searchData(String query) async {
    emit(TvSearchState.loading());
    _lastQuery = query;
    final result = await searchTv.execute(query);
    result.fold(
      (failure) => emit(TvSearchState.error(failure.message)),
      (moviesData) {
        emit(TvSearchState.data(moviesData));
      },
    );
  }
}
