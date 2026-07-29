import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:subtrack/core/enums.dart';
import 'package:subtrack/data/models/subscriptions/subscription_models.dart';
import 'package:subtrack/data/repositories/subscription/subscription_repository.dart';
import 'package:subtrack/features/dashboard/models/dashboard_summary.dart';

class DashboardViewModel extends ChangeNotifier {
  DashboardViewModel({SubscriptionRepository? repository})
    : _repository = repository ?? GetIt.I<SubscriptionRepository>();

  final SubscriptionRepository _repository;

  bool isLoading = false;

  DashboardSummary? summary;

  List<Subscription> _subscriptions = [];

  Future<void> load() async {
    isLoading = true;
    notifyListeners();

    _subscriptions = await _repository.getAll();

    summary = _buildSummary(_subscriptions);

    isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    await load();
  }

  List<Subscription> get subscriptions => List.unmodifiable(_subscriptions);

  String get defaultCurrency {
    if (_subscriptions.isEmpty) {
      return '\$';
    }

    return _subscriptions.first.currency;
  }

  Subscription? get todaysAttention {
    if (summary == null) return null;

    if (summary!.trialsEndingSoon.isNotEmpty) {
      return summary!.trialsEndingSoon.first;
    }

    if (summary!.upcomingRenewals.isNotEmpty) {
      return summary!.upcomingRenewals.first;
    }

    return null;
  }

  bool get attentionIsTrial => summary?.trialsEndingSoon.isNotEmpty ?? false;

  DashboardSummary _buildSummary(List<Subscription> subscriptions) {
    final now = DateTime.now();

    final activeSubscriptions = subscriptions.where(
      (subscription) => subscription.status == SubscriptionStatus.active && !subscription.isArchived,
    );

    final monthlySpend = activeSubscriptions.fold<double>(0, (total, subscription) {
      return total + _monthlyAmount(subscription);
    });

    final yearlySpend = activeSubscriptions.fold<double>(0, (total, subscription) {
      return total + _yearlyAmount(subscription);
    });

    final trials = activeSubscriptions.where((subscription) => subscription.isTrial).toList()
      ..sort((a, b) => a.trialEndDate!.compareTo(b.trialEndDate!));

    final trialsEndingSoon = trials.where((subscription) {
      final days = subscription.trialEndDate!.difference(now).inDays;

      return days >= 0 && days <= 14;
    }).toList();

    final renewals = activeSubscriptions.where((subscription) => !subscription.isTrial).toList()
      ..sort((a, b) => a.renewalDate.compareTo(b.renewalDate));

    final spending = <SubscriptionCategory, double>{};

    for (final subscription in activeSubscriptions) {
      spending.update(
        subscription.category,
        (value) => value + _monthlyAmount(subscription),
        ifAbsent: () => _monthlyAmount(subscription),
      );
    }

    return DashboardSummary(
      monthlySpend: monthlySpend,
      yearlySpend: yearlySpend,
      activeSubscriptions: renewals.length,
      trialSubscriptions: trials.length,
      trialsEndingSoon: trialsEndingSoon,
      upcomingRenewals: renewals,
      spendingByCategory: spending,
    );
  }

  double _monthlyAmount(Subscription subscription) {
    switch (subscription.billingCycle) {
      case BillingCycle.daily:
        return subscription.price * 30;

      case BillingCycle.weekly:
        return subscription.price * 4.33;

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
    }
  }

  double _yearlyAmount(Subscription subscription) {
    switch (subscription.billingCycle) {
      case BillingCycle.daily:
        return subscription.price * 365;

      case BillingCycle.weekly:
        return subscription.price * 52;

      case BillingCycle.monthly:
        return subscription.price * 12;

      case BillingCycle.quarterly:
        return subscription.price * 4;

      case BillingCycle.semiAnnually:
        return subscription.price * 2;

      case BillingCycle.yearly:
        return subscription.price;
      case BillingCycle.custom:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
