import 'package:subtrack/core/enums.dart';
import 'package:subtrack/data/models/subscriptions/subscription_models.dart';

class DashboardSummary {
  final double monthlySpend;
  final double yearlySpend;

  final int activeSubscriptions;
  final int trialSubscriptions;

  final List<Subscription> trialsEndingSoon;
  final List<Subscription> upcomingRenewals;

  final Map<SubscriptionCategory, double> spendingByCategory;

  const DashboardSummary({
    required this.monthlySpend,
    required this.yearlySpend,
    required this.activeSubscriptions,
    required this.trialSubscriptions,
    required this.trialsEndingSoon,
    required this.upcomingRenewals,
    required this.spendingByCategory,
  });

  bool get isEmpty => activeSubscriptions == 0 && trialSubscriptions == 0;

  int get attentionCount {
    return trialsEndingSoon.length + upcomingRenewals.where((e) => e.daysUntilRenewal <= 3).length;
  }

  bool get hasAttention => attentionCount > 0;

  Subscription? get nextAttention {
    if (trialsEndingSoon.isNotEmpty) {
      return trialsEndingSoon.first;
    }

    if (upcomingRenewals.isNotEmpty) {
      return upcomingRenewals.first;
    }

    return null;
  }

  bool get hasTrials => trialSubscriptions > 0;

  bool get hasUpcomingRenewals => upcomingRenewals.isNotEmpty;

  bool get hasCategoryBreakdown => spendingByCategory.isNotEmpty;

  double get averageMonthlySpendPerSubscription {
    if (activeSubscriptions == 0) {
      return 0;
    }

    return monthlySpend / activeSubscriptions;
  }

  SubscriptionCategory? get highestSpendingCategory {
    if (spendingByCategory.isEmpty) {
      return null;
    }

    return spendingByCategory.entries.reduce((a, b) => a.value >= b.value ? a : b).key;
  }

  DashboardSummary copyWith({
    double? monthlySpend,
    double? yearlySpend,
    int? activeSubscriptions,
    int? trialSubscriptions,
    List<Subscription>? trialsEndingSoon,
    List<Subscription>? upcomingRenewals,
    Map<SubscriptionCategory, double>? spendingByCategory,
  }) {
    return DashboardSummary(
      monthlySpend: monthlySpend ?? this.monthlySpend,
      yearlySpend: yearlySpend ?? this.yearlySpend,
      activeSubscriptions: activeSubscriptions ?? this.activeSubscriptions,
      trialSubscriptions: trialSubscriptions ?? this.trialSubscriptions,
      trialsEndingSoon: trialsEndingSoon ?? this.trialsEndingSoon,
      upcomingRenewals: upcomingRenewals ?? this.upcomingRenewals,
      spendingByCategory: spendingByCategory ?? this.spendingByCategory,
    );
  }

  double _monthlyCost(Subscription subscription) {
    switch (subscription.billingCycle) {
      case BillingCycle.weekly:
        return subscription.price * 52 / 12;

      case BillingCycle.monthly:
        return subscription.price;

      case BillingCycle.quarterly:
        return subscription.price / 3;

      case BillingCycle.semiAnnually:
        return subscription.price / 6;

      case BillingCycle.yearly:
        return subscription.price / 12;
      case BillingCycle.custom:
        // TODO: Handle this case.
        throw UnimplementedError();
      case BillingCycle.daily:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
