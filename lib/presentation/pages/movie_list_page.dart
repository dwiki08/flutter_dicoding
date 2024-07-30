import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/bloc/movie/now_playing/movie_now_playing_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/popular/movie_popular_cubit.dart';
import 'package:ditonton/presentation/bloc/movie/top_rated/movie_top_rated_cubit.dart';
import 'package:ditonton/presentation/widgets/filler_view.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          context.read<MovieNowPlayingCubit>().fetchData();
          break;
        case MovieListType.popular:
          context.read<MoviePopularCubit>().fetchData();
          break;
        case MovieListType.topRated:
          context.read<MovieTopRatedCubit>().fetchData();
          break;
      }
    });
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  _error(String msg) {
    return Center(key: Key('error_message'), child: Text(msg));
  }

  _data(List<Movie> data) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final movie = data[index];
        return MovieCard(movie);
      },
      itemCount: data.length,
    );
  }

  _initial() {
    return FillerView();
  }

  Widget _body() {
    switch (widget.movieListType) {
      case MovieListType.playingNow:
        return BlocBuilder<MovieNowPlayingCubit, MovieNowPlayingState>(
          builder: (context, state) {
            return state.when(loading: () {
              return _loading();
            }, error: (msg) {
              return _error(msg);
            }, data: (data) {
              return _data(data);
            }, initial: () {
              return _initial();
            });
          },
        );
      case MovieListType.popular:
        return BlocBuilder<MoviePopularCubit, MoviePopularState>(
          builder: (context, state) {
            return state.when(loading: () {
              return _loading();
            }, error: (msg) {
              return _error(msg);
            }, data: (data) {
              return _data(data);
            }, initial: () {
              return _initial();
            });
          },
        );
      case MovieListType.topRated:
        return BlocBuilder<MovieTopRatedCubit, MovieTopRatedState>(
          builder: (context, state) {
            return state.when(loading: () {
              return _loading();
            }, error: (msg) {
              return _error(msg);
            }, data: (data) {
              return _data(data);
            }, initial: () {
              return _initial();
            });
          },
        );
    }
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
        child: _body(),
      ),
    );
  }
}
