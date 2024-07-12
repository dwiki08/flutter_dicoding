import 'package:dicoding_flutter/data/remote/remote_data_source.dart';
import 'package:dicoding_flutter/providers/state/review_state.dart';
import 'package:flutter/foundation.dart';

class ReviewProvider extends ChangeNotifier {
  late RemoteDataSource remoteDataSource;

  ReviewProvider() {
    remoteDataSource = RemoteDataSource();
  }

  ReviewState _state = const ReviewState();

  ReviewState get state => _state;

  void _showLoading({bool clear = true}) {
    _state = clear
        ? const ReviewState(isLoading: true)
        : _state.copyWith(isLoading: true);
    notifyListeners();
  }

  void _hideLoading() {
    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }

  void addReview(String id, String name, String review) async {
    _showLoading();
    final result =
        await remoteDataSource.addReview(id: id, name: name, review: review);
    result.fold((e) => _state = _state.copyWith(error: e),
        (m) => _state = _state.copyWith(addSuccess: m));
    await Future.delayed(const Duration(seconds: 2));
    _hideLoading();
  }
}
