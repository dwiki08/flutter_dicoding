import 'package:dicoding_flutter/components/logout_dialog.dart';
import 'package:dicoding_flutter/data/local/local_data_source.dart';
import 'package:dicoding_flutter/routes/route_screen_key.dart';
import 'package:dicoding_flutter/screen/add_story/add_story_screen.dart';
import 'package:dicoding_flutter/screen/home/home_screen.dart';
import 'package:dicoding_flutter/screen/login/login_screen.dart';
import 'package:dicoding_flutter/screen/register/register_screen.dart';
import 'package:dicoding_flutter/screen/splash/splash_screen.dart';
import 'package:dicoding_flutter/screen/story/story_screen.dart';
import 'package:dicoding_flutter/utils/injection.dart';
import 'package:flutter/material.dart';

class MyRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  late final GlobalKey<NavigatorState> _navigatorKey;

  MyRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>() {
    _init();
  }

  _init() async {
    final token = await localDataSource.getAuthToken();
    isLoggedIn = token != null;
    notifyListeners();
  }

  LocalDataSource localDataSource = getIt.get();
  String? mainScreen = RouteKey.login;
  List<Page> historyStack = [];

  bool? isLoggedIn;
  String? storyId;
  bool? onAddStory;
  bool? onLogoutDialog;

  List<Page> get _splashStack => const [
        MaterialPage(
          key: ValueKey(RouteKey.splash),
          child: SplashScreen(),
        ),
      ];

  List<Page> get _loggedOutStack => [
        MaterialPage(
          key: const ValueKey(RouteKey.login),
          child: LoginScreen(
            toRegister: () {
              mainScreen = RouteKey.register;
              notifyListeners();
            },
            onLoggedIn: (isLoggedIn) {
              this.isLoggedIn = isLoggedIn;
              notifyListeners();
            },
          ),
        ),
        if (mainScreen == RouteKey.register)
          MaterialPage(
            key: const ValueKey(RouteKey.register),
            child: RegisterScreen(
              toLogin: () {
                mainScreen = RouteKey.login;
                notifyListeners();
              },
            ),
          ),
      ];

  List<Page> get _loggedInStack => [
        MaterialPage(
          key: const ValueKey(RouteKey.home),
          child: HomeScreen(
            onLogout: (isLoggedIn) {
              this.isLoggedIn = isLoggedIn;
              notifyListeners();
            },
            onDetailStory: (storyId) {
              this.storyId = storyId;
              notifyListeners();
            },
            onAddStory: () {
              onAddStory = true;
              notifyListeners();
            },
            onDialogLogout: () {
              onLogoutDialog = true;
              notifyListeners();
            },
          ),
        ),
        if (storyId != null)
          MaterialPage(
            key: ValueKey(RouteKey.story + storyId!),
            child: StoryScreen(
              id: storyId!,
            ),
          ),
        if (onAddStory == true)
          MaterialPage(
            key: const ValueKey(RouteKey.addStory),
            child: AddStoryScreen(
              onStoryAdded: () {
                onAddStory = false;
                notifyListeners();
              },
            ),
          ),
        if (onLogoutDialog == true)
          LogoutDialog(onLogout: (bool isLoggedOut) {
            onLogoutDialog = false;
            if (isLoggedOut) {
              isLoggedIn = false;
            }
            notifyListeners();
          }),
      ];

  onBack() {
    storyId = null;
    onAddStory = null;
    onLogoutDialog = null;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == null) {
      historyStack = _splashStack;
    } else if (isLoggedIn == true) {
      historyStack = _loggedInStack;
    } else {
      historyStack = _loggedOutStack;
    }

    return Navigator(
      key: navigatorKey,
      pages: historyStack,
      onPopPage: (route, result) {
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }

        onBack();

        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
