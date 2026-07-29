import 'package:flutter/material.dart';

class EmptyDashboard extends StatelessWidget {
  const EmptyDashboard({super.key, this.onAddSubscription});

  final VoidCallback? onAddSubscription;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          children: [
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(color: theme.colorScheme.primaryContainer, shape: BoxShape.circle),
              child: Icon(Icons.subscriptions_outlined, size: 72, color: theme.colorScheme.primary),
            ),

            const SizedBox(height: 32),

            Text(
              "Welcome to Subtrack",
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Text(
              "Track every subscription, avoid unwanted renewals, and never lose money to forgotten free trials.",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 40),

            FilledButton.icon(
              onPressed: onAddSubscription,
              icon: const Icon(Icons.add),
              label: const Text("Add Your First Subscription"),
            ),

            const SizedBox(height: 20),

            Text(
              "It only takes a few seconds.",
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
