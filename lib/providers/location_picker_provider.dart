import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/utils.dart';

class LocationPickerProvider extends ChangeNotifier {
  LatLng? latLng;
  Placemark? placemark;

  Future<void> setLocation(LatLng location) async {
    latLng = location;
    placemark = await getPlacemark(location);
    notifyListeners();
  }
}
