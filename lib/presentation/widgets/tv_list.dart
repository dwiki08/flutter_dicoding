import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/presentation/pages/tv_detail_page.dart';
import 'package:ditonton/presentation/widgets/image_loader.dart';
import 'package:flutter/material.dart';

class TvList extends StatelessWidget {
  final List<Tv> movies;

  TvList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, TvDetailPage.ROUTE_NAME,
                    arguments: movie.id);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: ImageLoader(url: '$BASE_IMAGE_URL${movie.posterPath}'),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
