import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:subtrack/core/enums.dart';
import 'package:subtrack/core/navigation/app_routes.dart';

import '../../../../data/models/subscriptions/subscription_models.dart';

class SubscriptionGroupTile extends StatelessWidget {
  const SubscriptionGroupTile({super.key, required this.subscription});

  final Subscription subscription;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () {
          context.push(AppRoutes.subscriptionDetails, extra: subscription.id);
        },
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              _Logo(subscription),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subscription.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      subscription.category.name,
                      style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                    ),

                    const SizedBox(height: 12),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _PriceChip(subscription: subscription),

                        if (subscription.isTrial) const _StatusChip(label: "Trial", color: Colors.deepPurple),

                        if (subscription.status == SubscriptionStatus.cancelled)
                          const _StatusChip(label: "Cancelled", color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _renewalLabel(),
                    style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 4),

                  Text(DateFormat.MMMd().format(subscription.renewalDate), style: theme.textTheme.bodySmall),

                  const SizedBox(height: 12),

                  const Icon(Icons.chevron_right),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _renewalLabel() {
    final target = subscription.isTrial && subscription.trialEndDate != null
        ? subscription.trialEndDate!
        : subscription.renewalDate;

    final today = DateTime.now();

    final days = DateTime(
      target.year,
      target.month,
      target.day,
    ).difference(DateTime(today.year, today.month, today.day)).inDays;

    if (days <= 0) return "Today";
    if (days == 1) return "Tomorrow";
    if (days <= 7) return "In $days days";

    return "${days} days";
  }
}

class _Logo extends StatelessWidget {
  const _Logo(this.subscription);

  final Subscription subscription;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: Color(subscription.brandColor),
      child: Text(
        subscription.name.characters.first.toUpperCase(),
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
      ),
    );
  }
}

class _PriceChip extends StatelessWidget {
  const _PriceChip({required this.subscription});

  final Subscription subscription;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        "${subscription.currency} ${subscription.price.toStringAsFixed(2)} / ${subscription.billingCycle.name}",
        style: theme.textTheme.labelMedium,
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: color.withOpacity(.12), borderRadius: BorderRadius.circular(100)),
      child: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
