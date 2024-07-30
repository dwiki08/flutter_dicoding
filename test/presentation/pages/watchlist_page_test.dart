import 'package:ditonton/presentation/bloc/movie/watchlist/movie_watchlist_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/watchlist/tv_watchlist_cubit.dart';
import 'package:ditonton/presentation/pages/watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../mock/mock_movie_cubit.dart';
import '../../mock/mock_tv_cubit.dart';

void main() {
  late MockMovieWatchlistCubit mockMovieWatchlistCubit;
  late MockTvWatchlistCubit mockTvWatchlistCubit;

  setUp(() {
    mockMovieWatchlistCubit = MockMovieWatchlistCubit();
    mockTvWatchlistCubit = MockTvWatchlistCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieWatchlistCubit>(
          create: (context) => mockMovieWatchlistCubit,
        ),
        BlocProvider<TvWatchlistCubit>(
          create: (context) => mockTvWatchlistCubit,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('Movie watchlist', () {
    testWidgets('Page should display filler view when empty data',
        (WidgetTester tester) async {
      when(() => mockMovieWatchlistCubit.state)
          .thenReturn(MovieWatchlistState.initial());
      when(() => mockMovieWatchlistCubit.fetchData())
          .thenAnswer((_) async => []);

      final viewFinder = find.byKey(Key('filler_view'));

      await tester.pumpWidget(_makeTestableWidget(WatchlistPage(
        type: WatchlistType.movie,
      )));

      expect(viewFinder, findsOneWidget);
    });

    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(() => mockMovieWatchlistCubit.state)
          .thenReturn(MovieWatchlistState.loading());
      when(() => mockMovieWatchlistCubit.fetchData())
          .thenAnswer((_) async => []);

      final progressBarFinder = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(
          _makeTestableWidget(WatchlistPage(type: WatchlistType.movie)));

      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(() => mockMovieWatchlistCubit.state)
          .thenReturn(MovieWatchlistState.data(testMovieList));
      when(() => mockMovieWatchlistCubit.fetchData())
          .thenAnswer((_) async => []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(
          _makeTestableWidget(WatchlistPage(type: WatchlistType.movie)));

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => mockMovieWatchlistCubit.state)
          .thenReturn(MovieWatchlistState.error('error'));
      when(() => mockMovieWatchlistCubit.fetchData())
          .thenAnswer((_) async => []);

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(
          _makeTestableWidget(WatchlistPage(type: WatchlistType.movie)));

      expect(textFinder, findsOneWidget);
    });
  });

  group('TV watchlist', () {
    testWidgets('Page should display filler view when empty data',
        (WidgetTester tester) async {
      when(() => mockTvWatchlistCubit.state)
          .thenReturn(TvWatchlistState.initial());
      when(() => mockTvWatchlistCubit.fetchData()).thenAnswer((_) async => []);

      final viewFinder = find.byKey(Key('filler_view'));

      await tester.pumpWidget(_makeTestableWidget(WatchlistPage(
        type: WatchlistType.tv,
      )));

      expect(viewFinder, findsOneWidget);
    });

    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(() => mockTvWatchlistCubit.state)
          .thenReturn(TvWatchlistState.loading());
      when(() => mockTvWatchlistCubit.fetchData()).thenAnswer((_) async => []);

      final progressBarFinder = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(
          _makeTestableWidget(WatchlistPage(type: WatchlistType.tv)));

      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(() => mockTvWatchlistCubit.state)
          .thenReturn(TvWatchlistState.data(testTvList));
      when(() => mockTvWatchlistCubit.fetchData()).thenAnswer((_) async => []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(
          _makeTestableWidget(WatchlistPage(type: WatchlistType.tv)));

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => mockTvWatchlistCubit.state)
          .thenReturn(TvWatchlistState.error('error'));
      when(() => mockTvWatchlistCubit.fetchData()).thenAnswer((_) async => []);

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(
          _makeTestableWidget(WatchlistPage(type: WatchlistType.tv)));

      expect(textFinder, findsOneWidget);
    });
  });
}
