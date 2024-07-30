import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/movie/detail/movie_detail_cubit.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../mock/mock_movie_cubit.dart';

void main() {
  late MockMovieDetailCubit mockCubit;

  setUp(() {
    mockCubit = MockMovieDetailCubit();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MovieDetailCubit>(
            create: (context) => mockCubit,
          ),
        ],
        child: MaterialApp(
          home: body,
        ));
  }

  int id = 1;

  testWidgets('Page should display filler view when empty',
      (WidgetTester tester) async {
    when(() => mockCubit.state).thenReturn(MovieDetailState.initial());
    when(() => mockCubit.getData(id)).thenAnswer((_) async => []);

    final progressBarFinder = find.byKey(Key('filler_view'));

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockCubit.state).thenReturn(MovieDetailState.loading());
    when(() => mockCubit.getData(id)).thenAnswer((_) async => []);

    final progressBarFinder = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display text message when error',
      (WidgetTester tester) async {
    when(() => mockCubit.state).thenReturn(MovieDetailState.error('error'));
    when(() => mockCubit.getData(id)).thenAnswer((_) async => []);

    final textMsg = find.byType(Text);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(textMsg, findsOneWidget);
  });

  testWidgets('Page should display detail page when loaded',
      (WidgetTester tester) async {
    when(() => mockCubit.state).thenReturn(MovieDetailState.data(
      detail: testMovieDetail,
      recommendations: testMovieList,
      isAddedWatchlist: true,
    ));
    when(() => mockCubit.getData(id)).thenAnswer((_) async => []);

    final textMsg = find.byType(SafeArea);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(textMsg, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockCubit.state).thenReturn(MovieDetailState.data(
      detail: testMovieDetail,
      recommendations: testMovieList,
      isAddedWatchlist: false,
    ));
    when(() => mockCubit.getData(id)).thenAnswer((_) async => []);

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display check icon when movie is added to watchlist',
      (WidgetTester tester) async {
    when(() => mockCubit.state).thenReturn(MovieDetailState.data(
      detail: testMovieDetail,
      recommendations: testMovieList,
      isAddedWatchlist: true,
    ));
    when(() => mockCubit.getData(id)).thenAnswer((_) async => []);

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    whenListen(
      mockCubit,
      Stream.fromIterable([
        MovieDetailState.data(
          detail: testMovieDetail,
          recommendations: testMovieList,
          isAddedWatchlist: true,
        ),
      ]),
      initialState: MovieDetailState.data(
        detail: testMovieDetail,
        recommendations: testMovieList,
        isAddedWatchlist: false,
      ),
    );
    when(() => mockCubit.getData(id)).thenAnswer((_) async => []);
    when(() => mockCubit.addWatchlist(testMovieDetail))
        .thenAnswer((_) async => []);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    final watchlistButton = find.byType(ElevatedButton);
    final snackBar = find.byType(SnackBar);
    final textMsg = find.text(MovieDetailCubit.watchlistAddSuccessMessage);

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byIcon(Icons.check), findsOneWidget);

    expect(snackBar, findsOneWidget);
    expect(textMsg, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when removed from watchlist',
      (WidgetTester tester) async {
    whenListen(
      mockCubit,
      Stream.fromIterable([
        MovieDetailState.data(
          detail: testMovieDetail,
          recommendations: testMovieList,
          isAddedWatchlist: false,
        ),
      ]),
      initialState: MovieDetailState.data(
        detail: testMovieDetail,
        recommendations: testMovieList,
        isAddedWatchlist: true,
      ),
    );
    when(() => mockCubit.getData(id)).thenAnswer((_) async => []);
    when(() => mockCubit.removeWatchlist(testMovieDetail))
        .thenAnswer((_) async => []);

    await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

    final watchlistButton = find.byType(ElevatedButton);
    final snackBar = find.byType(SnackBar);
    final textMsg = find.text(MovieDetailCubit.watchlistRemoveSuccessMessage);

    expect(find.byIcon(Icons.check), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byIcon(Icons.add), findsOneWidget);

    expect(snackBar, findsOneWidget);
    expect(textMsg, findsOneWidget);
  });
}
