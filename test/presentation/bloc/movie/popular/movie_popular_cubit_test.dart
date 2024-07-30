import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/movie/get_popular_movies.dart';
import 'package:ditonton/presentation/bloc/movie/popular/movie_popular_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movie_popular_cubit_test.mocks.dart';

@GenerateMocks([GetPopularMovies])
void main() {
  late MoviePopularCubit moviePopularCubit;
  late MockGetPopularMovies mockGetPopularMovies;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    moviePopularCubit =
        MoviePopularCubit(getPopularMovies: mockGetPopularMovies);
  });

  group('fetchData()', () {
    blocTest<MoviePopularCubit, MoviePopularState>(
      'Should emit state [loading, data] when fetchData() is called success',
      build: () {
        when(mockGetPopularMovies.execute())
            .thenAnswer((_) async => Right(testMovieList));
        return moviePopularCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetPopularMovies.execute());
      },
      expect: () => [
        MoviePopularState.loading(),
        MoviePopularState.data(testMovieList),
      ],
    );

    blocTest<MoviePopularCubit, MoviePopularState>(
      'Should emit state [loading, error] when fetchData() is error',
      build: () {
        when(mockGetPopularMovies.execute())
            .thenAnswer((_) async => Left(ServerFailure('error')));
        return moviePopularCubit;
      },
      act: (cubit) => cubit.fetchData(),
      verify: (_) {
        verify(mockGetPopularMovies.execute());
      },
      expect: () => [
        MoviePopularState.loading(),
        MoviePopularState.error('error')
      ],
    );
  });
}
