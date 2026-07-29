import 'package:flutter/material.dart';

class ReminderCard extends StatelessWidget {
  const ReminderCard({
    super.key,
    required this.reminderDays,
    required this.notificationsEnabled,
    this.onEnableNotifications,
  });

  final List<int> reminderDays;
  final bool notificationsEnabled;
  final VoidCallback? onEnableNotifications;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final reminders = [...reminderDays]..sort((a, b) => b.compareTo(a));

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.notifications_active_outlined, color: theme.colorScheme.primary),
              const SizedBox(width: 12),
              Text('Reminders', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),

          const SizedBox(height: 20),

          _NotificationStatusCard(enabled: notificationsEnabled, onEnable: onEnableNotifications),

          const SizedBox(height: 20),

          Text('Reminder Schedule', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),

          const SizedBox(height: 12),

          if (reminders.isEmpty)
            Text('No reminders configured.', style: theme.textTheme.bodyMedium)
          else
            Wrap(spacing: 10, runSpacing: 10, children: reminders.map((e) => _ReminderChip(day: e)).toList()),
        ],
      ),
    );
  }
}

class _NotificationStatusCard extends StatelessWidget {
  const _NotificationStatusCard({required this.enabled, this.onEnable});

  final bool enabled;
  final VoidCallback? onEnable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final color = enabled ? Colors.green : Colors.orange;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(.2)),
      ),
      child: Row(
        children: [
          Icon(enabled ? Icons.check_circle_outline : Icons.notifications_off_outlined, color: color),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  enabled ? 'Notifications Enabled' : 'Notifications Disabled',
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 4),

                Text(
                  enabled
                      ? "You'll receive reminder notifications before renewal."
                      : "Enable notifications so Subtrack can remind you before you're charged.",
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),

          if (!enabled) FilledButton.tonal(onPressed: onEnable, child: const Text('Enable')),
        ],
      ),
    );
  }
}

class _ReminderChip extends StatelessWidget {
  const _ReminderChip({required this.day});

  final int day;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Chip(
      avatar: const Icon(Icons.schedule, size: 18),
      label: Text(_label),
      backgroundColor: theme.colorScheme.primaryContainer,
      side: BorderSide.none,
      visualDensity: VisualDensity.compact,
    );
  }

  String get _label {
    switch (day) {
      case 0:
        return 'Renewal day';
      case 1:
        return '1 day before';
      default:
        return '$day days before';
    }
  }
}
