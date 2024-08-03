import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/provider/watchlist_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:ditonton/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        Provider.of<WatchlistNotifier>(context, listen: false)
            .fetchWatchlistMovies();
        break;
      case WatchlistType.tv:
        Provider.of<WatchlistNotifier>(context, listen: false)
            .fetchWatchlistTv();
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
        child: Consumer<WatchlistNotifier>(
          builder: (context, data, child) {
            var state;
            var list;
            switch (widget.type) {
              case WatchlistType.movie:
                state = data.watchlistMovieState;
                list = data.watchlistMovies;
                break;
              case WatchlistType.tv:
                state = data.watchlistTvState;
                list = data.watchlistTv;
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
                  switch (widget.type) {
                    case WatchlistType.movie:
                      return MovieCard(movie);
                    case WatchlistType.tv:
                      return TvCard(movie);
                  }
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

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
