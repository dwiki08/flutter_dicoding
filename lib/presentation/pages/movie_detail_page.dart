import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/presentation/bloc/movie/detail/movie_detail_cubit.dart';
import 'package:ditonton/presentation/widgets/filler_view.dart';
import 'package:ditonton/presentation/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail';

  final int id;

  MovieDetailPage({required this.id});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MovieDetailCubit>().getData(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
          return state.when(initial: () {
            return FillerView();
          }, loading: () {
            return Center(
              child: CircularProgressIndicator(),
            );
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
  final MovieDetail movie;
  final List<Movie> recommendations;
  final bool isAddedWatchlist;

  DetailContent(this.movie, this.recommendations, this.isAddedWatchlist);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    _onAddWatchlist() async {
      if (!isAddedWatchlist) {
        await context.read<MovieDetailCubit>().addWatchlist(movie);
      } else {
        await context.read<MovieDetailCubit>().removeWatchlist(movie);
      }
      final message = await context.read<MovieDetailCubit>().state;
      message.whenOrNull(data: (detail, _, isAddedWatchlist) {
        if (isAddedWatchlist) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(MovieDetailCubit.watchlistAddSuccessMessage),
            duration: Duration(seconds: 2),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(MovieDetailCubit.watchlistRemoveSuccessMessage),
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
          BlocBuilder<MovieDetailCubit, MovieDetailState>(
            builder: (context, state) {
              return state.whenOrNull(
                    data: (detail, recommendations, isAddedWatchlist) {
                      return Container(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final movie = recommendations[index];
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    MovieDetailPage.ROUTE_NAME,
                                    arguments: movie.id,
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  child: ImageLoader(
                                      url:
                                          '$BASE_IMAGE_URL${movie.posterPath}'),
                                ),
                              ),
                            );
                          },
                          itemCount: recommendations.length,
                        ),
                      );
                    },
                  ) ??
                  FillerView();
            },
          ),
        ],
      );
    }

    return Stack(
      children: [
        ImageLoader(url: '$BASE_IMAGE_URL${movie.posterPath}'),
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
                              movie.title,
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
                            Text(
                              _showGenres(movie.genres),
                            ),
                            Text(
                              _showDuration(movie.runtime),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: movie.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${movie.voteAverage}')
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              movie.overview,
                            ),
                            SizedBox(height: 16),
                            _recommendations(),
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
    return result.isEmpty ? result : result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
