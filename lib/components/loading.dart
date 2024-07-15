import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/utils/common.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    final localize = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: defaultPadding),
          Text('${localize.loading}....')
        ],
      ),
    );
  }
}
