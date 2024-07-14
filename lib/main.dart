import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/common/navigation.dart';
import 'package:dicoding_flutter/common/routes.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/providers/preference_provider.dart';
import 'package:dicoding_flutter/providers/screen_reload_provider.dart';
import 'package:dicoding_flutter/screen/welcome/welcome_screen.dart';
import 'package:dicoding_flutter/utils/background_service.dart';
import 'package:dicoding_flutter/utils/injection.dart';
import 'package:dicoding_flutter/utils/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjection();
  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService service = BackgroundService();
  service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ScreenReloadProvider()),
      ChangeNotifierProvider(create: (context) => PreferenceProvider()),
    ],
    child: const MyApp(),
  ));
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
            backgroundColor: appBarColor,
            shape: appBarShape,
          ),
          colorScheme: colorScheme(context),
          textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
          switchTheme: switchTheme,
          useMaterial3: true),
      navigatorKey: navigatorKey,
      initialRoute: WelcomeScreen.routeName,
      routes: screenRoutes,
    );
  }
}
