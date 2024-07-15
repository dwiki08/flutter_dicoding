import 'package:flutter/material.dart';

SnackBar defaultSnackBar(String text) {
  return SnackBar(
    content: Text(text),
    duration: const Duration(seconds: 2),
  );
}
