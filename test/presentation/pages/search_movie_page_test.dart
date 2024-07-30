import 'package:ditonton/presentation/bloc/movie/search/movie_search_cubit.dart';
import 'package:ditonton/presentation/pages/search_movie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../mock/mock_movie_cubit.dart';

void main() {
  late MockMovieSearchCubit mockMovieSearchCubit;

  setUp(() {
    mockMovieSearchCubit = MockMovieSearchCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieSearchCubit>(
          create: (context) => mockMovieSearchCubit,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  final query = 'query';

  testWidgets('Page should display filler view when empty data',
      (WidgetTester tester) async {
    when(() => mockMovieSearchCubit.state)
        .thenReturn(MovieSearchState.initial());
    when(() => mockMovieSearchCubit.lastQuery).thenReturn(query);

    final viewFinder = find.byKey(Key('filler_view'));

    await tester.pumpWidget(_makeTestableWidget(SearchMoviePage()));

    expect(viewFinder, findsOneWidget);
  });

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockMovieSearchCubit.state)
        .thenReturn(MovieSearchState.loading());
    when(() => mockMovieSearchCubit.lastQuery).thenReturn(query);
    when(() => mockMovieSearchCubit.searchData(query))
        .thenAnswer((_) async => []);

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(SearchMoviePage()));

    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockMovieSearchCubit.state)
        .thenReturn(MovieSearchState.data(testMovieList));
    when(() => mockMovieSearchCubit.lastQuery).thenReturn(query);
    when(() => mockMovieSearchCubit.searchData(query))
        .thenAnswer((_) async => []);

    await tester.pumpWidget(_makeTestableWidget(SearchMoviePage()));

    final listViewFinder = find.byType(ListView);
    final textFieldFinder = find.byType(EditableText);

    await tester.enterText(textFieldFinder, query);
    tester.testTextInput.enterText(query);
    await tester.pump();

    expect(find.text(query), findsOneWidget);
    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (WidgetTester tester) async {
    when(() => mockMovieSearchCubit.state)
        .thenReturn(MovieSearchState.error('error'));
    when(() => mockMovieSearchCubit.lastQuery).thenReturn(query);
    when(() => mockMovieSearchCubit.searchData(query))
        .thenAnswer((_) async => []);

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(SearchMoviePage()));

    expect(textFinder, findsOneWidget);
  });
}
