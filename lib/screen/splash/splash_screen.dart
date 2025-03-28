import 'package:dicoding_flutter/common/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const routePath = '/splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(assetsIcons('logo.png'))));
  }
}
