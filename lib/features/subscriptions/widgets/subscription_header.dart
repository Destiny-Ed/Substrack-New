import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/enums.dart';
import '../../../../data/models/subscriptions/subscription_models.dart';

class SubscriptionHeader extends StatelessWidget {
  const SubscriptionHeader({super.key, required this.subscription});

  final Subscription subscription;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 38,
            backgroundColor: Color(subscription.brandColor),
            child: (subscription.logoAsset != null)
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(subscription.logoAsset!, width: 48, height: 48, fit: BoxFit.cover),
                  )
                : Text(subscription.name.characters.first.toUpperCase()),
          ),

          const SizedBox(height: 20),

          Text(
            subscription.name,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            _categoryName(subscription.category),
            style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),

          const SizedBox(height: 20),

          Text(
            "${subscription.currency} ${subscription.price.toStringAsFixed(2)}",
            style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 6),

          Text(_billingCycle(subscription.billingCycle), style: theme.textTheme.bodyMedium),

          const SizedBox(height: 24),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _StatusChip(
                color: _statusColor(subscription),
                icon: _statusIcon(subscription),
                label: _statusLabel(subscription),
              ),

              if (subscription.autoRenew)
                const _StatusChip(color: Colors.green, icon: Icons.autorenew, label: "Auto Renew"),

              if (subscription.isTrial)
                const _StatusChip(
                  color: Colors.deepPurple,
                  icon: Icons.workspace_premium_outlined,
                  label: "Free Trial",
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _billingCycle(BillingCycle cycle) {
    switch (cycle) {
      case BillingCycle.weekly:
        return "per week";
      case BillingCycle.monthly:
        return "per month";
      case BillingCycle.quarterly:
        return "every 3 months";
      case BillingCycle.semiAnnually:
        return "every 6 months";
      case BillingCycle.yearly:
        return "per year";
      case BillingCycle.custom:
        // TODO: Handle this case.
        throw UnimplementedError();
      case BillingCycle.daily:
        return "every 1 day";
    }
  }

  String _categoryName(SubscriptionCategory category) {
    return category.name.replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(1)}').trim();
  }

  Color _statusColor(Subscription subscription) {
    switch (subscription.status) {
      case SubscriptionStatus.active:
        return Colors.green;
      case SubscriptionStatus.cancelled:
        return Colors.red;
      case SubscriptionStatus.paused:
        return Colors.orange;
      case SubscriptionStatus.expired:
        return Colors.grey;
    }
  }

  IconData _statusIcon(Subscription subscription) {
    switch (subscription.status) {
      case SubscriptionStatus.active:
        return Icons.check_circle;
      case SubscriptionStatus.cancelled:
        return Icons.cancel;
      case SubscriptionStatus.paused:
        return Icons.pause_circle;
      case SubscriptionStatus.expired:
        return Icons.history;
    }
  }

  String _statusLabel(Subscription subscription) {
    switch (subscription.status) {
      case SubscriptionStatus.active:
        return "Active";
      case SubscriptionStatus.cancelled:
        return "Cancelled";
      case SubscriptionStatus.paused:
        return "Paused";
      case SubscriptionStatus.expired:
        return "Expired";
    }
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.color, required this.icon, required this.label});

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(color: color.withOpacity(.12), borderRadius: BorderRadius.circular(100)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(color: color, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
