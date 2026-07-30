import 'package:flutter/material.dart';

class EmptySubscriptionList extends StatelessWidget {
  const EmptySubscriptionList({
    super.key,
    this.isSearching = false,
    this.onClearSearch,
    this.onAddSubscription,
  });

  final bool isSearching;
  final VoidCallback? onClearSearch;
  final VoidCallback? onAddSubscription;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(color: theme.colorScheme.primaryContainer, shape: BoxShape.circle),
              child: Icon(
                isSearching ? Icons.search_off_rounded : Icons.subscriptions_outlined,
                size: 54,
                color: theme.colorScheme.primary,
              ),
            ),

            const SizedBox(height: 24),

            Text(
              isSearching ? 'No subscriptions found' : 'No subscriptions yet',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Text(
              isSearching
                  ? 'Try a different search or filter.'
                  : 'Start tracking your subscriptions to stay ahead of renewals and free trials.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 28),

            FilledButton.icon(
              onPressed: isSearching ? onClearSearch : onAddSubscription,
              icon: Icon(isSearching ? Icons.refresh : Icons.add),
              label: Text(isSearching ? 'Clear Search' : 'Add Subscription'),
            ),
          ],
        ),
      ),
    );
  }
}
