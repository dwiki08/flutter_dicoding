import 'dart:ui';

import 'package:dicoding_flutter/data/local/local_data_source.dart';
import 'package:dicoding_flutter/utils/injection.dart';
import 'package:flutter/cupertino.dart';

class SettingProvider extends ChangeNotifier {
  final LocalDataSource _localDataSource = getIt.get();

  Locale _locale = PlatformDispatcher.instance.locale;

  Locale get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    await _localDataSource.setLanguage(locale.languageCode);
    _locale = locale;
    notifyListeners();
  }

  Future<void> getLocale() async {
    final lang = await _localDataSource.getLanguage();
    _locale = Locale(lang ?? PlatformDispatcher.instance.locale.languageCode);
    notifyListeners();
  }
}
