import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_popular_tv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_popular_cubit.freezed.dart';
part 'tv_popular_state.dart';

class TvPopularCubit extends Cubit<TvPopularState> {
  TvPopularCubit({required this.getPopularTv})
      : super(const TvPopularState.initial());

  final GetPopularTv getPopularTv;

  Future<void> fetchData() async {
    emit(TvPopularState.loading());
    final result = await getPopularTv.execute();
    result.fold(
      (failure) => emit(TvPopularState.error(failure.message)),
      (moviesData) {
        emit(TvPopularState.data(moviesData));
      },
    );
  }
}
