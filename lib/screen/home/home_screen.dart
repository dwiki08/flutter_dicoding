import 'package:dicoding_flutter/providers/restaurant_provider.dart';
import 'package:dicoding_flutter/screen/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RestaurantProvider(),
      child: const HomePage(),
    );
  }
}
