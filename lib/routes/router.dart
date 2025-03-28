import 'dart:developer';

import 'package:dicoding_flutter/data/local/local_data_source.dart';
import 'package:dicoding_flutter/providers/auth_provider.dart';
import 'package:dicoding_flutter/screen/add_story/add_story_screen.dart';
import 'package:dicoding_flutter/screen/login/login_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../components/action_dialog.dart';
import '../screen/home/home_screen.dart';
import '../screen/location_picker/location_picker_screen.dart';
import '../screen/map_viewer/map_viewer_screen.dart';
import '../screen/register/register_screen.dart';
import '../screen/story/story_screen.dart';
import '../utils/common.dart';
import '../utils/injection.dart';

final routerConfig = GoRouter(
  initialLocation: HomeScreen.routePath,
  refreshListenable: AuthProvider(),
  redirect: (context, state) async {
    final token = await getIt.get<LocalDataSource>().getAuthToken();
    final noAuthRoutes = [LoginScreen.routePath, RegisterScreen.routePath];

    if (token == null && !noAuthRoutes.contains(state.matchedLocation)) {
      return LoginScreen.routePath;
    }

    return null;
  },
  routes: [
    GoRoute(
      path: HomeScreen.routePath,
      builder:
          (context, state) => HomeScreen(
            onLogout: (bool isLoggedIn) {
              context.go(LoginScreen.routePath);
            },
            onDetailStory: (String storyId) {
              context.push(StoryScreen.getRoutePath(storyId));
            },
            onAddStory: () {
              context.push(AddStoryScreen.routePath);
            },
            onDialogLogout: () {
              final localize = AppLocalizations.of(context)!;
              goToLogin() {
                context.go(LoginScreen.routePath);
              }

              actionDialog(
                context: context,
                title: localize.logout,
                content: localize.logoutDialog,
                onAction: () async {
                  await context.read<AuthProvider>().logout();
                  goToLogin();
                },
              );
            },
          ),
    ),
    GoRoute(
      path: LoginScreen.routePath,
      builder:
          (context, state) => LoginScreen(
            toRegister: () {
              context.push(RegisterScreen.routePath);
            },
            onLoggedIn: (bool isLoggedIn) {
              context.go(HomeScreen.routePath);
            },
          ),
    ),
    GoRoute(
      path: RegisterScreen.routePath,
      builder:
          (context, state) => RegisterScreen(
            toLogin: () {
              log('back: ${state.topRoute?.routes}');
              context.pop();
            },
          ),
    ),
    GoRoute(
      path: StoryScreen.routePath,
      builder:
          (context, state) => StoryScreen(
            id: state.pathParameters['id']!,
            onMapView: (latLng) {
              context.push(MapViewerScreen.routePath, extra: latLng);
            },
          ),
    ),
    GoRoute(
      path: MapViewerScreen.routePath,
      builder:
          (context, state) => MapViewerScreen(latLng: state.extra as LatLng),
    ),
    GoRoute(
      path: LocationPickerScreen.routePath,
      builder:
          (context, state) => LocationPickerScreen(
            onPickLocation: (latLng) {
              context.push(AddStoryScreen.routePath, extra: latLng);
            },
          ),
    ),
    GoRoute(
      path: AddStoryScreen.routePath,
      builder:
          (context, state) => AddStoryScreen(
            onStoryAdded: () {
              context.go(HomeScreen.routePath);
            },
            onPickLocation: () {
              context.push(LocationPickerScreen.routePath);
            },
          ),
    ),
  ],
);
