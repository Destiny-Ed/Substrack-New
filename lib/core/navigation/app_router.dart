import 'package:go_router/go_router.dart';
import 'package:subtrack/features/dashboard/presentations/dashboard_screen.dart';
import 'package:subtrack/features/onboarding/presentation/onboarding_screen.dart';
import 'package:subtrack/features/onboarding/presentation/splash_screen.dart';
import 'package:subtrack/features/settings/presentation/settings_screen.dart';
import 'package:subtrack/features/shell/main_shell.dart';
import 'package:subtrack/features/subscriptions/presentations/add_subscription.dart';
import 'package:subtrack/features/subscriptions/presentations/subscriptions_details_screen.dart';
import 'package:subtrack/features/subscriptions/presentations/subscriptions_screen.dart';
import 'package:subtrack/features/summary/presentation/summary_screen.dart';
import 'app_routes.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    // Auth / Onboarding flows (no bottom nav)
    GoRoute(path: AppRoutes.splash, builder: (_, __) => const SplashScreen()),
    GoRoute(path: AppRoutes.onboarding, builder: (_, __) => const OnboardingScreen()),
    GoRoute(path: AppRoutes.addSubscription, builder: (_, __) => const AddSubscriptionScreen()),
    GoRoute(
      path: AppRoutes.subscriptionDetails,
      builder: (_, param) => SubscriptionDetailsScreen(
        subscriptionId: param.extra as String,
      ),
    ),

    // Main app shell with bottom navigation
    ShellRoute(
      builder: (context, state, child) => MainShell(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.dashboard,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: DashboardScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.subscriptions,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SubscriptionsScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.summary,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SummaryScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.settings,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SettingsScreen(),
          ),
        ),
      ],
    ),
  ],
);
