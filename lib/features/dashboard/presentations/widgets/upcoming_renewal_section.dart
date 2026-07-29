import 'package:flutter/material.dart';
import 'package:subtrack/data/models/subscriptions/subscription_models.dart';
import 'package:subtrack/features/dashboard/presentations/widgets/upcoming_subscription_card.dart';

class UpcomingRenewalsSection extends StatelessWidget {
  const UpcomingRenewalsSection({super.key, required this.subscriptions});

  final List<Subscription> subscriptions;

  @override
  Widget build(BuildContext context) {
    if (subscriptions.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Upcoming Renewals', style: Theme.of(context).textTheme.titleLarge),

        const SizedBox(height: 16),

        SizedBox(
          height: 205,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: subscriptions.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, index) {
              return UpcomingSubscriptionCard(subscription: subscriptions[index]);
            },
          ),
        ),
      ],
    );
  }
}
