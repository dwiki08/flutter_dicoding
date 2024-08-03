import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/movie_list_page.dart';
import 'package:ditonton/presentation/pages/search_movie_page.dart';
import 'package:ditonton/presentation/pages/search_tv_page.dart';
import 'package:ditonton/presentation/pages/tv_list_page.dart';
import 'package:ditonton/presentation/pages/watchlist_page.dart';
import 'package:ditonton/presentation/provider/movie_list_notifier.dart';
import 'package:ditonton/presentation/provider/tv_list_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_list.dart';
import 'package:ditonton/presentation/widgets/tv_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum SelectedSection { movie, tv }

class HomeMoviePage extends StatefulWidget {
  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  SelectedSection selectedSection = SelectedSection.movie;

  void getData() {
    switch (selectedSection) {
      case SelectedSection.movie:
        Provider.of<MovieListNotifier>(context, listen: false)
          ..fetchNowPlayingMovies()
          ..fetchPopularMovies()
          ..fetchTopRatedMovies();
        break;
      case SelectedSection.tv:
        Provider.of<TvListNotifier>(context, listen: false)
          ..fetchNowPlayingTv()
          ..fetchPopularTv()
          ..fetchTopRatedTv();
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
    final tileMovieColors =
        selectedSection == SelectedSection.movie ? kMikadoYellow : Colors.white;
    final tileTvColors =
        selectedSection == SelectedSection.tv ? kMikadoYellow : Colors.white;

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
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              textColor: tileMovieColors,
              iconColor: tileMovieColors,
              onTap: () {
                setState(() {
                  selectedSection = SelectedSection.movie;
                  getData();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.tv),
              title: Text('TV'),
              textColor: tileTvColors,
              iconColor: tileTvColors,
              onTap: () {
                setState(() {
                  selectedSection = SelectedSection.tv;
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
        title: Text(
            selectedSection == SelectedSection.movie ? 'Movies' : 'TV Series'),
        actions: [
          IconButton(
            onPressed: () {
              var args;
              switch (selectedSection) {
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
              switch (selectedSection) {
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
                  switch (selectedSection) {
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
              selectedSection == SelectedSection.movie
                  ? Consumer<MovieListNotifier>(
                      builder: (context, data, child) {
                      return _listMovieSection(
                          data.nowPlayingState, data.nowPlayingMovies);
                    })
                  : Consumer<TvListNotifier>(builder: (context, data, child) {
                      return _listTvSection(
                          data.nowPlayingState, data.nowPlayingTv);
                    }),
              _buildSubHeading(
                title: 'Popular',
                onTap: () {
                  switch (selectedSection) {
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
              selectedSection == SelectedSection.movie
                  ? Consumer<MovieListNotifier>(
                      builder: (context, data, child) {
                      return _listMovieSection(
                          data.popularMoviesState, data.popularMovies);
                    })
                  : Consumer<TvListNotifier>(builder: (context, data, child) {
                      return _listTvSection(
                          data.popularTvState, data.popularTv);
                    }),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () {
                  switch (selectedSection) {
                    case SelectedSection.movie:
                      Navigator.pushNamed(context, MovieListPage.ROUTE_NAME,
                          arguments: MovieListType.topRated);
                      break;
                    case SelectedSection.tv:
                      Navigator.pushNamed(context, TvListPage.ROUTE_NAME,
                          arguments: TvListType.playingNow);
                      break;
                  }
                },
              ),
              selectedSection == SelectedSection.movie
                  ? Consumer<MovieListNotifier>(
                      builder: (context, data, child) {
                      return _listMovieSection(
                          data.topRatedMoviesState, data.topRatedMovies);
                    })
                  : Consumer<TvListNotifier>(builder: (context, data, child) {
                      return _listTvSection(
                          data.topRatedTvState, data.topRatedTv);
                    }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listMovieSection(RequestState state, List<Movie> movies) {
    if (state == RequestState.Loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state == RequestState.Loaded) {
      return MovieList(movies);
    } else {
      return Text('Failed');
    }
  }

  Widget _listTvSection(RequestState state, List<Tv> movies) {
    if (state == RequestState.Loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state == RequestState.Loaded) {
      return TvList(movies);
    } else {
      return Text('Failed');
    }
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
