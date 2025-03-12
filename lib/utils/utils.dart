import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<geo.Placemark?> getPlacemark(LatLng latLng) async {
  try {
    final info = await geo.placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );
    return info[0];
  } catch (e) {
    return null;
  }
}
