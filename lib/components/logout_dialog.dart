import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/providers/auth_provider.dart';
import 'package:dicoding_flutter/routes/route_screen_key.dart';
import 'package:dicoding_flutter/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoutDialog extends Page {
  const LogoutDialog({required this.onLogout})
      : super(key: const ValueKey(RouteKey.dialog));

  final Function(bool isLoggedOut) onLogout;

  @override
  Route createRoute(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final localize = AppLocalizations.of(context)!;
    return DialogRoute(
      settings: this,
      barrierDismissible: true,
      barrierColor: Colors.black87,
      builder: (context) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: size.width * 0.8,
            height: 200,
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
                        Text(
                          localize.logout,
                          style: textTheme.titleLarge,
                        ),
                        const SizedBox(height: defaultPadding),
                        Text(
                          localize.logoutDialog,
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => onLogout(false),
                          child: Text(
                            localize.cancel,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await context.read<AuthProvider>().logout();
                            onLogout(true);
                          },
                          child: Text(
                            localize.yes,
                            style: textTheme.labelLarge
                                ?.copyWith(color: Colors.blueAccent),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      context: context,
    );
  }
}
