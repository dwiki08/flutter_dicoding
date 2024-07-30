import 'package:ditonton/presentation/bloc/movie/now_playing/movie_now_playing_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/popular/movie_popular_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/top_rated/movie_top_rated_cubit.dart';
import 'package:ditonton/presentation/pages/movie_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../mock/mock_movie_cubit.dart';

void main() {
  late MockMovieNowPlayingCubit mockNowPlayingCubit;
  late MockMoviePopularCubit mockPopularCubit;
  late MockMovieTopRatedCubit mockTopRatedCubit;

  setUp(() {
    mockNowPlayingCubit = MockMovieNowPlayingCubit();
    mockPopularCubit = MockMoviePopularCubit();
    mockTopRatedCubit = MockMovieTopRatedCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MovieNowPlayingCubit>(
            create: (context) => mockNowPlayingCubit,
          ),
          BlocProvider<MoviePopularCubit>(
            create: (context) => mockPopularCubit,
          ),
          BlocProvider<MovieTopRatedCubit>(
            create: (context) => mockTopRatedCubit,
          ),
        ],
        child: MaterialApp(
          home: body,
        ));
  }

  group('Movie list Now Playing', () {
    testWidgets('Page should display filler view when empty data',
        (WidgetTester tester) async {
      when(() => mockNowPlayingCubit.state)
          .thenReturn(MovieNowPlayingState.initial());
      when(() => mockNowPlayingCubit.fetchData()).thenAnswer((_) async => []);

      final viewFinder = find.byKey(Key('filler_view'));

      await tester.pumpWidget(_makeTestableWidget(
          MovieListPage(movieListType: MovieListType.playingNow)));

      expect(viewFinder, findsOneWidget);
    });

    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(() => mockNowPlayingCubit.state)
          .thenReturn(MovieNowPlayingState.loading());
      when(() => mockNowPlayingCubit.fetchData()).thenAnswer((_) async => []);

      final progressBarFinder = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(
          MovieListPage(movieListType: MovieListType.playingNow)));

      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(() => mockNowPlayingCubit.state)
          .thenReturn(MovieNowPlayingState.data(testMovieList));
      when(() => mockNowPlayingCubit.fetchData()).thenAnswer((_) async => []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(
          MovieListPage(movieListType: MovieListType.playingNow)));

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => mockNowPlayingCubit.state)
          .thenReturn(MovieNowPlayingState.error('error'));
      when(() => mockNowPlayingCubit.fetchData()).thenAnswer((_) async => []);

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget(
          MovieListPage(movieListType: MovieListType.playingNow)));

      expect(textFinder, findsOneWidget);
    });
  });

  group('Movie list Popular', () {
    testWidgets('Page should display filler view when empty data',
        (WidgetTester tester) async {
      when(() => mockPopularCubit.state)
          .thenReturn(MoviePopularState.initial());
      when(() => mockPopularCubit.fetchData()).thenAnswer((_) async => []);

      final viewFinder = find.byKey(Key('filler_view'));

      await tester.pumpWidget(_makeTestableWidget(
          MovieListPage(movieListType: MovieListType.popular)));

      expect(viewFinder, findsOneWidget);
    });

    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(() => mockPopularCubit.state)
          .thenReturn(MoviePopularState.loading());
      when(() => mockPopularCubit.fetchData()).thenAnswer((_) async => []);

      final progressBarFinder = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(
          MovieListPage(movieListType: MovieListType.popular)));

      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(() => mockPopularCubit.state)
          .thenReturn(MoviePopularState.data(testMovieList));
      when(() => mockPopularCubit.fetchData()).thenAnswer((_) async => []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(
          MovieListPage(movieListType: MovieListType.popular)));

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => mockPopularCubit.state)
          .thenReturn(MoviePopularState.error('error'));
      when(() => mockPopularCubit.fetchData()).thenAnswer((_) async => []);

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget(
          MovieListPage(movieListType: MovieListType.popular)));

      expect(textFinder, findsOneWidget);
    });
  });

  group('Movie list Top Rated', () {
    testWidgets('Page should display filler view when empty data',
        (WidgetTester tester) async {
      when(() => mockTopRatedCubit.state)
          .thenReturn(MovieTopRatedState.initial());
      when(() => mockTopRatedCubit.fetchData()).thenAnswer((_) async => []);

      final viewFinder = find.byKey(Key('filler_view'));

      await tester.pumpWidget(_makeTestableWidget(
          MovieListPage(movieListType: MovieListType.topRated)));

      expect(viewFinder, findsOneWidget);
    });

    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(() => mockTopRatedCubit.state)
          .thenReturn(MovieTopRatedState.loading());
      when(() => mockTopRatedCubit.fetchData()).thenAnswer((_) async => []);

      final progressBarFinder = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(
          MovieListPage(movieListType: MovieListType.topRated)));

      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(() => mockTopRatedCubit.state)
          .thenReturn(MovieTopRatedState.data(testMovieList));
      when(() => mockTopRatedCubit.fetchData()).thenAnswer((_) async => []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(
          MovieListPage(movieListType: MovieListType.topRated)));

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => mockTopRatedCubit.state)
          .thenReturn(MovieTopRatedState.error('error'));
      when(() => mockTopRatedCubit.fetchData()).thenAnswer((_) async => []);

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget(
          MovieListPage(movieListType: MovieListType.topRated)));

      expect(textFinder, findsOneWidget);
    });
  });
}
