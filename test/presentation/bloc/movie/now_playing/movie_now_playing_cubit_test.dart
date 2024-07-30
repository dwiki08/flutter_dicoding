import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:ditonton/presentation/bloc/movie/now_playing/movie_now_playing_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movie_now_playing_cubit_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies])
void main() {
  late MovieNowPlayingCubit movieNowPlayingCubit;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    movieNowPlayingCubit =
        MovieNowPlayingCubit(getNowPlayingMovies: mockGetNowPlayingMovies);
  });

  group('fetchData()', () {
    blocTest<MovieNowPlayingCubit, MovieNowPlayingState>(
      'Should emit state [loading, data] when fetchData() is called success',
      build: () {
        when(mockGetNowPlayingMovies.execute())
            .thenAnswer((_) async => Right(testMovieList));
        return movieNowPlayingCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetNowPlayingMovies.execute());
      },
      expect: () => [
        MovieNowPlayingState.loading(),
        MovieNowPlayingState.data(testMovieList),
      ],
    );

    blocTest<MovieNowPlayingCubit, MovieNowPlayingState>(
      'Should emit state [loading, error] when fetchData() is error',
      build: () {
        when(mockGetNowPlayingMovies.execute())
            .thenAnswer((_) async => Left(ServerFailure('error')));
        return movieNowPlayingCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetNowPlayingMovies.execute());
      },
      expect: () => [
        MovieNowPlayingState.loading(),
        MovieNowPlayingState.error('error')
      ],
    );
  });
}
