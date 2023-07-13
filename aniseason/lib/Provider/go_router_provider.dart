import 'package:aniseason/Routes/named_routes.dart';
import 'package:aniseason/Screens/anime_seasons_screen.dart';
import 'package:aniseason/Screens/animeinfo_screen.dart';
import 'package:aniseason/Screens/dashboard_screen.dart';
import 'package:aniseason/Screens/homepage_screen.dart';
import 'package:aniseason/Screens/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../Models/anime_model.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = ChangeNotifierProvider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/animeInfo',
        name: animeInfo,
        builder: (context, state) {
          AnimeModel anime = state.extra as AnimeModel;
          return AnimeInfo(
            key: state.pageKey,
            anime: anime,
          );
        },
      ),
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) => DashBoard(child: child),
        routes: [
          GoRoute(
            path: '/',
            name: home,
            pageBuilder: (context, state) => NoTransitionPage(
              child: HomePage(
                key: state.pageKey,
              ),
            ),
          ),
          GoRoute(
            path: '/seasons',
            name: seasons,
            pageBuilder: (context, state) => NoTransitionPage(
              child: AnimeSeasons(
                key: state.pageKey,
              ),
            ),
          ),
          GoRoute(
            path: '/schedule',
            name: schedule,
            pageBuilder: (context, state) => NoTransitionPage(
              child: AnimeSchedule(
                key: state.pageKey,
              ),
            ),
          )
        ],
      )
    ],
  );
});
