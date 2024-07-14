import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:dicoding_flutter/utils/background_service.dart';
import 'package:dicoding_flutter/utils/date_time_helper.dart';
import 'package:flutter/foundation.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> toggleDailyNotification(bool value) async {
    const dailyNotificationId = 69;
    if (value) {
      _isScheduled = true;
      notifyListeners();
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        dailyNotificationId,
        BackgroundService.callbackDailyNotification,
        startAt: DateTimeHelper.formatStartingTime('11:00:00'),
        exact: true,
        wakeup: true,
        rescheduleOnReboot: true,
      );
    } else {
      _isScheduled = false;
      notifyListeners();
      return await AndroidAlarmManager.cancel(dailyNotificationId);
    }
  }
}
