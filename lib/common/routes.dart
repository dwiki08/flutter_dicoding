import 'package:dicoding_flutter/data/model/restaurant.dart';
import 'package:dicoding_flutter/screen/detail/detail_screen.dart';
import 'package:dicoding_flutter/screen/home/home_screen.dart';
import 'package:dicoding_flutter/screen/search/search_screen.dart';
import 'package:dicoding_flutter/screen/welcome/welcome_screen.dart';
import 'package:dicoding_flutter/screen/write_review/write_review.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> screenRoutes = {
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailScreen.routeName: (context) => DetailScreen(
      restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant),
  WriteReview.routeName: (context) => WriteReview(
        restaurantId: ModalRoute.of(context)?.settings.arguments as String,
      ),
  SearchScreen.routeName: (context) => const SearchScreen()
};
