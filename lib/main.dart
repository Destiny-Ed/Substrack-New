import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subtrack/core/di/injection.dart';
import 'package:subtrack/core/navigation/app_router.dart';
import 'package:subtrack/core/providers/app_settings_provider.dart';
import 'package:subtrack/core/theme/app_theme.dart';
import 'package:subtrack/features/dashboard/view_models/dashboard_vm.dart';
import 'package:subtrack/features/subscriptions/view_models/subscription_details_vm.dart';
import 'package:subtrack/features/subscriptions/view_models/subscriptions_viewmodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupInjection();

  final settings = AppSettingsProvider();
  await settings.load();

  runApp(SubtrackApp(settings: settings));
}

class SubtrackApp extends StatelessWidget {
  const SubtrackApp({super.key, required this.settings});

  final AppSettingsProvider settings;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: settings),
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
        ChangeNotifierProvider(create: (_) => SubscriptionDetailsViewModel()),
        ChangeNotifierProvider(create: (_) => SubscriptionsViewModel(repository: getIt())),
      ],
      child: Consumer<AppSettingsProvider>(
        builder: (context, appSettings, _) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Subtrack',
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: appSettings.themeMode,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
