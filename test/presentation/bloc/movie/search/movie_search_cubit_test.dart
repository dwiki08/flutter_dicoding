import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/movie/search_movies.dart';
import 'package:ditonton/presentation/bloc/movie/search/movie_search_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'movie_search_cubit_test.mocks.dart';

@GenerateMocks([SearchMovies])
void main() {
  late MovieSearchCubit movieSearchCubit;
  late MockSearchMovies mockSearchMovies;

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    movieSearchCubit = MovieSearchCubit(searchMovies: mockSearchMovies);
  });

  group('fetchData()', () {
    final query = 'query';

    blocTest<MovieSearchCubit, MovieSearchState>(
      'Should emit state [loading, data] when searchData(query) is called success',
      build: () {
        when(mockSearchMovies.execute(any))
            .thenAnswer((_) async => Right(testMovieList));
        return movieSearchCubit;
      },
      act: (cubit) => cubit.searchData(query),
      verify: (_) {
        verify(mockSearchMovies.execute(any));
      },
      expect: () => [
        MovieSearchState.loading(),
        MovieSearchState.data(testMovieList),
      ],
    );

    blocTest<MovieSearchCubit, MovieSearchState>(
      'Should emit state [loading, error] when searchData(query) is error',
      build: () {
        when(mockSearchMovies.execute(any))
            .thenAnswer((_) async => Left(ServerFailure('error')));
        return movieSearchCubit;
      },
      act: (cubit) => cubit.searchData(query),
      verify: (_) {
        verify(mockSearchMovies.execute(any));
      },
      expect: () => [
        MovieSearchState.loading(),
        MovieSearchState.error('error'),
      ],
    );

    test('Should return lastQuery when searchData(query) is called', () async {
      when(mockSearchMovies.execute(query))
          .thenAnswer((_) async => Right(testMovieList));
      await movieSearchCubit.searchData(query);
      verify(mockSearchMovies.execute(query));
      expect(movieSearchCubit.lastQuery, query);
    });
  });
}
