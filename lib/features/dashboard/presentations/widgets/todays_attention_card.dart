import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:subtrack/core/navigation/app_routes.dart';
import 'package:subtrack/data/models/subscriptions/subscription_models.dart';

class TodaysAttentionCard extends StatelessWidget {
  const TodaysAttentionCard({super.key, this.subscription, this.isTrial = false});

  final Subscription? subscription;
  final bool isTrial;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (subscription == null) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(24)),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.check, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You're all caught up 🎉",
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text("No renewals or trial expirations today."),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.orange,
            child: Icon(
              isTrial ? Icons.workspace_premium_outlined : Icons.notifications_active,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isTrial ? "Trial Ending Soon" : "Upcoming Renewal",
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(subscription!.name, style: theme.textTheme.titleSmall),
                const SizedBox(height: 4),
                Text(isTrial ? "Review before your free trial ends." : "Your subscription renews soon."),
              ],
            ),
          ),
          FilledButton(
            onPressed: () {
              context.push(AppRoutes.subscriptionDetails, extra: subscription?.id ?? "");
            },
            child: const Text("Review"),
          ),
        ],
      ),
    );
  }
}
