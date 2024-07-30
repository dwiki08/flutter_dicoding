import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tv/get_watchlist_tv.dart';
import 'package:ditonton/presentation/bloc/tv/watchlist/tv_watchlist_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'tv_watchlist_cubit_test.mocks.dart';

@GenerateMocks([GetWatchlistTv])
void main() {
  late TvWatchlistCubit tvWatchlistCubit;
  late MockGetWatchlistTv mockGetWatchlistTv;

  setUp(() {
    mockGetWatchlistTv = MockGetWatchlistTv();
    tvWatchlistCubit =
        TvWatchlistCubit(getWatchlistTv: mockGetWatchlistTv);
  });

  group('fetchData()', () {
    blocTest<TvWatchlistCubit, TvWatchlistState>(
      'Should emit state [loading, data] when fetchData() is called success',
      build: () {
        when(mockGetWatchlistTv.execute())
            .thenAnswer((_) async => Right(testTvList));
        return tvWatchlistCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetWatchlistTv.execute());
      },
      expect: () => [
        TvWatchlistState.loading(),
        TvWatchlistState.data(testTvList),
      ],
    );

    blocTest<TvWatchlistCubit, TvWatchlistState>(
      'Should emit state [loading, error] when fetchData() is error',
      build: () {
        when(mockGetWatchlistTv.execute())
            .thenAnswer((_) async => Left(ServerFailure('error')));
        return tvWatchlistCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetWatchlistTv.execute());
      },
      expect: () => [
        TvWatchlistState.loading(),
        TvWatchlistState.error('error')
      ],
    );
  });
}
