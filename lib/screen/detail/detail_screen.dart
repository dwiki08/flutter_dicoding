import 'package:dicoding_flutter/data/model/restaurant.dart';
import 'package:dicoding_flutter/providers/restaurant_provider.dart';
import 'package:dicoding_flutter/screen/detail/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.restaurant});

  static const String routeName = '/detailRestaurant';
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RestaurantProvider(),
      child: DetailPage(restaurant: restaurant),
    );
  }
}
