import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_detail.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:ditonton/domain/usecases/tv/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/tv/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/tv/save_watchlist.dart';
import 'package:ditonton/presentation/bloc/tv/detail/tv_detail_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'tv_detail_cubit_test.mocks.dart';

@GenerateMocks([
  GetTvDetail,
  GetTvRecommendations,
  GetTvWatchListStatus,
  SaveTvWatchlist,
  RemoveTvWatchlist
])
void main() {
  late TvDetailCubit movieDetailCubit;
  late MockGetTvDetail mockGetTvDetail;
  late MockGetTvRecommendations mockGetTvRecommendations;
  late MockGetTvWatchListStatus mockGetTvWatchListStatus;
  late MockSaveTvWatchlist mockSaveTvWatchlist;
  late MockRemoveTvWatchlist mockRemoveTvWatchlist;

  setUp(() {
    mockGetTvDetail = MockGetTvDetail();
    mockGetTvRecommendations = MockGetTvRecommendations();
    mockGetTvWatchListStatus = MockGetTvWatchListStatus();
    mockSaveTvWatchlist = MockSaveTvWatchlist();
    mockRemoveTvWatchlist = MockRemoveTvWatchlist();
    movieDetailCubit = TvDetailCubit(
        getTvDetail: mockGetTvDetail,
        getTvRecommendations: mockGetTvRecommendations,
        getTvWatchListStatus: mockGetTvWatchListStatus,
        saveTvWatchlist: mockSaveTvWatchlist,
        removeTvWatchlist: mockRemoveTvWatchlist);
  });

  final tId = 1;

  group('getData()', () {
    blocTest<TvDetailCubit, TvDetailState>(
      'Should emit state [loading, data] when getData(tId) is called success',
      build: () {
        when(mockGetTvDetail.execute(tId))
            .thenAnswer((_) async => Right(testTvDetail));
        when(mockGetTvRecommendations.execute(tId))
            .thenAnswer((_) async => Right(testTvList));
        when(mockGetTvWatchListStatus.execute(tId))
            .thenAnswer((_) async => true);
        return movieDetailCubit;
      },
      act: (cubit) => cubit.getData(tId),
      verify: (_) {
        verify(mockGetTvDetail.execute(tId));
        verify(mockGetTvRecommendations.execute(tId));
      },
      expect: () => [
        TvDetailState.loading(),
        TvDetailState.data(
            detail: testTvDetail,
            recommendations: testTvList,
            isAddedWatchlist: true)
      ],
    );

    blocTest<TvDetailCubit, TvDetailState>(
      'Should emit state [loading, error] when getData(tId) - GetTvDetail is error',
      build: () {
        when(mockGetTvDetail.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure('error')));
        when(mockGetTvRecommendations.execute(tId))
            .thenAnswer((_) async => Right(testTvList));
        when(mockGetTvWatchListStatus.execute(tId))
            .thenAnswer((_) async => true);
        return movieDetailCubit;
      },
      act: (cubit) => cubit.getData(tId),
      verify: (_) {
        verify(mockGetTvDetail.execute(tId));
        verify(mockGetTvRecommendations.execute(tId));
      },
      expect: () => [TvDetailState.loading(), TvDetailState.error('error')],
    );

    blocTest<TvDetailCubit, TvDetailState>(
      'Should emit state [loading, error] when getData(tId) - GetTvRecommendations is error',
      build: () {
        when(mockGetTvDetail.execute(tId))
            .thenAnswer((_) async => Right(testTvDetail));
        when(mockGetTvRecommendations.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure('error')));
        when(mockGetTvWatchListStatus.execute(tId))
            .thenAnswer((_) async => true);
        return movieDetailCubit;
      },
      act: (cubit) => cubit.getData(tId),
      verify: (_) {
        verify(mockGetTvDetail.execute(tId));
        verify(mockGetTvRecommendations.execute(tId));
      },
      expect: () => [
        TvDetailState.loading(),
        TvDetailState.error('error'),
      ],
    );
  });

  group('addWatchlist()', () {
    blocTest<TvDetailCubit, TvDetailState>(
      'Should emit state [data] when addWatchlist(movie) is called success',
      build: () {
        when(mockSaveTvWatchlist.execute(testTvDetail))
            .thenAnswer((_) async => Right('Added to Watchlist'));
        return movieDetailCubit;
      },
      act: (cubit) => cubit.addWatchlist(testTvDetail),
      verify: (_) {
        verify(mockSaveTvWatchlist.execute(testTvDetail));
      },
      expect: () => [
        TvDetailState.data(
            detail: testTvDetail, recommendations: [], isAddedWatchlist: true)
      ],
    );

    blocTest<TvDetailCubit, TvDetailState>(
      'Should emit state [error] when addWatchlist(movie) is error',
      build: () {
        when(mockSaveTvWatchlist.execute(testTvDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('error')));
        return movieDetailCubit;
      },
      act: (cubit) => cubit.addWatchlist(testTvDetail),
      verify: (_) {
        verify(mockSaveTvWatchlist.execute(testTvDetail));
      },
      expect: () => [TvDetailState.error('error')],
    );
  });

  group('removeWatchlist()', () {
    blocTest<TvDetailCubit, TvDetailState>(
      'Should emit state [data] when removeWatchlist(movie) is called success',
      build: () {
        when(mockRemoveTvWatchlist.execute(testTvDetail))
            .thenAnswer((_) async => Right('Removed to Watchlist'));
        return movieDetailCubit;
      },
      act: (cubit) => cubit.removeWatchlist(testTvDetail),
      verify: (_) {
        verify(mockRemoveTvWatchlist.execute(testTvDetail));
      },
      expect: () => [
        TvDetailState.data(
            detail: testTvDetail, recommendations: [], isAddedWatchlist: false)
      ],
    );

    blocTest<TvDetailCubit, TvDetailState>(
      'Should emit state [error] when removeWatchlist(movie) is error',
      build: () {
        when(mockRemoveTvWatchlist.execute(testTvDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('error')));
        return movieDetailCubit;
      },
      act: (cubit) => cubit.removeWatchlist(testTvDetail),
      verify: (_) {
        verify(mockRemoveTvWatchlist.execute(testTvDetail));
      },
      expect: () => [TvDetailState.error('error')],
    );
  });
}
