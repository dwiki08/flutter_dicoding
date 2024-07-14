import 'package:dicoding_flutter/data/local/local_data_source.dart';
import 'package:dicoding_flutter/providers/state/setting_state.dart';
import 'package:dicoding_flutter/utils/injection.dart';
import 'package:flutter/foundation.dart';

class PreferenceProvider extends ChangeNotifier {
  final localDataSource = getIt.get<LocalDataSource>();

  SettingState _settingState = const SettingState();

  SettingState get settingState => _settingState;

  void setSettingNotification(bool isActive) async {
    await localDataSource.setSettingNotification(isActive);
    _settingState = _settingState.copyWith(notification: isActive);
    notifyListeners();
  }

  void getSettingNotification() async {
    final result = await localDataSource.getSettingNotification();
    _settingState = _settingState.copyWith(notification: result);
    notifyListeners();
  }
}
