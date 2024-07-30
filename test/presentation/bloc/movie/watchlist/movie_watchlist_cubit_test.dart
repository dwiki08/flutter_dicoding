import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:ditonton/presentation/bloc/movie/watchlist/movie_watchlist_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movie_watchlist_cubit_test.mocks.dart';

@GenerateMocks([GetWatchlistMovies])
void main() {
  late MovieWatchlistCubit movieWatchlistCubit;
  late MockGetWatchlistMovies mockGetWatchlistMovies;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    movieWatchlistCubit =
        MovieWatchlistCubit(getWatchlistMovies: mockGetWatchlistMovies);
  });

  group('fetchData()', () {
    blocTest<MovieWatchlistCubit, MovieWatchlistState>(
      'Should emit state [loading, data] when fetchData() is called success',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Right(testMovieList));
        return movieWatchlistCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetWatchlistMovies.execute());
      },
      expect: () => [
        MovieWatchlistState.loading(),
        MovieWatchlistState.data(testMovieList),
      ],
    );

    blocTest<MovieWatchlistCubit, MovieWatchlistState>(
      'Should emit state [loading, error] when fetchData() is error',
      build: () {
        when(mockGetWatchlistMovies.execute())
            .thenAnswer((_) async => Left(ServerFailure('error')));
        return movieWatchlistCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetWatchlistMovies.execute());
      },
      expect: () => [
        MovieWatchlistState.loading(),
        MovieWatchlistState.error('error')
      ],
    );
  });
}
