import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:workout_tracker/animation_practice_widget.dart';
import 'package:workout_tracker/frame_page.dart';
import 'package:workout_tracker/profile_page.dart';
import 'package:workout_tracker/reset_password_page.dart';
import 'package:workout_tracker/settings_page.dart';
import 'package:workout_tracker/workout_guide_page.dart';
import 'package:workout_tracker/workout_home.dart';
import 'landing_page.dart';
import 'package:flutter/services.dart';
import 'login_page.dart';
import 'workout_list_page.dart';
import 'registration_page.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 화면 방향 설정
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Firebase 초기화
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Firebase 초기화 성공");
  } catch (e) {
    print("Firebase 초기화 실패: $e");
  }

  // 앱 실행
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _homeTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'homeTab');
final GlobalKey<NavigatorState> _settingsTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'settingsTab');

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        // return const AnimationPracticeWidget();
        return const LandingPage();
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
                        final int groupIndex = int.tryParse(
                                state.pathParameters['group_index'] ?? '0') ??
                            0;
                        return WorkoutListPage(
                          groupIndex: groupIndex,
                        );
                      },
                      routes: [
                        GoRoute(
                          path: 'guild/:index',
                          builder: (BuildContext context, GoRouterState state) {
                            final int groupIndex = int.tryParse(
                                    state.pathParameters['group_index'] ??
                                        '0') ??
                                0;
                            final int id = int.tryParse(
                                    state.pathParameters['index'] ?? '0') ??
                                0;
                            return WorkoutGuidePage(
                              groupIndex: groupIndex,
                              index: id,
                              key: UniqueKey(),
                            );
                          },
                        ),
                      ]),
                  GoRoute(
                    path: 'workout_list',
                    builder: (BuildContext context, GoRouterState state) {
                      return WorkoutListPage(
                        groupIndex: -1,
                      );
                    },
                  ),
                ]),
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
                  routes: [
                    GoRoute(
                      path: 'registration',
                      builder: (context, state) {
                        return RegistrationPage();
                      },
                    ),
                    GoRoute(
                      path: 'reset_password',
                      builder: (context, state) {
                        return ResetPasswordPage();
                      },
                    ),
                    GoRoute(
                      path: 'profile',
                      builder: (context, state) {
                        return ProfilePage();
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
  redirect: (context, state) {
    User? user = FirebaseAuth.instance.currentUser;
    if ( (user == null) &&
        (state.uri.path != '/settings/login/registration' &&
            state.uri.path != '/settings/login/reset_password' &&
            state.uri.path != '/')) {
      return '/settings/login';
    }
    //settings tab클릭했을때 로그인 상태에따라 화면 이동
    if(user !=null && (state.uri.path == '/settings/login' || state.uri.path == '/settings/login/registration')){
      return '/settings';
    }
  },
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
