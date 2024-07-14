import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/common/navigation.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/data/model/restaurant.dart';
import 'package:dicoding_flutter/screen/detail/detail_screen.dart';
import 'package:flutter/material.dart';

class TileRestaurant extends StatelessWidget {
  const TileRestaurant({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigation.intent(
          route: DetailScreen.routeName,
          arguments: restaurant,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 4,
              child: Image.network(
                networkImageUrl(restaurant.pictureId, ImageRes.small),
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, _, s) {
                  return const Text('Error');
                },
              ),
            ),
            const SizedBox(width: defaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: restaurant.name,
                    child: Text(
                      restaurant.name,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Row(
                    children: [
                      const Icon(Icons.location_pin),
                      const SizedBox(width: 4),
                      Text(restaurant.city),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star),
                      const SizedBox(width: 4),
                      Text(restaurant.rating.toString())
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
