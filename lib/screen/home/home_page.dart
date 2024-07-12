import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/components/restaurants_list_view.dart';
import 'package:dicoding_flutter/providers/restaurant_provider.dart';
import 'package:dicoding_flutter/screen/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RestaurantProvider>().getListRestaurants();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RestaurantProvider>().state;

    return Scaffold(
        appBar: AppBar(
          title: const Text(appName),
          actions: [
            Visibility(
              visible: state.listRestaurants.isEmpty && !state.isLoading,
              child: IconButton(
                onPressed: () =>
                    context.read<RestaurantProvider>().getListRestaurants(),
                icon: const Icon(Icons.refresh),
              ),
            ),
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, SearchScreen.routeName),
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: const RestaurantsListView());
  }
}
