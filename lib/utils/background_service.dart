import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:dicoding_flutter/data/remote/remote_data_source.dart';
import 'package:dicoding_flutter/data/remote/service/api_service.dart';
import 'package:dicoding_flutter/data/remote/service/chopper_client.dart';
import 'package:dicoding_flutter/main.dart';
import 'package:dicoding_flutter/utils/notification_helper.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callbackDailyNotification() async {
    print('Alarm fired!');
    final NotificationHelper notificationHelper = NotificationHelper();
    final RemoteDataSource remoteDataSource =
        RemoteDataSource(apiService: chopperClient.getService<ApiService>());
    final result = await remoteDataSource.getListRestaurants();
    result.fold((e) {
      print('Alarm fired error: ${e.code} - ${e.message}');
    }, (m) async {
      final rand = Random().nextInt(m.length);
      await notificationHelper.showNotification(
        flutterLocalNotificationsPlugin,
        'Popular Restaurant',
        m[rand],
      );
    });
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
