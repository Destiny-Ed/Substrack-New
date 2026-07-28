import 'package:go_router/go_router.dart';
import 'package:subtrack/features/onboarding/presentation/onboarding_screen.dart';
import 'package:subtrack/features/onboarding/presentation/splash_screen.dart';
import 'app_routes.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(path: AppRoutes.splash, builder: (_, __) => const SplashScreen()),
    GoRoute(path: AppRoutes.onboarding, builder: (_, __) => const OnboardingScreen()),
    // GoRoute(path: AppRoutes.addSubscription, builder: (_, __) => const AddSubscriptionScreen()),
    // GoRoute(path: AppRoutes.summary, builder: (_, __) => const SummaryScreen()),
    // GoRoute(path: AppRoutes.paywall, builder: (_, __) => const PaywallScreen()),
    // GoRoute(path: AppRoutes.dashboard, builder: (_, __) => const DashboardScreen()),
  ],
);
