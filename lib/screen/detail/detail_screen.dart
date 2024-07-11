import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/model/restaurants.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const circularRadius = Radius.circular(12);

    Widget chipList(String title, List<String> list) {
      List<Chip> chips = [];
      for (final text in list) {
        chips.add(
          Chip(
            label: Text(
              text,
              style: const TextStyle(fontSize: 12),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 8,
            spacing: 8,
            children: chips,
          ),
        ],
      );
    }

    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, isScrolled) {
        return [
          SliverAppBar(
            leading: IconButton(
              icon: ClipOval(
                child: Container(
                  color: Colors.white70,
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: circularRadius, bottomRight: circularRadius)),
            pinned: true,
            expandedHeight: 260,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: circularRadius, bottomRight: circularRadius),
                child: Hero(
                  tag: restaurant.id,
                  child: Image.network(
                    restaurant.pictureId,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        ];
      },
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_pin),
                  const SizedBox(width: 4),
                  Text(
                    restaurant.city,
                    style: textTheme.labelLarge,
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.star),
                  const SizedBox(width: 4),
                  Text(
                    restaurant.rating.toString(),
                    style: textTheme.labelLarge,
                  )
                ],
              ),
              const SizedBox(height: defaultPadding * 2),
              Text('Description',
                  style: textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              Text(
                restaurant.description,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: defaultPadding * 2),
              chipList(
                  'Foods', restaurant.menus.foods.map((m) => m.name).toList()),
              const SizedBox(height: defaultPadding * 2),
              chipList('Drinks',
                  restaurant.menus.drinks.map((m) => m.name).toList()),
            ],
          ),
        ),
      ),
    ));
  }
}
