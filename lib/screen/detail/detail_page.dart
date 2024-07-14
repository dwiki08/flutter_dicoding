import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/common/navigation.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/components/action_icon.dart';
import 'package:dicoding_flutter/components/error_view.dart';
import 'package:dicoding_flutter/components/loading.dart';
import 'package:dicoding_flutter/data/model/error_result.dart';
import 'package:dicoding_flutter/data/model/restaurant.dart';
import 'package:dicoding_flutter/providers/restaurant_provider.dart';
import 'package:dicoding_flutter/providers/screen_reload_provider.dart';
import 'package:dicoding_flutter/screen/detail/detail_categories.dart';
import 'package:dicoding_flutter/screen/detail/detail_menus.dart';
import 'package:dicoding_flutter/screen/detail/detail_reviews.dart';
import 'package:dicoding_flutter/screen/write_review/write_review.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RestaurantProvider>().getRestaurant(widget.restaurant.id);
      context.read<RestaurantProvider>().getIsFavorite(widget.restaurant.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final state = context.watch<RestaurantProvider>().state;
    final categories = state.restaurant?.categories;
    final menus = state.restaurant?.menus;
    final reviews = state.restaurant?.customerReviews;

    getRestaurantDetail() {
      context.read<RestaurantProvider>().getRestaurant(widget.restaurant.id);
    }

    gotoAddReview() async {
      final result = await Navigation.intent(
        route: WriteReview.routeName,
        arguments: widget.restaurant.id,
      );
      if (result == true) {
        getRestaurantDetail();
      }
    }

    menusAndReviews() {
      if (state.error != null) {
        return ErrorView(error: state.error);
      } else if (state.isLoading) {
        return const Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Loading(),
        );
      } else if (state.restaurant != null) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DetailCategories(categories: categories ?? []),
            DetailMenus(foods: menus?.foods ?? [], drinks: menus?.drinks ?? []),
            DetailReviews(reviews: reviews ?? []),
          ],
        );
      } else {
        return const SizedBox();
      }
    }

    favoriteButton() {
      if (state.isFavorite == true) {
        return actionIconRounded(
          onPressed: () {
            context
                .read<RestaurantProvider>()
                .deleteFavorite(widget.restaurant.id);
            context.read<ScreenReloadProvider>().reloadFavoriteScreen();
          },
          icon: const Icon(
            Icons.favorite,
            color: favoriteColor,
          ),
        );
      } else {
        return actionIconRounded(
          onPressed: () {
            context
                .read<RestaurantProvider>()
                .insertFavorite(widget.restaurant);
            context.read<ScreenReloadProvider>().reloadFavoriteScreen();
          },
          icon: const Icon(
            Icons.favorite_border,
          ),
        );
      }
    }

    return Scaffold(
        floatingActionButton: Container(
          padding: const EdgeInsets.only(
              bottom: defaultPadding, right: defaultPadding),
          child: Visibility(
            visible: !state.isLoading && state.error == null,
            child: FloatingActionButton(
              onPressed: () => gotoAddReview(),
              tooltip: 'Write a review',
              child: const Icon(Icons.edit),
            ),
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                actions: [
                  favoriteButton(),
                ],
                leading: actionIconRounded(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigation.back()),
                pinned: true,
                expandedHeight: 260,
                flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: defaultCircularRadius,
                        bottomRight: defaultCircularRadius),
                    child: Image.network(
                      networkImageUrl(
                          widget.restaurant.pictureId, ImageRes.medium),
                      height: 250,
                      fit: BoxFit.cover,
                      errorBuilder: (context, o, s) {
                        return const ErrorView(error: ErrorResult(code: 1));
                      },
                    ),
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: widget.restaurant.name,
                        child: Text(
                          widget.restaurant.name,
                          style: textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_pin),
                          const SizedBox(width: 4),
                          Text(
                            widget.restaurant.city,
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
                            widget.restaurant.rating.toString(),
                            style: textTheme.labelLarge,
                          )
                        ],
                      ),
                      const SizedBox(height: defaultPadding * 2),
                      Text('Description',
                          style: textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      Text(
                        widget.restaurant.description,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                menusAndReviews(),
                const SizedBox(height: 128),
              ],
            ),
          ),
        ));
  }
}
