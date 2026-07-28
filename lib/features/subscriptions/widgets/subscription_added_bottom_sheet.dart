import 'package:flutter/material.dart';
import 'package:subtrack/core/enums.dart';

Future<AddSubscriptionAction?> showSubscriptionAddedBottomSheet({
  required BuildContext context,
  required String serviceName,
}) {
  return showModalBottomSheet<AddSubscriptionAction>(
    context: context,
    isDismissible: false,
    enableDrag: false,
    useSafeArea: true,
    showDragHandle: true,
    builder: (_) {
      return SubscriptionAddedBottomSheet(serviceName: serviceName);
    },
  );
}

class SubscriptionAddedBottomSheet extends StatelessWidget {
  const SubscriptionAddedBottomSheet({super.key, required this.serviceName});

  final String serviceName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(color: Colors.green.withOpacity(.12), shape: BoxShape.circle),
              child: const Icon(Icons.check_circle_rounded, color: Colors.green, size: 56),
            ),

            const SizedBox(height: 15),

            Text(
              'Subscription Added',
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              '$serviceName is now being tracked.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),

            const SizedBox(height: 8),

            Text(
              'We\'ll remind you before your renewal date so you never miss a payment.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: FilledButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add Another'),
                onPressed: () {
                  Navigator.pop(context, AddSubscriptionAction.addAnother);
                },
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context, AddSubscriptionAction.continueToPaywall);
                },
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
