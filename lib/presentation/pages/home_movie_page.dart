import 'package:ditonton/common/constants.dart';
import 'package:ditonton/presentation/bloc/movie/now_playing/movie_now_playing_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/popular/movie_popular_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/top_rated/movie_top_rated_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/now_playing/tv_now_playing_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/popular/tv_popular_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/top_rated/tv_top_rated_cubit.dart';
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/movie_list_page.dart';
import 'package:ditonton/presentation/pages/search_movie_page.dart';
import 'package:ditonton/presentation/pages/search_tv_page.dart';
import 'package:ditonton/presentation/pages/tv_list_page.dart';
import 'package:ditonton/presentation/pages/watchlist_page.dart';
import 'package:ditonton/presentation/widgets/filler_view.dart';
import 'package:ditonton/presentation/widgets/movie_list.dart';
import 'package:ditonton/presentation/widgets/tv_list.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SelectedSection { movie, tv }

class HomeMoviePage extends StatefulWidget {
  const HomeMoviePage(
      {super.key, this.selectedSection = SelectedSection.movie});

  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();

  final selectedSection;
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  var _s;

  selectedSection({SelectedSection? section = null}) {
    if (section != null) _s = section;
    return _s ?? widget.selectedSection;
  }

  void getData() {
    switch (selectedSection()) {
      case SelectedSection.movie:
        context.read<MoviePopularCubit>().fetchData();
        context.read<MovieNowPlayingCubit>().fetchData();
        context.read<MovieTopRatedCubit>().fetchData();
        break;
      case SelectedSection.tv:
        context.read<TvPopularCubit>().fetchData();
        context.read<TvNowPlayingCubit>().fetchData();
        context.read<TvTopRatedCubit>().fetchData();
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() => getData());
  }

  @override
  Widget build(BuildContext context) {
    final tileMovieColors = selectedSection() == SelectedSection.movie
        ? kMikadoYellow
        : Colors.white;
    final tileTvColors =
        selectedSection() == SelectedSection.tv ? kMikadoYellow : Colors.white;

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              key: Key('select_movie'),
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              textColor: tileMovieColors,
              iconColor: tileMovieColors,
              onTap: () {
                setState(() {
                  selectedSection(section: SelectedSection.movie);
                  getData();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              key: Key('select_tv'),
              leading: Icon(Icons.tv),
              title: Text('TV'),
              textColor: tileTvColors,
              iconColor: tileTvColors,
              onTap: () {
                setState(() {
                  selectedSection(section: SelectedSection.tv);
                  getData();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
              },
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        key: Key('app_bar'),
        title: Text(selectedSection() == SelectedSection.movie
            ? 'Movies'
            : 'TV Series'),
        actions: [
          IconButton(
            onPressed: () {
              var args;
              switch (selectedSection()) {
                case SelectedSection.movie:
                  args = WatchlistType.movie;
                  break;
                case SelectedSection.tv:
                  args = WatchlistType.tv;
                  break;
              }
              Navigator.pushNamed(context, WatchlistPage.ROUTE_NAME,
                  arguments: args);
            },
            icon: Icon(Icons.bookmarks_outlined),
            tooltip: 'Watchlist',
          ),
          IconButton(
            onPressed: () {
              switch (selectedSection()) {
                case SelectedSection.movie:
                  Navigator.pushNamed(context, SearchMoviePage.ROUTE_NAME);
                  break;
                case SelectedSection.tv:
                  Navigator.pushNamed(context, SearchTvPage.ROUTE_NAME);
                  break;
              }
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSubHeading(
                title: 'Now Playing',
                onTap: () {
                  switch (selectedSection()) {
                    case SelectedSection.movie:
                      Navigator.pushNamed(context, MovieListPage.ROUTE_NAME,
                          arguments: MovieListType.playingNow);
                      break;
                    case SelectedSection.tv:
                      Navigator.pushNamed(context, TvListPage.ROUTE_NAME,
                          arguments: TvListType.playingNow);
                      break;
                  }
                },
              ),
              selectedSection() == SelectedSection.movie
                  ? BlocBuilder<MovieNowPlayingCubit, MovieNowPlayingState>(
                      builder: (context, state) {
                      return state.when(loading: () {
                        return Center(child: CircularProgressIndicator());
                      }, error: (msg) {
                        return Center(
                            key: Key('error_message'), child: Text(msg));
                      }, data: (data) {
                        return MovieList(data);
                      }, initial: () {
                        return FillerView();
                      });
                    })
                  : BlocBuilder<TvNowPlayingCubit, TvNowPlayingState>(
                      builder: (context, state) {
                      return state.when(loading: () {
                        return Center(child: CircularProgressIndicator());
                      }, error: (msg) {
                        return Center(
                            key: Key('error_message'), child: Text(msg));
                      }, data: (data) {
                        return TvList(data);
                      }, initial: () {
                        return FillerView();
                      });
                    }),
              _buildSubHeading(
                title: 'Popular',
                onTap: () {
                  switch (selectedSection()) {
                    case SelectedSection.movie:
                      Navigator.pushNamed(context, MovieListPage.ROUTE_NAME,
                          arguments: MovieListType.popular);
                      break;
                    case SelectedSection.tv:
                      Navigator.pushNamed(context, TvListPage.ROUTE_NAME,
                          arguments: TvListType.popular);
                      break;
                  }
                },
              ),
              selectedSection() == SelectedSection.movie
                  ? BlocBuilder<MoviePopularCubit, MoviePopularState>(
                      builder: (context, state) {
                      return state.when(loading: () {
                        return Center(child: CircularProgressIndicator());
                      }, error: (msg) {
                        return Center(
                            key: Key('error_message'), child: Text(msg));
                      }, data: (data) {
                        return MovieList(data);
                      }, initial: () {
                        return FillerView();
                      });
                    })
                  : BlocBuilder<TvPopularCubit, TvPopularState>(
                      builder: (context, state) {
                      return state.when(loading: () {
                        return Center(child: CircularProgressIndicator());
                      }, error: (msg) {
                        return Center(
                            key: Key('error_message'), child: Text(msg));
                      }, data: (data) {
                        return TvList(data);
                      }, initial: () {
                        return FillerView();
                      });
                    }),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () {
                  switch (selectedSection()) {
                    case SelectedSection.movie:
                      Navigator.pushNamed(context, MovieListPage.ROUTE_NAME,
                          arguments: MovieListType.topRated);
                      break;
                    case SelectedSection.tv:
                      Navigator.pushNamed(context, TvListPage.ROUTE_NAME,
                          arguments: TvListType.topRated);
                      break;
                  }
                },
              ),
              selectedSection() == SelectedSection.movie
                  ? BlocBuilder<MovieTopRatedCubit, MovieTopRatedState>(
                      builder: (context, state) {
                      return state.when(loading: () {
                        return Center(child: CircularProgressIndicator());
                      }, error: (msg) {
                        return Center(
                            key: Key('error_message'), child: Text(msg));
                      }, data: (data) {
                        return MovieList(data);
                      }, initial: () {
                        return FillerView();
                      });
                    })
                  : BlocBuilder<TvTopRatedCubit, TvTopRatedState>(
                      builder: (context, state) {
                      return state.when(loading: () {
                        return Center(child: CircularProgressIndicator());
                      }, error: (msg) {
                        return Center(
                            key: Key('error_message'), child: Text(msg));
                      }, data: (data) {
                        return TvList(data);
                      }, initial: () {
                        return FillerView();
                      });
                    }),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}
