import 'package:dicoding_flutter/providers/scheduling_provider.dart';
import 'package:dicoding_flutter/screen/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SchedulingProvider(),
      child: const SettingPage(),
    );
  }
}
