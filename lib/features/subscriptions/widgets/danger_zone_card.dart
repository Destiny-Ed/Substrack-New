import 'package:flutter/material.dart';
import 'package:subtrack/core/enums.dart';

import '../../../../data/models/subscriptions/subscription_models.dart';

class DangerZoneCard extends StatelessWidget {
  const DangerZoneCard({super.key, required this.subscription, this.onArchive, this.onCancel, this.onDelete});

  final Subscription subscription;

  final VoidCallback? onArchive;
  final VoidCallback? onCancel;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.red.withOpacity(.15)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Danger Zone",
              style: theme.textTheme.titleLarge?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              "These actions may permanently affect this subscription.",
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),

            const SizedBox(height: 24),

            _DangerTile(
              icon: Icons.archive_outlined,
              title: "Archive",
              subtitle: "Hide this subscription without deleting it.",
              color: Colors.orange,
              onTap: onArchive,
            ),

            if (subscription.status != SubscriptionStatus.cancelled)
              _DangerTile(
                icon: Icons.cancel_outlined,
                title: "Cancel Subscription",
                subtitle: "Mark this subscription as cancelled and stop future reminders.",
                color: Colors.deepOrange,
                onTap: onCancel,
              ),

            _DangerTile(
              icon: Icons.delete_outline,
              title: "Delete Subscription",
              subtitle: "Permanently remove this subscription.",
              color: Colors.red,
              onTap: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

class _DangerTile extends StatelessWidget {
  const _DangerTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: color.withOpacity(.06),
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: color.withOpacity(.15),
                  child: Icon(icon, color: color),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold, color: color),
                      ),

                      const SizedBox(height: 4),

                      Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),

                Icon(Icons.chevron_right, color: color),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
