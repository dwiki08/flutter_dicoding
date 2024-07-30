import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/movie/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/movie/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/movie/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/movie/save_watchlist.dart';
import 'package:ditonton/presentation/bloc/movie/detail/movie_detail_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movie_detail_cubit_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetMovieRecommendations,
  GetMovieWatchListStatus,
  SaveMovieWatchlist,
  RemoveMovieWatchlist
])
void main() {
  late MovieDetailCubit movieDetailCubit;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetMovieWatchListStatus mockGetMovieWatchListStatus;
  late MockSaveMovieWatchlist mockSaveMovieWatchlist;
  late MockRemoveMovieWatchlist mockRemoveMovieWatchlist;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetMovieWatchListStatus = MockGetMovieWatchListStatus();
    mockSaveMovieWatchlist = MockSaveMovieWatchlist();
    mockRemoveMovieWatchlist = MockRemoveMovieWatchlist();
    movieDetailCubit = MovieDetailCubit(
        getMovieDetail: mockGetMovieDetail,
        getMovieRecommendations: mockGetMovieRecommendations,
        getMovieWatchListStatus: mockGetMovieWatchListStatus,
        saveMovieWatchlist: mockSaveMovieWatchlist,
        removeMovieWatchlist: mockRemoveMovieWatchlist);
  });

  final tId = 1;

  group('getData()', () {
    blocTest<MovieDetailCubit, MovieDetailState>(
      'Should emit state [loading, data] when getData(tId) is called success',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => Right(testMovieDetail));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Right(testMovieList));
        when(mockGetMovieWatchListStatus.execute(tId))
            .thenAnswer((_) async => true);
        return movieDetailCubit;
      },
      act: (cubit) => cubit.getData(tId),
      verify: (_) {
        verify(mockGetMovieDetail.execute(tId));
        verify(mockGetMovieRecommendations.execute(tId));
      },
      expect: () => [
        MovieDetailState.loading(),
        MovieDetailState.data(
            detail: testMovieDetail,
            recommendations: testMovieList,
            isAddedWatchlist: true)
      ],
    );

    blocTest<MovieDetailCubit, MovieDetailState>(
      'Should emit state [loading, error] when getData(tId) - GetMovieDetail is error',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure('error')));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Right(testMovieList));
        when(mockGetMovieWatchListStatus.execute(tId))
            .thenAnswer((_) async => true);
        return movieDetailCubit;
      },
      act: (cubit) => cubit.getData(tId),
      verify: (_) {
        verify(mockGetMovieDetail.execute(tId));
        verify(mockGetMovieRecommendations.execute(tId));
      },
      expect: () => [
        MovieDetailState.loading(),
        MovieDetailState.error('error'),
      ],
    );

    blocTest<MovieDetailCubit, MovieDetailState>(
      'Should emit state [loading, error] when getData(tId) - GetMovieRecommendations is error',
      build: () {
        when(mockGetMovieDetail.execute(tId))
            .thenAnswer((_) async => Right(testMovieDetail));
        when(mockGetMovieRecommendations.execute(tId))
            .thenAnswer((_) async => Left(ServerFailure('error')));
        when(mockGetMovieWatchListStatus.execute(tId))
            .thenAnswer((_) async => true);
        return movieDetailCubit;
      },
      act: (cubit) => cubit.getData(tId),
      verify: (_) {
        verify(mockGetMovieDetail.execute(tId));
        verify(mockGetMovieRecommendations.execute(tId));
      },
      expect: () => [
        MovieDetailState.loading(),
        MovieDetailState.error('error'),
      ],
    );
  });

  group('addWatchlist()', () {
    blocTest<MovieDetailCubit, MovieDetailState>(
      'Should emit state [data] when addWatchlist(movie) is called success',
      build: () {
        when(mockSaveMovieWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Right('Added to Watchlist'));
        return movieDetailCubit;
      },
      act: (cubit) => cubit.addWatchlist(testMovieDetail),
      verify: (_) {
        verify(mockSaveMovieWatchlist.execute(testMovieDetail));
      },
      expect: () => [
        MovieDetailState.data(
            detail: testMovieDetail,
            recommendations: [],
            isAddedWatchlist: true)
      ],
    );

    blocTest<MovieDetailCubit, MovieDetailState>(
      'Should emit state [error] when addWatchlist(movie) is error',
      build: () {
        when(mockSaveMovieWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('error')));
        return movieDetailCubit;
      },
      act: (cubit) => cubit.addWatchlist(testMovieDetail),
      verify: (_) {
        verify(mockSaveMovieWatchlist.execute(testMovieDetail));
      },
      expect: () => [MovieDetailState.error('error')],
    );
  });

  group('removeWatchlist()', () {
    blocTest<MovieDetailCubit, MovieDetailState>(
      'Should emit state [data] when removeWatchlist(movie) is called success',
      build: () {
        when(mockRemoveMovieWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Right('Removed to Watchlist'));
        return movieDetailCubit;
      },
      act: (cubit) => cubit.removeWatchlist(testMovieDetail),
      verify: (_) {
        verify(mockRemoveMovieWatchlist.execute(testMovieDetail));
      },
      expect: () => [
        MovieDetailState.data(
            detail: testMovieDetail,
            recommendations: [],
            isAddedWatchlist: false)
      ],
    );

    blocTest<MovieDetailCubit, MovieDetailState>(
      'Should emit state [error] when removeWatchlist(movie) is error',
      build: () {
        when(mockRemoveMovieWatchlist.execute(testMovieDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('error')));
        return movieDetailCubit;
      },
      act: (cubit) => cubit.removeWatchlist(testMovieDetail),
      verify: (_) {
        verify(mockRemoveMovieWatchlist.execute(testMovieDetail));
      },
      expect: () => [MovieDetailState.error('error')],
    );
  });
}
