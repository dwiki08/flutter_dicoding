import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/presentation/bloc/tv/detail/tv_detail_cubit.dart';
import 'package:ditonton/presentation/widgets/filler_view.dart';
import 'package:ditonton/presentation/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TvDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detailTv';

  final int id;

  TvDetailPage({required this.id});

  @override
  _TvDetailPageState createState() => _TvDetailPageState();
}

class _TvDetailPageState extends State<TvDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvDetailCubit>().getData(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TvDetailCubit, TvDetailState>(
        builder: (context, state) {
          return state.when(initial: () {
            return FillerView();
          }, loading: () {
            return Center(child: CircularProgressIndicator());
          }, error: (msg) {
            return Center(child: Text(msg));
          }, data: (detail, recommendations, isAddedWatchlist) {
            return SafeArea(
              child: DetailContent(
                detail,
                recommendations,
                isAddedWatchlist,
              ),
            );
          });
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final Tv tv;
  final List<Tv> recommendations;
  final bool isAddedWatchlist;

  DetailContent(this.tv, this.recommendations, this.isAddedWatchlist);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    _onAddWatchlist() async {
      if (!isAddedWatchlist) {
        await context.read<TvDetailCubit>().addWatchlist(tv);
      } else {
        await context.read<TvDetailCubit>().removeWatchlist(tv);
      }
      final message = await context.read<TvDetailCubit>().state;
      message.whenOrNull(data: (detail, _, isAddedWatchlist) {
        if (isAddedWatchlist) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(TvDetailCubit.watchlistAddSuccessMessage),
            duration: Duration(seconds: 2),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(TvDetailCubit.watchlistRemoveSuccessMessage),
            duration: Duration(seconds: 2),
          ));
        }
      });
    }

    _recommendations() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Recommendations',
            style: kHeading6,
          ),
          BlocBuilder<TvDetailCubit, TvDetailState>(
            builder: (context, state) {
              return state.when(initial: () {
                return FillerView();
              }, loading: () {
                return Center(child: CircularProgressIndicator());
              }, error: (msg) {
                return Center(child: Text(msg));
              }, data: (detail, recommendations, isAddedWatchlist) {
                return Container(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final tv = recommendations[index];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              TvDetailPage.ROUTE_NAME,
                              arguments: tv.id,
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            child: ImageLoader(
                              url: '$BASE_IMAGE_URL${tv.posterPath}',
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: recommendations.length,
                  ),
                );
              });
            },
          ),
        ],
      );
    }

    return Stack(
      children: [
        ImageLoader(
          url: '$BASE_IMAGE_URL${tv.posterPath}',
        ),
        Container(
          margin: const EdgeInsets.only(top: kToolbarHeight),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tv.name,
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                await _onAddWatchlist();
                              },
                              style: mikadoButton,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isAddedWatchlist
                                      ? Icon(
                                          Icons.check,
                                          color: kRichBlack,
                                        )
                                      : Icon(
                                          Icons.add,
                                          color: kRichBlack,
                                        ),
                                  Text(
                                    'Watchlist',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: kRichBlack),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              _showGenres(tv.genres ?? []),
                            ),
                            SizedBox(height: 16),
                            Text('${tv.numberOfSeasons ?? 0} Seasons'),
                            Text('${tv.numberOfEpisodes ?? 0} Episodes'),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: tv.voteAverage ?? 0 / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${tv.voteAverage}')
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              tv.overview,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Last Episode',
                              style: kHeading6,
                            ),
                            Text(
                              'Ep: ${tv.lastEpisodeToAir?.episodeNumber} - \"${tv.lastEpisodeToAir?.name}\"',
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              child: ImageLoader(
                                url:
                                    '$BASE_IMAGE_URL/${tv.lastEpisodeToAir?.stillPath}',
                              ),
                            ),
                            SizedBox(height: 16),
                            _recommendations()
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            minChildSize: 0.25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name + ', ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
