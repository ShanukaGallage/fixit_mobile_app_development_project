import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/widgets/app_shell.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/map/presentation/map_screen.dart';
import '../../features/reports/presentation/report_screen.dart';
import '../../features/activity/presentation/activity_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/map',
          builder: (context, state) => const MapScreen(),
        ),
        GoRoute(
          path: '/activity',
          builder: (context, state) => const ActivityScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
    // Report screen often covers the whole screen rather than staying in bottom nav shell
    GoRoute(
      path: '/report',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const ReportScreen(),
    ),
  ],
);
