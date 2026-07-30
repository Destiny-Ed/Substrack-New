import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:subtrack/core/navigation/app_routes.dart';
import 'package:subtrack/features/dashboard/presentations/widgets/category_breakdown_card.dart';
import 'package:subtrack/features/dashboard/presentations/widgets/dashboard_header.dart';
import 'package:subtrack/features/dashboard/presentations/widgets/dashboard_skeleton.dart';
import 'package:subtrack/features/dashboard/presentations/widgets/empty_widget.dart';
import 'package:subtrack/features/dashboard/presentations/widgets/smart_insight_card.dart';
import 'package:subtrack/features/dashboard/presentations/widgets/spending_summary_card.dart';
import 'package:subtrack/features/dashboard/presentations/widgets/subscription_overview_section.dart';
import 'package:subtrack/features/dashboard/presentations/widgets/todays_attention_card.dart';
import 'package:subtrack/features/dashboard/presentations/widgets/trial_section.dart';
import 'package:subtrack/features/dashboard/presentations/widgets/upcoming_renewal_section.dart';
import 'package:subtrack/features/dashboard/view_models/dashboard_vm.dart';
import 'package:subtrack/features/subscriptions/presentations/add_subscription.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final DashboardViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    _viewModel = context.read<DashboardViewModel>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.load();
    });
  }

  Future<void> _refresh() {
    return _viewModel.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(
      builder: (_, vm, __) {
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            heroTag: 'dashboard_add_subscription',
            onPressed: () async {
              final created = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddSubscriptionScreen()),
              );

              if (created == true && mounted) {
                vm.refresh();
              }
            },
            icon: const Icon(Icons.add),
            label: const Text("Add"),
          ),
          body: SafeArea(
            child: Builder(
              builder: (_) {
                if (vm.isLoading) {
                  return const DashboardSkeleton();
                }

                final summary = vm.summary;

                if (summary == null || summary.isEmpty) {
                  return RefreshIndicator(
                    onRefresh: _refresh,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      children: [
                        DashboardHeader(
                          summary: vm.summary,
                          onSettingsTap: () {
                            // Navigator.pushNamed(context, AppRoutes.settings);
                          },
                        ),
                        SizedBox(height: 24),
                        EmptyDashboard(
                          onAddSubscription: () {
                            context.push(AppRoutes.addSubscription);
                          },
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 120),
                    children: [
                      DashboardHeader(
                        summary: vm.summary,
                        onSettingsTap: () {
                          // Navigator.pushNamed(context, AppRoutes.settings);
                        },
                      ),

                      const SizedBox(height: 24),

                      TodaysAttentionCard(
                        subscription: summary.trialsEndingSoon.isNotEmpty
                            ? summary.trialsEndingSoon.first
                            : summary.upcomingRenewals.isNotEmpty
                            ? summary.upcomingRenewals.first
                            : null,
                        isTrial: summary.trialsEndingSoon.isNotEmpty,
                      ),

                      const SizedBox(height: 20),

                      SpendingSummaryCard(summary: summary, currency: vm.defaultCurrency),

                      if (summary.trialsEndingSoon.isNotEmpty) ...[
                        const SizedBox(height: 28),
                        TrialSection(
                          subscriptions: summary.trialsEndingSoon,
                          onTap: (value) {
                            context.push(AppRoutes.subscriptionDetails, extra: value.id);
                          },
                        ),
                      ],

                      if (summary.upcomingRenewals.isNotEmpty) ...[
                        const SizedBox(height: 28),
                        UpcomingRenewalsSection(subscriptions: summary.upcomingRenewals),
                      ],

                      const SizedBox(height: 28),

                      SubscriptionOverviewSection(
                        subscriptions: vm.subscriptions,
                        onSeeAll: () {
                          context.push(AppRoutes.subscriptions);
                        },
                        onSubscriptionTap: (subscription) {
                          context.push(AppRoutes.subscriptionDetails, extra: subscription.id);
                        },
                      ),

                      if (summary.spendingByCategory.isNotEmpty) ...[
                        const SizedBox(height: 28),
                        CategoryBreakdownCard(
                          categories: summary.spendingByCategory,
                          currency: vm.defaultCurrency,
                        ),
                      ],

                      const SizedBox(height: 28),

                      const SmartInsightCard(),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
