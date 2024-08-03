import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/movie_list_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum MovieListType { playingNow, popular, topRated }

class MovieListPage extends StatefulWidget {
  static const ROUTE_NAME = '/movieListPage';

  final MovieListType movieListType;

  const MovieListPage({Key? key, required this.movieListType})
      : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  _title() {
    switch (widget.movieListType) {
      case MovieListType.playingNow:
        return 'Playing Now';
      case MovieListType.popular:
        return 'Popular';
      case MovieListType.topRated:
        return 'Top Rated';
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      switch (widget.movieListType) {
        case MovieListType.playingNow:
          context.read<MovieListNotifier>().fetchNowPlayingMovies();
          break;
        case MovieListType.popular:
          context.read<MovieListNotifier>().fetchPopularMovies();
          break;
        case MovieListType.topRated:
          context.read<MovieListNotifier>().fetchTopRatedMovies();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.movie_outlined),
            SizedBox(width: 8),
            Text(_title()),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<MovieListNotifier>(
          builder: (context, data, child) {
            var state;
            var list;
            switch (widget.movieListType) {
              case MovieListType.playingNow:
                state = data.nowPlayingState;
                list = data.nowPlayingMovies;
                break;
              case MovieListType.popular:
                state = data.popularMoviesState;
                list = data.popularMovies;
                break;
              case MovieListType.topRated:
                state = data.topRatedMoviesState;
                list = data.topRatedMovies;
                break;
            }
            if (state == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = list[index];
                  return MovieCard(movie);
                },
                itemCount: list.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
}
