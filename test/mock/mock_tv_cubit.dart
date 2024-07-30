import 'package:bloc_test/bloc_test.dart';
import 'package:ditonton/presentation/bloc/tv/detail/tv_detail_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/now_playing/tv_now_playing_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/popular/tv_popular_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/search/tv_search_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/top_rated/tv_top_rated_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/watchlist/tv_watchlist_cubit.dart';

class MockTvNowPlayingCubit extends MockCubit<TvNowPlayingState>
    implements TvNowPlayingCubit {}

class MockTvPopularCubit extends MockCubit<TvPopularState>
    implements TvPopularCubit {}

class MockTvTopRatedCubit extends MockCubit<TvTopRatedState>
    implements TvTopRatedCubit {}

class MockTvDetailCubit extends MockCubit<TvDetailState>
    implements TvDetailCubit {}

class MockTvSearchCubit extends MockCubit<TvSearchState>
    implements TvSearchCubit {}

class MockTvWatchlistCubit extends MockCubit<TvWatchlistState>
    implements TvWatchlistCubit {}
