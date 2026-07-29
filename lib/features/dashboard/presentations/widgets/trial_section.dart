import 'package:flutter/material.dart';
import 'package:subtrack/data/models/subscriptions/subscription_models.dart';
import 'package:subtrack/features/dashboard/presentations/widgets/trial_subscription_card.dart';

class TrialSection extends StatelessWidget {
  const TrialSection({super.key, required this.subscriptions, this.onSeeAll, this.onTap});

  final List<Subscription> subscriptions;
  final VoidCallback? onSeeAll;
  final ValueChanged<Subscription>? onTap;

  @override
  Widget build(BuildContext context) {
    if (subscriptions.isEmpty) {
      return const SizedBox.shrink();
    }

    final visibleTrials = subscriptions.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Free Trials", style: Theme.of(context).textTheme.titleLarge),
            const Spacer(),
            if (subscriptions.length > 5) TextButton(onPressed: onSeeAll, child: const Text("See all")),
          ],
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 175,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: visibleTrials.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, index) {
              final subscription = visibleTrials[index];

              return TrialSubscriptionCard(
                subscription: subscription,
                onTap: () => onTap?.call(subscription),
              );
            },
          ),
        ),
      ],
    );
  }
}
