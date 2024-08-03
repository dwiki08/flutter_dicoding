import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_list_notifier.dart';
import 'package:ditonton/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum TvListType { playingNow, popular, topRated }

class TvListPage extends StatefulWidget {
  static const ROUTE_NAME = '/tvListPage';

  final TvListType tvListType;

  const TvListPage({Key? key, required this.tvListType}) : super(key: key);

  @override
  _TvListPageState createState() => _TvListPageState();
}

class _TvListPageState extends State<TvListPage> {
  _title() {
    switch (widget.tvListType) {
      case TvListType.playingNow:
        return 'Playing Now';
      case TvListType.popular:
        return 'Popular';
      case TvListType.topRated:
        return 'Top Rated';
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      switch (widget.tvListType) {
        case TvListType.playingNow:
          context.read<TvListNotifier>().fetchNowPlayingTv();
          break;
        case TvListType.popular:
          context.read<TvListNotifier>().fetchPopularTv();
          break;
        case TvListType.topRated:
          context.read<TvListNotifier>().fetchTopRatedTv();
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
            Icon(Icons.tv),
            SizedBox(width: 8),
            Text(_title()),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TvListNotifier>(
          builder: (context, data, child) {
            var state;
            var list;
            switch (widget.tvListType) {
              case TvListType.playingNow:
                state = data.nowPlayingState;
                list = data.nowPlayingTv;
                break;
              case TvListType.popular:
                state = data.popularTvState;
                list = data.popularTv;
                break;
              case TvListType.topRated:
                state = data.topRatedTvState;
                list = data.topRatedTv;
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
                  return TvCard(movie);
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
