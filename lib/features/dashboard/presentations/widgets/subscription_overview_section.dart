import 'package:flutter/material.dart';
import 'package:subtrack/data/models/subscriptions/subscription_models.dart';
import 'package:subtrack/features/dashboard/presentations/widgets/subscription_overview_tile.dart';

class SubscriptionOverviewSection extends StatelessWidget {
  const SubscriptionOverviewSection({
    super.key,
    required this.subscriptions,
    this.onSeeAll,
    this.onSubscriptionTap,
  });

  final List<Subscription> subscriptions;
  final VoidCallback? onSeeAll;
  final ValueChanged<Subscription>? onSubscriptionTap;

  @override
  Widget build(BuildContext context) {
    if (subscriptions.isEmpty) {
      return const SizedBox.shrink();
    }

    final visibleSubscriptions = subscriptions.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('All Subscriptions', style: Theme.of(context).textTheme.titleLarge),
            const Spacer(),
            TextButton(onPressed: onSeeAll, child: const Text('See all')),
          ],
        ),
        const SizedBox(height: 16),
        ListView.separated(
          itemCount: visibleSubscriptions.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (_, index) {
            final subscription = visibleSubscriptions[index];

            return SubscriptionOverviewTile(
              subscription: subscription,
              onTap: () => onSubscriptionTap?.call(subscription),
            );
          },
        ),
      ],
    );
  }
}
