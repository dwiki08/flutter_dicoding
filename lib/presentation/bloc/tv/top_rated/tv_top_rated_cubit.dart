import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_top_rated_tv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_top_rated_cubit.freezed.dart';
part 'tv_top_rated_state.dart';

class TvTopRatedCubit extends Cubit<TvTopRatedState> {
  TvTopRatedCubit({required this.getTopRatedTv})
      : super(const TvTopRatedState.initial());

  final GetTopRatedTv getTopRatedTv;

  Future<void> fetchData() async {
    emit(TvTopRatedState.loading());
    final result = await getTopRatedTv.execute();
    result.fold(
      (failure) => emit(TvTopRatedState.error(failure.message)),
      (moviesData) {
        emit(TvTopRatedState.data(moviesData));
      },
    );
  }
}
