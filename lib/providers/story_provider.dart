import 'package:dicoding_flutter/data/model/error_result.dart';
import 'package:dicoding_flutter/data/model/story.dart';
import 'package:dicoding_flutter/data/remote/remote_data_source.dart';
import 'package:dicoding_flutter/providers/state/data_state.dart';
import 'package:dicoding_flutter/utils/injection.dart';
import 'package:dicoding_flutter/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoryProvider extends ChangeNotifier {
  final RemoteDataSource _remoteDataSource = getIt.get();

  DataState _state = DataState.noData;

  DataState get state => _state;

  ErrorResult? _error;

  ErrorResult? get error => _error;

  final List<Story> _list = [];

  List<Story> get list => _list;

  Story? _story;

  Story? get story => _story;

  Placemark? _placemark;

  Placemark? get placemark => _placemark;

  bool _storyAdded = false;

  bool get storyAdded => _storyAdded;

  int page = 1;
  int sizeItems = 10;

  Future<void> getListStory({bool? reload}) async {
    if (reload == true) {
      _list.clear();
      page = 1;
    }
    if (page == 1) {
      _state = DataState.isLoading;
      notifyListeners();
    }
    await Future.delayed(const Duration(seconds: 2));
    final result =
        await _remoteDataSource.getListStory(page: page, size: sizeItems);
    result.fold((e) {
      _state = DataState.error;
      _error = e;
    }, (s) {
      _state = s.isEmpty ? DataState.noData : DataState.hasData;
      _list.addAll(s);
      if (s.length < sizeItems) {
        page = 0;
      } else {
        page = page + 1;
      }
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
    if (_story?.lat != null && _story?.lon != null) {
      _placemark = await getPlacemark(LatLng(_story!.lat!, _story!.lon!));
    }
    notifyListeners();
  }

  Future<void> addStory(
      String description, String filePath, LatLng? location) async {
    _state = DataState.isLoading;
    notifyListeners();

    final result = await _remoteDataSource.addStory(
      description: description,
      filePath: filePath,
      location: location,
    );
    result.fold((e) {
      _storyAdded = false;
      _state = DataState.error;
      _error = e;
    }, (s) {
      _storyAdded = true;
      _state = DataState.hasData;
    });

    notifyListeners();
  }
}
