import 'package:flutter/material.dart';
import 'package:subtrack/features/dashboard/models/dashboard_summary.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    super.key,
    required this.summary,
    this.userName,
    this.onSettingsTap,
    this.onProfileTap,
  });

  final DashboardSummary? summary;
  final String? userName;

  final VoidCallback? onSettingsTap;
  final VoidCallback? onProfileTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_greeting()} 👋',
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                _subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onSettingsTap,
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: theme.colorScheme.outline.withValues(alpha: 0.12),
                ),
              ),
              child: Icon(
                Icons.settings_rounded,
                color: theme.colorScheme.onSurfaceVariant,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _greeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning';
    }

    if (hour < 17) {
      return 'Good Afternoon';
    }

    return 'Good Evening';
  }

  String get _subtitle {
    if (summary == null || summary!.isEmpty) {
      return userName == null
          ? 'Ready to start tracking your subscriptions?'
          : 'Hi $userName, let\'s track your first subscription.';
    }

    final trialCount = summary!.trialsEndingSoon.length;
    final renewalCount = summary!.upcomingRenewals.where((e) => e.daysUntilRenewal <= 3).length;

    final attentionCount = trialCount + renewalCount;

    if (attentionCount == 0) {
      return 'Everything is under control today 🎉';
    }

    if (trialCount > 0 && renewalCount > 0) {
      return '$trialCount trial${trialCount > 1 ? 's' : ''} and '
          '$renewalCount renewal${renewalCount > 1 ? 's' : ''} need attention.';
    }

    if (trialCount > 0) {
      return '$trialCount trial${trialCount > 1 ? 's' : ''} ending soon.';
    }

    return '$renewalCount renewal${renewalCount > 1 ? 's' : ''} coming up.';
  }
}
