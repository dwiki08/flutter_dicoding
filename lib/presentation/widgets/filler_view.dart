import 'package:flutter/material.dart';

class FillerView extends StatelessWidget {
  const FillerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      key: Key('filler_view'),
      child: Icon(
        Icons.ac_unit,
        size: 42,
      ),
    );
  }
}
