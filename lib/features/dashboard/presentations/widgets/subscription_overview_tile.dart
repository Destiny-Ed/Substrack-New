import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:subtrack/core/enums.dart';
import 'package:subtrack/data/models/subscriptions/subscription_models.dart';

class SubscriptionOverviewTile extends StatelessWidget {
  const SubscriptionOverviewTile({super.key, required this.subscription, this.onTap});

  final Subscription subscription;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final daysRemaining = subscription.renewalDate.difference(DateTime.now()).inDays;

    return Material(
      color: theme.colorScheme.surfaceContainerLow,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Color(subscription.brandColor),
                child: (subscription.logoAsset != null)
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(subscription.logoAsset!, width: 48, height: 48, fit: BoxFit.cover),
                      )
                    : Text(subscription.name.characters.first.toUpperCase()),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subscription.name,
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      '${subscription.category.name} • ${subscription.billingCycle.name}',
                      style: theme.textTheme.bodySmall,
                    ),

                    if (!subscription.isTrial && daysRemaining <= 3)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          daysRemaining <= 0
                              ? '⚠️ Renews today'
                              : '⚠️ Renews in $daysRemaining day${daysRemaining == 1 ? '' : 's'}',
                          style: TextStyle(color: theme.colorScheme.error, fontWeight: FontWeight.w600),
                        ),
                      ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    NumberFormat.currency(symbol: subscription.currency).format(subscription.price),
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  _StatusChip(subscription: subscription),

                  const SizedBox(height: 8),

                  const Icon(Icons.chevron_right),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.subscription});

  final Subscription subscription;

  @override
  Widget build(BuildContext context) {
    late final String text;
    late final Color background;
    late final Color foreground;

    if (subscription.isTrial) {
      text = 'Trial';
      background = Colors.purple.withOpacity(.12);
      foreground = Colors.purple;
    } else {
      switch (subscription.status) {
        case SubscriptionStatus.active:
          text = 'Active';
          background = Colors.green.withOpacity(.12);
          foreground = Colors.green;
          break;

        case SubscriptionStatus.cancelled:
          text = 'Cancelled';
          background = Colors.red.withOpacity(.12);
          foreground = Colors.red;
          break;

        case SubscriptionStatus.expired:
          text = 'Expired';
          background = Colors.orange.withOpacity(.12);
          foreground = Colors.orange;
          break;
        case SubscriptionStatus.paused:
          text = 'Paused';
          background = Colors.blue.withOpacity(.12);
          foreground = Colors.blue;
          break;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(100)),
      child: Text(
        text,
        style: TextStyle(color: foreground, fontWeight: FontWeight.w600, fontSize: 12),
      ),
    );
  }
}
