import 'dart:developer';

import 'package:dicoding_flutter/data/model/error_result.dart';
import 'package:dicoding_flutter/data/model/story.dart';
import 'package:dicoding_flutter/data/remote/remote_data_source.dart';
import 'package:dicoding_flutter/providers/state/data_state.dart';
import 'package:dicoding_flutter/utils/injection.dart';
import 'package:flutter/cupertino.dart';

class StoryProvider extends ChangeNotifier {
  final RemoteDataSource _remoteDataSource = getIt.get();

  DataState _state = DataState.noData;

  DataState get state => _state;

  ErrorResult? _error;

  ErrorResult? get error => _error;

  List<Story> _list = [];

  List<Story> get list => _list;

  Story? _story;

  Story? get story => _story;

  bool _storyAdded = false;

  bool get storyAdded => _storyAdded;

  Future<void> getListStory() async {
    _state = DataState.isLoading;
    notifyListeners();
    final result = await _remoteDataSource.getListStory();
    result.fold((e) {
      _state = DataState.error;
      _error = e;
    }, (s) {
      _state = s.isEmpty ? DataState.noData : DataState.hasData;
      _list = s;
    });
    notifyListeners();
  }

  Future<void> getStory(String id) async {
    _state = DataState.isLoading;
    notifyListeners();
    final result = await _remoteDataSource.getStory(storyId: id);
    result.fold((e) {
      _state = DataState.error;
      _error = e;
    }, (s) {
      _state = DataState.hasData;
      _story = s;
    });
    notifyListeners();
  }

  Future<void> addStory(String description, String filePath) async {
    _state = DataState.isLoading;
    notifyListeners();

    final result = await _remoteDataSource.addStory(
        description: description, filePath: filePath);
    result.fold((e) {
      _storyAdded = false;
      _state = DataState.error;
      _error = e;
      log('e: $e');
    }, (s) {
      _storyAdded = true;
      _state = DataState.hasData;
    });

    notifyListeners();
  }
}
