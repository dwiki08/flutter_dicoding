import 'package:dicoding_flutter/providers/restaurant_provider.dart';
import 'package:dicoding_flutter/screen/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RestaurantProvider(),
      child: const SearchPage(),
    );
  }
}
