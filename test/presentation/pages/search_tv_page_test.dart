import 'package:ditonton/presentation/bloc/tv/search/tv_search_cubit.dart';
import 'package:ditonton/presentation/pages/search_tv_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../mock/mock_tv_cubit.dart';

void main() {
  late MockTvSearchCubit mockTvSearchCubit;

  setUp(() {
    mockTvSearchCubit = MockTvSearchCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvSearchCubit>(
          create: (context) => mockTvSearchCubit,
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
    when(() => mockTvSearchCubit.state).thenReturn(TvSearchState.initial());
    when(() => mockTvSearchCubit.lastQuery).thenReturn(query);

    final viewFinder = find.byKey(Key('filler_view'));

    await tester.pumpWidget(_makeTestableWidget(SearchTvPage()));

    expect(viewFinder, findsOneWidget);
  });

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockTvSearchCubit.state).thenReturn(TvSearchState.loading());
    when(() => mockTvSearchCubit.lastQuery).thenReturn(query);
    when(() => mockTvSearchCubit.searchData(query)).thenAnswer((_) async => []);

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(SearchTvPage()));

    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockTvSearchCubit.state)
        .thenReturn(TvSearchState.data(testTvList));
    when(() => mockTvSearchCubit.lastQuery).thenReturn(query);
    when(() => mockTvSearchCubit.searchData(query)).thenAnswer((_) async => []);

    await tester.pumpWidget(_makeTestableWidget(SearchTvPage()));

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
    when(() => mockTvSearchCubit.state)
        .thenReturn(TvSearchState.error('error'));
    when(() => mockTvSearchCubit.lastQuery).thenReturn(query);
    when(() => mockTvSearchCubit.searchData(query)).thenAnswer((_) async => []);

    final textFinder = find.byKey(Key('error_message'));

    await tester.pumpWidget(_makeTestableWidget(SearchTvPage()));

    expect(textFinder, findsOneWidget);
  });
}
