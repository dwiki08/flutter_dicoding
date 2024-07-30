import 'package:ditonton/presentation/bloc/movie/now_playing/movie_now_playing_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/popular/movie_popular_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/top_rated/movie_top_rated_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/now_playing/tv_now_playing_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/popular/tv_popular_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/top_rated/tv_top_rated_cubit.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../mock/mock_movie_cubit.dart';
import '../../mock/mock_navigation.dart';
import '../../mock/mock_tv_cubit.dart';

void main() {
  late MockMovieNowPlayingCubit mockMovieNowPlayingCubit;
  late MockMoviePopularCubit mockMoviePopularCubit;
  late MockMovieTopRatedCubit mockMovieTopRatedCubit;
  late MockTvNowPlayingCubit mockTvNowPlayingCubit;
  late MockTvPopularCubit mockTvPopularCubit;
  late MockTvTopRatedCubit mockTvTopRatedCubit;
  late MockNavigatorObserver mockObserver;

  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });

  setUp(() {
    mockObserver = MockNavigatorObserver();
    mockMovieNowPlayingCubit = MockMovieNowPlayingCubit();
    mockMoviePopularCubit = MockMoviePopularCubit();
    mockMovieTopRatedCubit = MockMovieTopRatedCubit();
    mockTvNowPlayingCubit = MockTvNowPlayingCubit();
    mockTvPopularCubit = MockTvPopularCubit();
    mockTvTopRatedCubit = MockTvTopRatedCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MovieNowPlayingCubit>(
            create: (context) => mockMovieNowPlayingCubit,
          ),
          BlocProvider<MoviePopularCubit>(
            create: (context) => mockMoviePopularCubit,
          ),
          BlocProvider<MovieTopRatedCubit>(
            create: (context) => mockMovieTopRatedCubit,
          ),
          BlocProvider<TvNowPlayingCubit>(
            create: (context) => mockTvNowPlayingCubit,
          ),
          BlocProvider<TvPopularCubit>(
            create: (context) => mockTvPopularCubit,
          ),
          BlocProvider<TvTopRatedCubit>(
            create: (context) => mockTvTopRatedCubit,
          ),
        ],
        child: MaterialApp(
          navigatorObservers: [mockObserver],
          home: body,
        ));
  }

  group('Movie', () {
    testWidgets('Page should display filler view when empty data',
        (WidgetTester tester) async {
      when(() => mockMoviePopularCubit.state)
          .thenReturn(MoviePopularState.initial());
      when(() => mockMovieNowPlayingCubit.state)
          .thenReturn(MovieNowPlayingState.initial());
      when(() => mockMovieTopRatedCubit.state)
          .thenReturn(MovieTopRatedState.initial());
      when(() => mockMoviePopularCubit.fetchData()).thenAnswer((_) async => []);
      when(() => mockMovieNowPlayingCubit.fetchData())
          .thenAnswer((_) async => []);
      when(() => mockMovieTopRatedCubit.fetchData())
          .thenAnswer((_) async => []);

      final viewFinder = find.byKey(Key('filler_view'));
      final appBar = find.text('Movies');

      await tester.pumpWidget(_makeTestableWidget(HomeMoviePage()));

      expect(appBar, findsWidgets);
      expect(viewFinder, findsAtLeast(3));
    });

    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(() => mockMoviePopularCubit.state)
          .thenReturn(MoviePopularState.loading());
      when(() => mockMovieNowPlayingCubit.state)
          .thenReturn(MovieNowPlayingState.loading());
      when(() => mockMovieTopRatedCubit.state)
          .thenReturn(MovieTopRatedState.loading());
      when(() => mockMoviePopularCubit.fetchData()).thenAnswer((_) async => []);
      when(() => mockMovieNowPlayingCubit.fetchData())
          .thenAnswer((_) async => []);
      when(() => mockMovieTopRatedCubit.fetchData())
          .thenAnswer((_) async => []);

      final progressBarFinder = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(HomeMoviePage()));

      expect(progressBarFinder, findsAtLeast(3));
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(() => mockMoviePopularCubit.state)
          .thenReturn(MoviePopularState.data(testMovieList));
      when(() => mockMovieNowPlayingCubit.state)
          .thenReturn(MovieNowPlayingState.data(testMovieList));
      when(() => mockMovieTopRatedCubit.state)
          .thenReturn(MovieTopRatedState.data(testMovieList));
      when(() => mockMoviePopularCubit.fetchData()).thenAnswer((_) async => []);
      when(() => mockMovieNowPlayingCubit.fetchData())
          .thenAnswer((_) async => []);
      when(() => mockMovieTopRatedCubit.fetchData())
          .thenAnswer((_) async => []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(HomeMoviePage()));

      expect(listViewFinder, findsAtLeast(3));
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => mockMoviePopularCubit.state)
          .thenReturn(MoviePopularState.error('error'));
      when(() => mockMovieNowPlayingCubit.state)
          .thenReturn(MovieNowPlayingState.error('error'));
      when(() => mockMovieTopRatedCubit.state)
          .thenReturn(MovieTopRatedState.error('error'));
      when(() => mockMoviePopularCubit.fetchData()).thenAnswer((_) async => []);
      when(() => mockMovieNowPlayingCubit.fetchData())
          .thenAnswer((_) async => []);
      when(() => mockMovieTopRatedCubit.fetchData())
          .thenAnswer((_) async => []);

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget(HomeMoviePage()));

      expect(textFinder, findsAtLeast(3));
    });
  });

  group('TV', () {
    testWidgets('Page should display filler view when empty data',
        (WidgetTester tester) async {
      when(() => mockTvPopularCubit.state).thenReturn(TvPopularState.initial());
      when(() => mockTvNowPlayingCubit.state)
          .thenReturn(TvNowPlayingState.initial());
      when(() => mockTvTopRatedCubit.state)
          .thenReturn(TvTopRatedState.initial());
      when(() => mockTvPopularCubit.fetchData()).thenAnswer((_) async => []);
      when(() => mockTvNowPlayingCubit.fetchData()).thenAnswer((_) async => []);
      when(() => mockTvTopRatedCubit.fetchData()).thenAnswer((_) async => []);

      final viewFinder = find.byKey(Key('filler_view'));

      await tester.pumpWidget(_makeTestableWidget(HomeMoviePage(
        selectedSection: SelectedSection.tv,
      )));

      expect(viewFinder, findsAtLeast(3));
    });
    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(() => mockTvPopularCubit.state).thenReturn(TvPopularState.loading());
      when(() => mockTvNowPlayingCubit.state)
          .thenReturn(TvNowPlayingState.loading());
      when(() => mockTvTopRatedCubit.state)
          .thenReturn(TvTopRatedState.loading());
      when(() => mockTvPopularCubit.fetchData()).thenAnswer((_) async => []);
      when(() => mockTvNowPlayingCubit.fetchData()).thenAnswer((_) async => []);
      when(() => mockTvTopRatedCubit.fetchData()).thenAnswer((_) async => []);

      final progressBarFinder = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(HomeMoviePage(
        selectedSection: SelectedSection.tv,
      )));

      expect(progressBarFinder, findsAtLeast(3));
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(() => mockTvPopularCubit.state)
          .thenReturn(TvPopularState.data(testTvList));
      when(() => mockTvNowPlayingCubit.state)
          .thenReturn(TvNowPlayingState.data(testTvList));
      when(() => mockTvTopRatedCubit.state)
          .thenReturn(TvTopRatedState.data(testTvList));
      when(() => mockTvPopularCubit.fetchData()).thenAnswer((_) async => []);
      when(() => mockTvNowPlayingCubit.fetchData()).thenAnswer((_) async => []);
      when(() => mockTvTopRatedCubit.fetchData()).thenAnswer((_) async => []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(HomeMoviePage(
        selectedSection: SelectedSection.tv,
      )));

      expect(listViewFinder, findsAtLeast(3));
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => mockTvPopularCubit.state)
          .thenReturn(TvPopularState.error('error'));
      when(() => mockTvNowPlayingCubit.state)
          .thenReturn(TvNowPlayingState.error('error'));
      when(() => mockTvTopRatedCubit.state)
          .thenReturn(TvTopRatedState.error('error'));
      when(() => mockTvPopularCubit.fetchData()).thenAnswer((_) async => []);
      when(() => mockTvNowPlayingCubit.fetchData()).thenAnswer((_) async => []);
      when(() => mockTvTopRatedCubit.fetchData()).thenAnswer((_) async => []);

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget(HomeMoviePage(
        selectedSection: SelectedSection.tv,
      )));

      expect(textFinder, findsAtLeast(3));
    });
  });
}
