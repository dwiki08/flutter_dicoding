import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/datasources/local/movie_local_data_source.dart';
import 'package:ditonton/data/datasources/remote/custom_http_client.dart';
import 'package:ditonton/data/datasources/remote/movie_remote_data_source.dart';
import 'package:ditonton/data/datasources/remote/tv_remote_data_source.dart';
import 'package:ditonton/data/repositories/movie_repository_impl.dart';
import 'package:ditonton/data/repositories/tv_repository_impl.dart';
import 'package:ditonton/domain/repositories/movie_repository.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';
import 'package:ditonton/domain/usecases/movie/get_movie_detail.dart';
import 'package:ditonton/domain/usecases/movie/get_movie_recommendations.dart';
import 'package:ditonton/domain/usecases/movie/get_now_playing_movies.dart';
import 'package:ditonton/domain/usecases/movie/get_popular_movies.dart';
import 'package:ditonton/domain/usecases/movie/get_top_rated_movies.dart';
import 'package:ditonton/domain/usecases/movie/get_watchlist_movies.dart';
import 'package:ditonton/domain/usecases/movie/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/movie/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/movie/save_watchlist.dart';
import 'package:ditonton/domain/usecases/movie/search_movies.dart';
import 'package:ditonton/domain/usecases/tv/get_now_playing_tv.dart';
import 'package:ditonton/domain/usecases/tv/get_popular_tv.dart';
import 'package:ditonton/domain/usecases/tv/get_top_rated_tv.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_detail.dart';
import 'package:ditonton/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:ditonton/domain/usecases/tv/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/tv/get_watchlist_tv.dart';
import 'package:ditonton/domain/usecases/tv/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/tv/save_watchlist.dart';
import 'package:ditonton/domain/usecases/tv/search_tv.dart';
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
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // external
  locator.registerLazySingleton(() => sslPinningClient());

  // data sources
  locator.registerLazySingletonAsync<MovieRemoteDataSource>(() async =>
      MovieRemoteDataSourceImpl(client: await locator<Future<Client>>()));
  locator.registerLazySingletonAsync<TvRemoteDataSource>(() async =>
      TvRemoteDataSourceImpl(client: await locator<Future<Client>>()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  await locator.isReady<MovieRemoteDataSource>();
  await locator.isReady<TvRemoteDataSource>();

  // cubit
  locator.registerFactory(() => MoviePopularCubit(getPopularMovies: locator()));
  locator.registerFactory(
      () => MovieNowPlayingCubit(getNowPlayingMovies: locator()));
  locator
      .registerFactory(() => MovieTopRatedCubit(getTopRatedMovies: locator()));
  locator.registerFactory(() => MovieSearchCubit(searchMovies: locator()));
  locator.registerFactory(() => MovieDetailCubit(
        getMovieDetail: locator(),
        getMovieRecommendations: locator(),
        getMovieWatchListStatus: locator(),
        saveMovieWatchlist: locator(),
        removeMovieWatchlist: locator(),
      ));
  locator.registerFactory(
      () => MovieWatchlistCubit(getWatchlistMovies: locator()));

  locator.registerFactory(() => TvPopularCubit(getPopularTv: locator()));
  locator.registerFactory(() => TvNowPlayingCubit(getNowPlayingTv: locator()));
  locator.registerFactory(() => TvTopRatedCubit(getTopRatedTv: locator()));
  locator.registerFactory(() => TvSearchCubit(searchTv: locator()));
  locator.registerFactory(() => TvDetailCubit(
      getTvDetail: locator(),
      getTvRecommendations: locator(),
      getTvWatchListStatus: locator(),
      saveTvWatchlist: locator(),
      removeTvWatchlist: locator()));
  locator.registerFactory(() => TvWatchlistCubit(getWatchlistTv: locator()));

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetMovieWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveMovieWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveMovieWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  locator.registerLazySingleton(() => GetNowPlayingTv(locator()));
  locator.registerLazySingleton(() => GetPopularTv(locator()));
  locator.registerLazySingleton(() => GetTopRatedTv(locator()));
  locator.registerLazySingleton(() => GetTvDetail(locator()));
  locator.registerLazySingleton(() => GetTvRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTv(locator()));
  locator.registerLazySingleton(() => GetTvWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveTvWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveTvWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistTv(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TvRepository>(
    () => TvRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
}
