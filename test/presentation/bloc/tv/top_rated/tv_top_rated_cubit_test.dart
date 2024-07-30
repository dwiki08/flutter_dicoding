import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tv/get_top_rated_tv.dart';
import 'package:ditonton/presentation/bloc/tv/top_rated/tv_top_rated_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'tv_top_rated_cubit_test.mocks.dart';

@GenerateMocks([GetTopRatedTv])
void main() {
  late TvTopRatedCubit tvTopRatedCubit;
  late MockGetTopRatedTv mockGetTopRatedTv;

  setUp(() {
    mockGetTopRatedTv = MockGetTopRatedTv();
    tvTopRatedCubit =
        TvTopRatedCubit(getTopRatedTv: mockGetTopRatedTv);
  });

  group('fetchData()', () {
    blocTest<TvTopRatedCubit, TvTopRatedState>(
      'Should emit state [loading, data] when fetchData() is called success',
      build: () {
        when(mockGetTopRatedTv.execute())
            .thenAnswer((_) async => Right(testTvList));
        return tvTopRatedCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetTopRatedTv.execute());
      },
      expect: () => [
        TvTopRatedState.loading(),
        TvTopRatedState.data(testTvList),
      ],
    );

    blocTest<TvTopRatedCubit, TvTopRatedState>(
      'Should emit state [loading, error] when fetchData() is error',
      build: () {
        when(mockGetTopRatedTv.execute())
            .thenAnswer((_) async => Left(ServerFailure('error')));
        return tvTopRatedCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetTopRatedTv.execute());
      },
      expect: () => [
        TvTopRatedState.loading(),
        TvTopRatedState.error('error')
      ],
    );
  });
}
