import 'package:ditonton/common/utils.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/presentation/bloc/movie/watchlist/movie_watchlist_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/watchlist/tv_watchlist_cubit.dart';
import 'package:ditonton/presentation/widgets/filler_view.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:ditonton/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum WatchlistType { movie, tv }

class WatchlistPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist';

  final WatchlistType type;

  const WatchlistPage({Key? key, required this.type}) : super(key: key);

  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> with RouteAware {
  _fetchData() {
    switch (widget.type) {
      case WatchlistType.movie:
        context.read<MovieWatchlistCubit>().fetchData();
        break;
      case WatchlistType.tv:
        context.read<TvWatchlistCubit>().fetchData();
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _fetchData();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    _loading() {
      return Center(child: CircularProgressIndicator());
    }

    _error(String msg) {
      return Center(
        key: Key('error_message'),
        child: Text(msg),
      );
    }

    _dataMovie(List<Movie> list) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MovieCard(list[index]);
        },
        itemCount: list.length,
      );
    }

    _dataTv(List<Tv> list) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TvCard(list[index]);
        },
        itemCount: list.length,
      );
    }

    _body() {
      switch (widget.type) {
        case WatchlistType.movie:
          return BlocBuilder<MovieWatchlistCubit, MovieWatchlistState>(
              builder: (context, state) {
            return state.when(
                initial: () => FillerView(),
                loading: () => _loading(),
                error: (msg) => _error(msg),
                data: (data) => _dataMovie(data));
          });
        case WatchlistType.tv:
          return BlocBuilder<TvWatchlistCubit, TvWatchlistState>(
              builder: (context, state) {
            return state.when(
                initial: () => FillerView(),
                loading: () => _loading(),
                error: (msg) => _error(msg),
                data: (data) => _dataTv(data));
          });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            widget.type == WatchlistType.movie
                ? Icon(Icons.movie_outlined)
                : Icon(Icons.tv),
            SizedBox(width: 8),
            Text('Watchlist'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _body(),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
