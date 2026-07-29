import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:subtrack/data/models/subscriptions/subscription_models.dart';

class UpcomingSubscriptionCard extends StatelessWidget {
  const UpcomingSubscriptionCard({super.key, required this.subscription});

  final Subscription subscription;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final days = subscription.renewalDate.difference(DateTime.now()).inDays;

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        // TODO
        // Navigate to details
      },
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: theme.colorScheme.surfaceContainerHighest,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(subscription.brandColor),
                  child: Text(
                    subscription.name.characters.first.toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Text(
                  NumberFormat.currency(symbol: subscription.currency).format(subscription.price),
                  style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 2),

            const Spacer(),

            Text(
              subscription.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            Text(subscription.category.name),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                days == 0 ? 'Today' : 'In $days days',
                style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.bold),
              ),
            ),

            const Spacer(),

            FilledButton(onPressed: () {}, child: const Text("Review")),
          ],
        ),
      ),
    );
  }
}
