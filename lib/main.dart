import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:ditonton/presentation/bloc/movie/detail/movie_detail_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/now_playing/movie_now_playing_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/popular/movie_popular_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/search/movie_search_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/top_rated/movie_top_rated_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/watchlist/movie_watchlist_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/detail/tv_detail_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/now_playing/tv_now_playing_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/popular/tv_popular_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/search/tv_search_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/top_rated/tv_top_rated_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/watchlist/tv_watchlist_cubit.dart';
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/pages/movie_detail_page.dart';
import 'package:ditonton/presentation/pages/movie_list_page.dart';
import 'package:ditonton/presentation/pages/search_movie_page.dart';
import 'package:ditonton/presentation/pages/search_tv_page.dart';
import 'package:ditonton/presentation/pages/tv_detail_page.dart';
import 'package:ditonton/presentation/pages/tv_list_page.dart';
import 'package:ditonton/presentation/pages/watchlist_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<MoviePopularCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieTopRatedCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieNowPlayingCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieSearchCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieDetailCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MovieWatchlistCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvPopularCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvTopRatedCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvNowPlayingCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSearchCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvDetailCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvWatchlistCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case MovieListPage.ROUTE_NAME:
              return CupertinoPageRoute(
                  builder: (_) => MovieListPage(
                        movieListType: settings.arguments as MovieListType,
                      ));
            case TvListPage.ROUTE_NAME:
              return CupertinoPageRoute(
                  builder: (_) => TvListPage(
                        tvListType: settings.arguments as TvListType,
                      ));
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case TvDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvDetailPage(id: id),
                settings: settings,
              );
            case SearchMoviePage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchMoviePage());
            case SearchTvPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchTvPage());
            case WatchlistPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) {
                return WatchlistPage(type: settings.arguments as WatchlistType);
              });
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
