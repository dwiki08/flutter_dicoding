import 'dart:async';

import 'package:flutter/material.dart';

enum PageResult {
  ok('ok'),
  cancel('cancel');

  final String value;

  const PageResult(this.value);
}

class PageManager extends ChangeNotifier {
  late Completer<({PageResult result, Object data})> _completerResult;

  Future<({PageResult result, Object data})> waitForResult() async {
    _completerResult = Completer<({PageResult result, Object data})>();
    return _completerResult.future.whenComplete(() {
      _completerResult = Completer();
    });
  }

  void returnResult(({PageResult result, Object data}) value) {
    _completerResult.complete(value);
  }
}
