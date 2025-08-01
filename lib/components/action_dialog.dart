import 'package:flutter/material.dart';

import '../common/theme.dart';
import '../l10n/app_localizations.dart';

Future<void> actionDialog({
  required BuildContext context,
  required Function() onAction,
  String? title,
  String? content,
}) async {
  final size = MediaQuery.of(context).size;
  final textTheme = Theme.of(context).textTheme;
  final localize = AppLocalizations.of(context)!;
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: size.width * 0.9,
          height: 220,
          child: Card(
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title != null
                            ? Text(title, style: textTheme.titleLarge)
                            : const SizedBox(),
                        const SizedBox(height: defaultPadding),
                        content != null
                            ? Text(content, style: textTheme.bodyMedium)
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(localize.cancel),
                      ),
                      TextButton(
                        onPressed: () async {
                          onAction();
                        },
                        child: Text(
                          localize.yes,
                          style: textTheme.labelLarge?.copyWith(
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
