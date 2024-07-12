import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/components/error_view.dart';
import 'package:dicoding_flutter/components/filler_view.dart';
import 'package:dicoding_flutter/components/loading.dart';
import 'package:dicoding_flutter/components/tile_restaurant.dart';
import 'package:dicoding_flutter/data/model/restaurant.dart';
import 'package:dicoding_flutter/providers/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantsListView extends StatelessWidget {
  const RestaurantsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(builder: (context, state, child) {
      if (state.state.isLoading) {
        return const Loading();
      } else if (state.state.error != null) {
        return ErrorView(error: state.state.error);
      } else if (state.state.listRestaurants.isNotEmpty) {
        final List<Restaurant> restaurants = state.state.listRestaurants;
        return ListView.builder(
          shrinkWrap: true,
          itemCount: restaurants.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                TileRestaurant(restaurant: restaurants[i]),
                if (i < restaurants.length - 1)
                  const Divider(
                    height: 1,
                    indent: defaultPadding,
                    endIndent: defaultPadding,
                  )
              ],
            );
          },
        );
      } else {
        return const FillerView();
      }
    });
  }
}
