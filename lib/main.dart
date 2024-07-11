import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/model/restaurants.dart';
import 'package:dicoding_flutter/screen/detail/detail_screen.dart';
import 'package:dicoding_flutter/screen/home/home_screen.dart';
import 'package:dicoding_flutter/screen/welcome/welcome_screen.dart';
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
          colorScheme: colorScheme(context),
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
          useMaterial3: true),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/home': (context) => const HomeScreen(),
        '/detailRestaurant': (context) => DetailScreen(
            restaurant:
                ModalRoute.of(context)?.settings.arguments as Restaurant)
      },
    );
  }
}
