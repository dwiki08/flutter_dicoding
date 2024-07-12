import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/data/model/restaurant.dart';
import 'package:dicoding_flutter/screen/detail/detail_screen.dart';
import 'package:dicoding_flutter/screen/home/home_screen.dart';
import 'package:dicoding_flutter/screen/search/search_screen.dart';
import 'package:dicoding_flutter/screen/welcome/welcome_screen.dart';
import 'package:dicoding_flutter/screen/write_review/write_review.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: appBarColor, shape: appBarShape),
          colorScheme: colorScheme(context),
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
          useMaterial3: true),
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        DetailScreen.routeName: (context) => DetailScreen(
            restaurant:
                ModalRoute.of(context)?.settings.arguments as Restaurant),
        WriteReview.routeName: (context) => WriteReview(
              restaurantId:
                  ModalRoute.of(context)?.settings.arguments as String,
            ),
        SearchScreen.routeName: (context) => const SearchScreen()
      },
    );
  }
}
