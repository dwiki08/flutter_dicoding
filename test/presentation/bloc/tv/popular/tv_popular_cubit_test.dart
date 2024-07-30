import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tv/get_popular_tv.dart';
import 'package:ditonton/presentation/bloc/tv/popular/tv_popular_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'tv_popular_cubit_test.mocks.dart';

@GenerateMocks([GetPopularTv])
void main() {
  late TvPopularCubit tvPopularCubit;
  late MockGetPopularTv mockGetPopularTv;

  setUp(() {
    mockGetPopularTv = MockGetPopularTv();
    tvPopularCubit =
        TvPopularCubit(getPopularTv: mockGetPopularTv);
  });

  group('fetchData()', () {
    blocTest<TvPopularCubit, TvPopularState>(
      'Should emit state [loading, data] when fetchData() is called success',
      build: () {
        when(mockGetPopularTv.execute())
            .thenAnswer((_) async => Right(testTvList));
        return tvPopularCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetPopularTv.execute());
      },
      expect: () => [
        TvPopularState.loading(),
        TvPopularState.data(testTvList),
      ],
    );

    blocTest<TvPopularCubit, TvPopularState>(
      'Should emit state [loading, error] when fetchData() is error',
      build: () {
        when(mockGetPopularTv.execute())
            .thenAnswer((_) async => Left(ServerFailure('error')));
        return tvPopularCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetPopularTv.execute());
      },
      expect: () => [
        TvPopularState.loading(),
        TvPopularState.error('error')
      ],
    );
  });
}
