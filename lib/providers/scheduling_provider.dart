import 'package:flutter/foundation.dart';

import '../utils/workmanager_service.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<void> toggleDailyNotification(bool value) async {
    if (value) {
      _isScheduled = true;
      notifyListeners();
      return await WorkmanagerService().runPeriodicTask();
    } else {
      _isScheduled = false;
      notifyListeners();
      return await WorkmanagerService().cancelAllTask();
    }
  }
}
