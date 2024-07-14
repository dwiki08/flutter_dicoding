import 'dart:io';

import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/components/custom_dialog.dart';
import 'package:dicoding_flutter/components/setting_tile.dart';
import 'package:dicoding_flutter/providers/preference_provider.dart';
import 'package:dicoding_flutter/providers/scheduling_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  _toggleNotification(bool isChecked) {
    if (Platform.isIOS) {
      blockerDialog(context);
    } else {
      context.read<SchedulingProvider>().toggleDailyNotification(isChecked);
      context.read<PreferenceProvider>().setSettingNotification(isChecked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingState = context.watch<PreferenceProvider>().settingState;
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          SettingTile(
            title: 'Notification',
            description: 'Daily popular restaurant at 11.00 AM',
            isChecked: settingState.notification,
            onChecked: (isChecked) {
              _toggleNotification(isChecked);
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<PreferenceProvider>().getSettingNotification();
  }
}
