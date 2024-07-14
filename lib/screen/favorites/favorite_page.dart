import 'package:dicoding_flutter/components/restaurants_list_view.dart';
import 'package:dicoding_flutter/providers/restaurant_provider.dart';
import 'package:dicoding_flutter/providers/screen_reload_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  ValueNotifier<bool> isNeedReload = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    isNeedReload.value = context.watch<ScreenReloadProvider>().favoriteScreen;
    return const RestaurantsListView();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RestaurantProvider>().getListFavorites();
      isNeedReload.addListener(() {
        context.read<RestaurantProvider>().getListFavorites();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    isNeedReload.dispose();
  }
}
