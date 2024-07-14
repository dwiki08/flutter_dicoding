import 'package:flutter/cupertino.dart';

class ScreenReloadProvider extends ChangeNotifier {
  bool _favoriteScreen = false;

  bool get favoriteScreen => _favoriteScreen;

  void reloadFavoriteScreen() {
    _favoriteScreen = !_favoriteScreen;
    notifyListeners();
  }
}
