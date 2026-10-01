import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: FixItApp(),
    ),
  );
}

class FixItApp extends ConsumerWidget {
  const FixItApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'FixIt',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Respect device theme settings
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
