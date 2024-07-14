import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation {
  static Future<Object?>? intent({required String route, Object? arguments}) {
    return navigatorKey.currentState?.pushNamed(route, arguments: arguments);
  }

  static back({Object? result}) => navigatorKey.currentState?.pop(result);
}
