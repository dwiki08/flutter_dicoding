import 'package:flutter/material.dart';

class ErrorMsg extends StatelessWidget {
  const ErrorMsg({super.key, this.exception});

  final Exception? exception;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error!\n\n${exception.toString()}',
        textAlign: TextAlign.center,
      ),
    );
  }
}
