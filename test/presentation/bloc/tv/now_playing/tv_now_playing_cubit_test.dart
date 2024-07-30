import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tv/get_now_playing_tv.dart';
import 'package:ditonton/presentation/bloc/tv/now_playing/tv_now_playing_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'tv_now_playing_cubit_test.mocks.dart';

@GenerateMocks([GetNowPlayingTv])
void main() {
  late TvNowPlayingCubit tvNowPlayingCubit;
  late MockGetNowPlayingTv mockGetNowPlayingTv;

  setUp(() {
    mockGetNowPlayingTv = MockGetNowPlayingTv();
    tvNowPlayingCubit =
        TvNowPlayingCubit(getNowPlayingTv: mockGetNowPlayingTv);
  });

  group('fetchData()', () {
    blocTest<TvNowPlayingCubit, TvNowPlayingState>(
      'Should emit state [loading, data] when fetchData() is called success',
      build: () {
        when(mockGetNowPlayingTv.execute())
            .thenAnswer((_) async => Right(testTvList));
        return tvNowPlayingCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetNowPlayingTv.execute());
      },
      expect: () => [
        TvNowPlayingState.loading(),
        TvNowPlayingState.data(testTvList),
      ],
    );

    blocTest<TvNowPlayingCubit, TvNowPlayingState>(
      'Should emit state [loading, error] when fetchData() is error',
      build: () {
        when(mockGetNowPlayingTv.execute())
            .thenAnswer((_) async => Left(ServerFailure('error')));
        return tvNowPlayingCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetNowPlayingTv.execute());
      },
      expect: () => [
        TvNowPlayingState.loading(),
        TvNowPlayingState.error('error')
      ],
    );
  });
}
