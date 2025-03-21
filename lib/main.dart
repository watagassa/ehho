// import 'package:ehho/presentation/screens/activity/activity_detail_screen.dart';
import 'package:ehho/presentation/screens/home/home_screen.dart';
import 'package:ehho/presentation/widgets/activity/activity_detail_screen.dart';
import 'package:ehho/presentation/screens/auth/login_screen.dart';
import 'package:ehho/presentation/widgets/history/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

// GoRouter の設定
final GoRouter _router = GoRouter(
  initialLocation: "/login",
  routes: [
    GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
    GoRoute(path: "/home", builder: (context, state) => const HomeScreen()),
  ],
);
