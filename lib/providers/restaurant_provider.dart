import 'package:dicoding_flutter/data/remote/remote_data_source.dart';
import 'package:dicoding_flutter/providers/state/restaurant_state.dart';
import 'package:flutter/foundation.dart';

class RestaurantProvider extends ChangeNotifier {
  late RemoteDataSource remoteDataSource;

  RestaurantProvider() {
    remoteDataSource = RemoteDataSource();
  }

  RestaurantState _state = const RestaurantState();

  RestaurantState get state => _state;

  void _showLoading({bool clear = true}) {
    _state = clear
        ? const RestaurantState(isLoading: true)
        : _state.copyWith(isLoading: true);
    notifyListeners();
  }

  void _hideLoading() {
    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }

  void clearState() {
    _state = const RestaurantState();
    notifyListeners();
  }

  void getListRestaurants({String? query}) async {
    _showLoading();
    final result =
        await remoteDataSource.getListRestaurants(query: query?.trim());
    result.fold((e) => _state = _state.copyWith(error: e),
        (m) => _state = _state.copyWith(listRestaurants: m));
    _hideLoading();
  }

  void getRestaurant(String id) async {
    _showLoading();
    await Future.delayed(const Duration(seconds: 3));
    final result = await remoteDataSource.getRestaurant(id);
    result.fold((e) => _state = _state.copyWith(error: e),
        (m) => _state = _state.copyWith(restaurant: m));
    _hideLoading();
  }
}
