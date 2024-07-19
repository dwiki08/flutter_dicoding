import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/providers/auth_provider.dart';
import 'package:dicoding_flutter/routes/page_manager.dart';
import 'package:dicoding_flutter/routes/router_delegate.dart';
import 'package:dicoding_flutter/utils/common.dart';
import 'package:dicoding_flutter/utils/injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/setting_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjection();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PageManager()),
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => SettingProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MyRouterDelegate myRouterDelegate;

  @override
  void initState() {
    super.initState();
    myRouterDelegate = MyRouterDelegate();
    context.read<SettingProvider>().getLocale();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Consumer<SettingProvider>(
      builder: (context, state, child) {
        return MaterialApp(
          locale: state.locale,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          title: appName,
          theme: ThemeData(
            colorScheme: colorScheme(context),
            useMaterial3: true,
            appBarTheme: AppBarTheme(
                color: const Color(0xFF717DBA),
                titleTextStyle: textTheme.titleLarge
                    ?.copyWith(color: Colors.white, fontSize: 20),
                actionsIconTheme: const IconThemeData(color: Colors.white),
                iconTheme: const IconThemeData(color: Colors.white)),
            textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
          ),
          home: Router(
            routerDelegate: myRouterDelegate,
            backButtonDispatcher: RootBackButtonDispatcher(),
          ),
        );
      },
    );
  }
}
