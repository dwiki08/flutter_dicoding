import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/components/restaurants_list_view.dart';
import 'package:dicoding_flutter/providers/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    searchRestaurant(String query) {
      context.read<RestaurantProvider>().getListRestaurants(query: query);
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(defaultPadding),
            child: TextField(
              controller: textController,
              decoration: textFieldDecoration(
                context,
                'Search',
                'Find your restaurant or menu...',
              ).copyWith(
                  suffixIcon: IconButton(
                onPressed: () {
                  textController.clear();
                  context.read<RestaurantProvider>().clearState();
                },
                icon: const Icon(Icons.clear),
              )),
              textInputAction: TextInputAction.search,
              onSubmitted: (text) {
                searchRestaurant(text);
              },
              autofocus: true,
            ),
          ),
          const Expanded(child: RestaurantsListView())
        ],
      ),
    );
  }
}
