import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PageManager extends ChangeNotifier {
  late Completer<String> _completerString;
  late Completer<LatLng> _completerLatLng;

  Future<String> waitForString() async {
    _completerString = Completer<String>();
    return _completerString.future;
  }

  void returnString(String value) {
    _completerString.complete(value);
  }

  Future<LatLng> waitForLatLng() async {
    _completerLatLng = Completer<LatLng>();
    return _completerLatLng.future;
  }

  void returnLatLng(LatLng value) {
    _completerLatLng.complete(value);
  }
}
