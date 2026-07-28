import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:subtrack/core/di/injection.dart';
import 'package:subtrack/core/navigation/app_routes.dart';
import 'package:subtrack/data/preferences/app_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    final prefs = getIt<AppPreferences>();

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    if (prefs.hasCompletedOnboarding) {
      context.go(AppRoutes.addSubscription);
    } else {
      context.go(AppRoutes.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Splash')));
  }
}
