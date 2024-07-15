import 'package:dicoding_flutter/data/local/local_data_source.dart';
import 'package:dicoding_flutter/data/model/error_result.dart';
import 'package:dicoding_flutter/data/remote/remote_data_source.dart';
import 'package:dicoding_flutter/providers/state/data_state.dart';
import 'package:dicoding_flutter/utils/injection.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  final RemoteDataSource _remoteDataSource = getIt.get();
  final LocalDataSource _localDataSource = getIt.get();

  DataState _state = DataState.noData;

  DataState get state => _state;

  ErrorResult? _error;

  ErrorResult? get error => _error;

  bool? _isLoggedIn;

  bool? get isLoggedIn => _isLoggedIn;

  bool? _isRegister;

  bool? get isRegister => _isRegister;

  void clear() {
    _isLoggedIn = null;
    _error = null;
    _state = DataState.noData;
    notifyListeners();
  }

  Future<void> login({required String email, required String password}) async {
    _state = DataState.isLoading;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    final result =
        await _remoteDataSource.login(email: email, password: password);
    result.mapAsync((token) async {
      await _localDataSource.setAuthToken(token);
    });
    result.fold((e) {
      _state = DataState.error;
      _error = e;
      _isLoggedIn = false;
    }, (_) {
      _state = DataState.hasData;
      _isLoggedIn = true;
    });
    notifyListeners();
  }

  Future<void> register(
      {required String name,
      required String email,
      required String password}) async {
    _state = DataState.isLoading;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    final result = await _remoteDataSource.register(
        name: name, email: email, password: password);
    result.fold((e) {
      _isRegister = false;
      _state = DataState.error;
      _error = e;
    }, (_) {
      _isRegister = true;
      _state = DataState.hasData;
    });
    notifyListeners();
  }

  Future<void> logout() async {
    await _localDataSource.clearAuthToken();
    _state = DataState.noData;
    _isLoggedIn = false;
    notifyListeners();
  }
}
