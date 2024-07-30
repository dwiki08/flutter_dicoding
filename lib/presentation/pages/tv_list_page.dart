import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/presentation/bloc/tv/now_playing/tv_now_playing_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/popular/tv_popular_cubit.dart';
import 'package:ditonton/presentation/bloc/tv/top_rated/tv_top_rated_cubit.dart';
import 'package:ditonton/presentation/widgets/filler_view.dart';
import 'package:ditonton/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          context.read<TvNowPlayingCubit>().fetchData();
          break;
        case TvListType.popular:
          context.read<TvPopularCubit>().fetchData();
          break;
        case TvListType.topRated:
          context.read<TvTopRatedCubit>().fetchData();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _loading() {
      return Center(child: CircularProgressIndicator());
    }

    _error(String msg) {
      return Center(key: Key('error_message'), child: Text(msg));
    }

    _data(List<Tv> data) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final movie = data[index];
          return TvCard(movie);
        },
        itemCount: data.length,
      );
    }

    _initial() {
      return FillerView();
    }

    Widget _body() {
      switch (widget.tvListType) {
        case TvListType.playingNow:
          return BlocBuilder<TvNowPlayingCubit, TvNowPlayingState>(
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
        case TvListType.popular:
          return BlocBuilder<TvPopularCubit, TvPopularState>(
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
        case TvListType.topRated:
          return BlocBuilder<TvTopRatedCubit, TvTopRatedState>(
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
        child: _body(),
      ),
    );
  }
}
