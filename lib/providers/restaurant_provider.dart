import 'package:dicoding_flutter/data/local/local_data_source.dart';
import 'package:dicoding_flutter/data/model/restaurant.dart';
import 'package:dicoding_flutter/data/remote/remote_data_source.dart';
import 'package:dicoding_flutter/providers/state/restaurant_state.dart';
import 'package:dicoding_flutter/utils/injection.dart';
import 'package:flutter/foundation.dart';

class RestaurantProvider extends ChangeNotifier {
  final remoteDataSource = getIt.get<RemoteDataSource>();
  final localDataSource = getIt.get<LocalDataSource>();

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
    final remote = await remoteDataSource.getRestaurant(id);
    remote.fold(
      (e) => _state = _state.copyWith(error: e),
      (m) => _state = _state.copyWith(restaurant: m),
    );
    _hideLoading();
  }

  Future<void> insertFavorite(Restaurant restaurant) async {
    await localDataSource.insertFavoriteRestaurant(restaurant);
    _state = _state.copyWith(isFavorite: true);
    notifyListeners();
  }

  Future<void> deleteFavorite(String id) async {
    await localDataSource.deleteFavoriteRestaurant(id);
    _state = _state.copyWith(isFavorite: false);
    notifyListeners();
  }

  void getListFavorites() async {
    _showLoading();
    final result = await localDataSource.getFavoriteRestaurants();
    _state = _state.copyWith(listRestaurants: result);
    _hideLoading();
  }

  void getIsFavorite(String id) async {
    final result = await localDataSource.getFavoriteRestaurant(id);
    _state = _state.copyWith(isFavorite: result != null);
    notifyListeners();
  }
}
