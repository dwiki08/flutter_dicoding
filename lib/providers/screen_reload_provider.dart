import 'package:flutter/foundation.dart';

class ScreenReloadProvider extends ChangeNotifier {
  bool _homeScreen = false;

  bool get homeScreen => _homeScreen;

  void reloadHomeScreen() {
    _homeScreen = !_homeScreen;
    notifyListeners();
  }
}
