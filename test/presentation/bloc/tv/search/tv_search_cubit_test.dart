import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/usecases/tv/search_tv.dart';
import 'package:ditonton/presentation/bloc/tv/search/tv_search_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import 'tv_search_cubit_test.mocks.dart';

@GenerateMocks([SearchTv])
void main() {
  late TvSearchCubit tvSearchCubit;
  late MockSearchTv mockSearchTv;

  setUp(() {
    mockSearchTv = MockSearchTv();
    tvSearchCubit = TvSearchCubit(searchTv: mockSearchTv);
  });

  group('fetchData()', () {
    final query = 'query';

    blocTest<TvSearchCubit, TvSearchState>(
      'Should emit state [loading, data] when searchData(query) is called success',
      build: () {
        when(mockSearchTv.execute(any))
            .thenAnswer((_) async => Right(testTvList));
        return tvSearchCubit;
      },
      act: (cubit) => cubit.searchData(query),
      verify: (_) {
        verify(mockSearchTv.execute(any));
      },
      expect: () => [
        TvSearchState.loading(),
        TvSearchState.data(testTvList),
      ],
    );

    blocTest<TvSearchCubit, TvSearchState>(
      'Should emit state [loading, error] when searchData(query) is error',
      build: () {
        when(mockSearchTv.execute(any))
            .thenAnswer((_) async => Left(ServerFailure('error')));
        return tvSearchCubit;
      },
      act: (cubit) => cubit.searchData(query),
      verify: (_) {
        verify(mockSearchTv.execute(any));
      },
      expect: () => [
        TvSearchState.loading(),
        TvSearchState.error('error'),
      ],
    );

    test('Should return lastQuery when searchData(query) is called', () async {
      when(mockSearchTv.execute(query))
          .thenAnswer((_) async => Right(testTvList));
      await tvSearchCubit.searchData(query);
      verify(mockSearchTv.execute(query));
      expect(tvSearchCubit.lastQuery, query);
    });
  });
}
