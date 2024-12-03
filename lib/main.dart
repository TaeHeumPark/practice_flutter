import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:workout_tracker/animation_practice_widget.dart';
import 'package:workout_tracker/frame_page.dart';
import 'package:workout_tracker/settings_page.dart';
import 'package:workout_tracker/workout_guide_page.dart';
import 'package:workout_tracker/workout_home.dart';
import 'landing_page.dart';
import 'package:flutter/services.dart';
import 'login_page.dart';
import 'workout_list_page.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeTabNavigatorKey =GlobalKey<NavigatorState>(debugLabel: 'homeTab');
final GlobalKey<NavigatorState> _settingsTabNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'settingsTab');

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const AnimationPracticeWidget();
      },
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state, navigationShell) {
        return FramePage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/workout_home',
              builder: (BuildContext context, GoRouterState state) {
                return WorkoutHome();
              },
              routes: [
                GoRoute(
                  path: 'workout_list/:group_index',
                  builder: (BuildContext context, GoRouterState state) {
                    final int groupIndex = int.tryParse(state.pathParameters['group_index'] ?? '0') ?? 0;
                    return WorkoutListPage(groupIndex: groupIndex,);
                  },
                    routes: [
                      GoRoute(
                        path: 'guild/:index',
                        builder: (BuildContext context, GoRouterState state) {
                          final int groupIndex = int.tryParse(state.pathParameters['group_index'] ?? '0') ?? 0;
                          final int id = int.tryParse(state.pathParameters['index'] ?? '0') ?? 0;
                          return WorkoutGuidePage(
                            groupIndex: groupIndex,
                            index: id,
                            key: UniqueKey(),
                          );
                        },
                      ),
                    ]
                ),
                GoRoute(
                  path: 'workout_list',
                  builder: (BuildContext context, GoRouterState state) {
                    return WorkoutListPage(groupIndex: -1,);
                  },
                ),
              ]
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/settings',
              builder: (context, state) {
                return SettingsPage();
              },
              routes: [
                GoRoute(
                  path: 'login',
                  builder: (context, state) {
                    return LoginPage();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: FlexThemeData.light(scheme: FlexScheme.redWine),
    );
  }
}

