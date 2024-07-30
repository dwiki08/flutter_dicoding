import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/tv/now_playing/tv_now_playing_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/popular/tv_popular_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/top_rated/tv_top_rated_cubit.dart';
import 'package:ditonton/presentation/pages/tv_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';

class MockTvNowPlayingCubit extends MockCubit<TvNowPlayingState>
    implements TvNowPlayingCubit {}

class MockTvPopularCubit extends MockCubit<TvPopularState>
    implements TvPopularCubit {}

class MockTvTopRatedCubit extends MockCubit<TvTopRatedState>
    implements TvTopRatedCubit {}

void main() {
  late MockTvNowPlayingCubit mockNowPlayingCubit;
  late MockTvPopularCubit mockPopularCubit;
  late MockTvTopRatedCubit mockTopRatedCubit;

  setUp(() {
    mockNowPlayingCubit = MockTvNowPlayingCubit();
    mockPopularCubit = MockTvPopularCubit();
    mockTopRatedCubit = MockTvTopRatedCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvNowPlayingCubit>(
          create: (context) => mockNowPlayingCubit,
        ),
        BlocProvider<TvPopularCubit>(
          create: (context) => mockPopularCubit,
        ),
        BlocProvider<TvTopRatedCubit>(
          create: (context) => mockTopRatedCubit,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('Tv list Now Playing', () {
    testWidgets('Page should display filler view when empty data',
        (WidgetTester tester) async {
      when(() => mockNowPlayingCubit.state)
          .thenReturn(TvNowPlayingState.initial());
      when(() => mockNowPlayingCubit.fetchData()).thenAnswer((_) async => []);

      final viewFinder = find.byKey(Key('filler_view'));

      await tester.pumpWidget(
          _makeTestableWidget(TvListPage(tvListType: TvListType.playingNow)));

      expect(viewFinder, findsOneWidget);
    });

    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(() => mockNowPlayingCubit.state)
          .thenReturn(TvNowPlayingState.loading());
      when(() => mockNowPlayingCubit.fetchData()).thenAnswer((_) async => []);

      final progressBarFinder = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(
          _makeTestableWidget(TvListPage(tvListType: TvListType.playingNow)));

      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(() => mockNowPlayingCubit.state)
          .thenReturn(TvNowPlayingState.data(testTvList));
      when(() => mockNowPlayingCubit.fetchData()).thenAnswer((_) async => []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(
          _makeTestableWidget(TvListPage(tvListType: TvListType.playingNow)));

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => mockNowPlayingCubit.state)
          .thenReturn(TvNowPlayingState.error('error'));
      when(() => mockNowPlayingCubit.fetchData()).thenAnswer((_) async => []);

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(
          _makeTestableWidget(TvListPage(tvListType: TvListType.playingNow)));

      expect(textFinder, findsOneWidget);
    });
  });

  group('Tv list Popular', () {
    testWidgets('Page should display filler view when empty data',
        (WidgetTester tester) async {
      when(() => mockPopularCubit.state).thenReturn(TvPopularState.initial());
      when(() => mockPopularCubit.fetchData()).thenAnswer((_) async => []);

      final viewFinder = find.byKey(Key('filler_view'));

      await tester.pumpWidget(
          _makeTestableWidget(TvListPage(tvListType: TvListType.popular)));

      expect(viewFinder, findsOneWidget);
    });

    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(() => mockPopularCubit.state).thenReturn(TvPopularState.loading());
      when(() => mockPopularCubit.fetchData()).thenAnswer((_) async => []);

      final progressBarFinder = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(
          _makeTestableWidget(TvListPage(tvListType: TvListType.popular)));

      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(() => mockPopularCubit.state)
          .thenReturn(TvPopularState.data(testTvList));
      when(() => mockPopularCubit.fetchData()).thenAnswer((_) async => []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(
          _makeTestableWidget(TvListPage(tvListType: TvListType.popular)));

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => mockPopularCubit.state)
          .thenReturn(TvPopularState.error('error'));
      when(() => mockPopularCubit.fetchData()).thenAnswer((_) async => []);

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(
          _makeTestableWidget(TvListPage(tvListType: TvListType.popular)));

      expect(textFinder, findsOneWidget);
    });
  });

  group('Tv list Top Rated', () {
    testWidgets('Page should display filler view when empty data',
        (WidgetTester tester) async {
      when(() => mockTopRatedCubit.state).thenReturn(TvTopRatedState.initial());
      when(() => mockTopRatedCubit.fetchData()).thenAnswer((_) async => []);

      final viewFinder = find.byKey(Key('filler_view'));

      await tester.pumpWidget(
          _makeTestableWidget(TvListPage(tvListType: TvListType.topRated)));

      expect(viewFinder, findsOneWidget);
    });

    testWidgets('Page should display center progress bar when loading',
        (WidgetTester tester) async {
      when(() => mockTopRatedCubit.state).thenReturn(TvTopRatedState.loading());
      when(() => mockTopRatedCubit.fetchData()).thenAnswer((_) async => []);

      final progressBarFinder = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(
          _makeTestableWidget(TvListPage(tvListType: TvListType.topRated)));

      expect(progressBarFinder, findsOneWidget);
    });

    testWidgets('Page should display ListView when data is loaded',
        (WidgetTester tester) async {
      when(() => mockTopRatedCubit.state)
          .thenReturn(TvTopRatedState.data(testTvList));
      when(() => mockTopRatedCubit.fetchData()).thenAnswer((_) async => []);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(
          _makeTestableWidget(TvListPage(tvListType: TvListType.topRated)));

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Page should display text with message when Error',
        (WidgetTester tester) async {
      when(() => mockTopRatedCubit.state)
          .thenReturn(TvTopRatedState.error('error'));
      when(() => mockTopRatedCubit.fetchData()).thenAnswer((_) async => []);

      final textFinder = find.byKey(Key('error_message'));

      await tester.pumpWidget(
          _makeTestableWidget(TvListPage(tvListType: TvListType.topRated)));

      expect(textFinder, findsOneWidget);
    });
  });
}
