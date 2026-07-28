import 'package:flutter/material.dart';
import 'package:subtrack/core/di/injection.dart';
import 'package:subtrack/core/navigation/app_router.dart';
import 'package:subtrack/data/enums.dart';
import 'package:subtrack/data/models/subscriptions/subscription_models.dart';
import 'package:subtrack/data/repositories/subscription/subscription_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupInjection();

  runApp(const SubtrackApp());
}

void test() async {
  final repository = getIt<SubscriptionRepository>();

  await repository.save(
    Subscription.create(
      name: 'Netflix',
      category: SubscriptionCategory.streaming,
      price: 15.99,
      currency: 'USD',
      billingCycle: BillingCycle.monthly,
      renewalDate: DateTime.now().add(const Duration(days: 30)),
    ),
  );

  final subscriptions = await repository.getAll();

  debugPrint(subscriptions.first.toJson().toString());
}

class SubtrackApp extends StatelessWidget {
  const SubtrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(debugShowCheckedModeBanner: false, routerConfig: appRouter);
  }
}
