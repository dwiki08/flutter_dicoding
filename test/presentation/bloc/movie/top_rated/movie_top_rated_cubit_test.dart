import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:ditonton/presentation/bloc/movie/top_rated/movie_top_rated_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movie_top_rated_cubit_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late MovieTopRatedCubit movieTopRatedCubit;
  late MockGetTopRatedMovies mockGetTopRatedMovies;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    movieTopRatedCubit =
        MovieTopRatedCubit(getTopRatedMovies: mockGetTopRatedMovies);
  });

  group('fetchData()', () {
    blocTest<MovieTopRatedCubit, MovieTopRatedState>(
      'Should emit state [loading, data] when fetchData() is called success',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => Right(testMovieList));
        return movieTopRatedCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetTopRatedMovies.execute());
      },
      expect: () => [
        MovieTopRatedState.loading(),
        MovieTopRatedState.data(testMovieList),
      ],
    );

    blocTest<MovieTopRatedCubit, MovieTopRatedState>(
      'Should emit state [loading, error] when fetchData() is error',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => Left(ServerFailure('error')));
        return movieTopRatedCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetTopRatedMovies.execute());
      },
      expect: () => [
        MovieTopRatedState.loading(),
        MovieTopRatedState.error('error')
      ],
    );
  });
}
