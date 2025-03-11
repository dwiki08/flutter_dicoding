import 'dart:developer';
import 'dart:math' as math;

import 'package:workmanager/workmanager.dart';

import '../common/constants.dart';
import '../data/remote/remote_data_source.dart';
import '../data/remote/service/api_service.dart';
import '../data/remote/service/chopper_client.dart';
import '../main.dart';
import 'notification_helper.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == MyWorkmanager.periodic.taskName) {
      final NotificationHelper notificationHelper = NotificationHelper();
      final RemoteDataSource remoteDataSource =
          RemoteDataSource(apiService: chopperClient.getService<ApiService>());
      final result = await remoteDataSource.getListRestaurants();
      result.fold((e) {
        log('Daily notif error: ${e.code} - ${e.message}');
      }, (m) async {
        final rand = math.Random().nextInt(m.length);
        await notificationHelper.showNotification(
          flutterLocalNotificationsPlugin,
          'Popular Restaurant',
          m[rand],
        );
      });
    }
    return Future.value(true);
  });
}

class WorkmanagerService {
  final Workmanager _workmanager;

  WorkmanagerService([Workmanager? workmanager])
      : _workmanager = workmanager ??= Workmanager();

  Future<void> init() async {
    await _workmanager.initialize(callbackDispatcher, isInDebugMode: false);
  }

  Future<void> runPeriodicTask() async {
    final now = DateTime.now();
    final targetTime = DateTime(now.year, now.month, now.day, 11, 00);
    final initialDelay = targetTime.isBefore(now)
        ? targetTime.add(const Duration(days: 1)).difference(now)
        : targetTime.difference(now);

    await _workmanager.registerPeriodicTask(
      MyWorkmanager.periodic.uniqueName,
      MyWorkmanager.periodic.taskName,
      frequency: const Duration(days: 1),
      initialDelay: initialDelay,
      constraints: Constraints(networkType: NetworkType.connected),
    );
  }

  Future<void> cancelAllTask() async {
    await Workmanager().cancelAll();
  }
}
