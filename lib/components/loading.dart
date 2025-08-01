import 'package:dicoding_flutter/common/theme.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

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
          Text('${localize.loading}....'),
        ],
      ),
    );
  }
}
