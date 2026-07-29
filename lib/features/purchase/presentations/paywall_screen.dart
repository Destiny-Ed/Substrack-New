import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:subtrack/core/navigation/app_routes.dart';
import 'package:subtrack/features/purchase/presentations/widgets/footer.dart';
import 'package:subtrack/features/purchase/presentations/widgets/paywall_header.dart';
import 'package:subtrack/features/purchase/presentations/widgets/premium_feature_tile.dart';
import 'package:subtrack/features/purchase/presentations/widgets/pricing_card.dart';
import 'package:subtrack/features/purchase/presentations/widgets/purchase_button.dart';
import 'package:subtrack/features/purchase/presentations/widgets/restore_button.dart';
import 'package:subtrack/features/purchase/presentations/widgets/value_card.dart';
import 'package:subtrack/features/purchase/view_model.dart/purchase_viewmodel.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PaywallViewModel()..load(),
      child: Consumer<PaywallViewModel>(
        builder: (_, vm, __) {
          if (vm.isLoading) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }

          final plan = vm.plan!;

          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(24),
                      children: [
                        const PaywallHeader(),

                        const SizedBox(height: 24),

                        const ValueCard(),

                        const SizedBox(height: 32),

                        const PremiumFeatureTile(
                          icon: Icons.notifications_active_rounded,
                          title: "Smart Renewal Reminders",
                          subtitle: "Never miss another subscription renewal.",
                        ),

                        const PremiumFeatureTile(
                          icon: Icons.all_inclusive_rounded,
                          title: "Unlimited Subscriptions",
                          subtitle: "Track every subscription without limits.",
                        ),

                        const PremiumFeatureTile(
                          icon: Icons.bar_chart_rounded,
                          title: "Spending Insights",
                          subtitle: "Understand your recurring monthly costs.",
                        ),

                        const PremiumFeatureTile(
                          icon: Icons.today_rounded,
                          title: "Daily Check-ins",
                          subtitle: "Friendly reminders to keep subscriptions updated.",
                        ),

                        const PremiumFeatureTile(
                          icon: Icons.auto_awesome_rounded,
                          title: "Future Premium Features",
                          subtitle: "You'll automatically receive every Pro update.",
                        ),

                        const SizedBox(height: 28),

                        PricingCard(plan: plan),

                        const SizedBox(height: 20),

                        PurchaseButton(
                          isLoading: vm.isPurchasing,
                          onPressed: () async {
                            final result = await vm.purchase();

                            if (!context.mounted) return;

                            if (result.isSuccess) {
                              context.go(AppRoutes.dashboard);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(result.message ?? "Purchase was cancelled.")),
                              );
                            }
                          },
                        ),

                        const SizedBox(height: 12),

                        RestoreButton(
                          onPressed: () async {
                            final result = await vm.restore();

                            if (!context.mounted) return;

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  result.message ??
                                      (result.isSuccess ? "Purchases restored." : "No purchases found."),
                                ),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 20),

                        const Footer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
