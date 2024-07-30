import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/movie/detail/movie_detail_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/now_playing/movie_now_playing_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/popular/movie_popular_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/search/movie_search_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/top_rated/movie_top_rated_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/watchlist/movie_watchlist_cubit.dart';

class MockMovieNowPlayingCubit extends MockCubit<MovieNowPlayingState>
    implements MovieNowPlayingCubit {}

class MockMoviePopularCubit extends MockCubit<MoviePopularState>
    implements MoviePopularCubit {}

class MockMovieTopRatedCubit extends MockCubit<MovieTopRatedState>
    implements MovieTopRatedCubit {}

class MockMovieDetailCubit extends MockCubit<MovieDetailState>
    implements MovieDetailCubit {}

class MockMovieSearchCubit extends MockCubit<MovieSearchState>
    implements MovieSearchCubit {}

class MockMovieWatchlistCubit extends MockCubit<MovieWatchlistState>
    implements MovieWatchlistCubit {}
