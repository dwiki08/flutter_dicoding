import 'package:flutter/material.dart';

ColorScheme colorScheme(BuildContext context) {
  return ColorScheme.fromSeed(seedColor: const Color(0xff42515a)).copyWith(
    primary: const Color(0xff42515a),
    onPrimary: const Color(0xff24323b),
    secondary: const Color(0x0f83939b),
  );
}
