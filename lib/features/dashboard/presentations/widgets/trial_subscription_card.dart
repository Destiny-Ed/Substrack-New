import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:subtrack/data/models/subscriptions/subscription_models.dart';

 
class TrialSubscriptionCard extends StatelessWidget {
  const TrialSubscriptionCard({super.key, required this.subscription, this.onTap});

  final Subscription subscription;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final remainingDays = subscription.trialEndDate?.difference(DateTime.now()).inDays ?? 0;

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.deepPurple.shade50,
          border: Border.all(color: Colors.deepPurple.shade100),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Color(subscription.brandColor),
                  child: Text(
                    subscription.name.characters.first.toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),

                const Spacer(),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Text(
                    "TRIAL",
                    style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const Spacer(),

            Text(
              subscription.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            Text(subscription.category.name, style: theme.textTheme.bodySmall),

            const SizedBox(height: 16),

            Text(
              "Ends ${DateFormat.yMMMd().format(subscription.trialEndDate!)}",
              style: theme.textTheme.bodyMedium,
            ),

            const SizedBox(height: 4),

            Text(
              remainingDays <= 0 ? "Ends today" : "$remainingDays day${remainingDays == 1 ? "" : "s"} left",
              style: TextStyle(
                color: remainingDays <= 1 ? Colors.red : Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            FilledButton(onPressed: onTap, child: const Text("Review")),
          ],
        ),
      ),
    );
  }
}
