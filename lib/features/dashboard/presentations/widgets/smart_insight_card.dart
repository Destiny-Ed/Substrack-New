import 'package:flutter/material.dart';
import 'package:subtrack/features/dashboard/models/dashboard_tip.dart';

class SmartInsightCard extends StatelessWidget {
  const SmartInsightCard({super.key, this.tip});

  final DashboardTip? tip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final dashboardTip = tip ?? _dailyTip;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: dashboardTip.color.withOpacity(.08),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: dashboardTip.color.withOpacity(.15)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: dashboardTip.color.withOpacity(.15),
            child: Icon(dashboardTip.icon, color: dashboardTip.color),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dashboardTip.title,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                Text(
                  dashboardTip.message,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DashboardTip get _dailyTip {
    final tips = _tips;

    final day = DateTime.now().difference(DateTime(2025, 1, 1)).inDays;

    return tips[day % tips.length];
  }

  List<DashboardTip> get _tips => const [
    DashboardTip(
      title: '💡 Tip of the Day',
      message:
          'Review subscriptions you no longer use. Even one cancelled subscription can save money every month.',
      icon: Icons.savings_outlined,
      color: Colors.green,
    ),
    DashboardTip(
      title: 'Free Trial Reminder',
      message: 'Cancel free trials at least one day before they expire to avoid unexpected charges.',
      icon: Icons.workspace_premium_outlined,
      color: Colors.deepPurple,
    ),
    DashboardTip(
      title: 'Yearly Plans',
      message:
          'If you use a service regularly, switching to yearly billing can often reduce your total cost.',
      icon: Icons.calendar_month_outlined,
      color: Colors.blue,
    ),
    DashboardTip(
      title: 'Subscription Audit',
      message:
          'Take five minutes each month to review your recurring payments and remove anything you no longer need.',
      icon: Icons.fact_check_outlined,
      color: Colors.orange,
    ),
    DashboardTip(
      title: 'Stay Organized',
      message:
          'Add notes to your subscriptions so you remember why you signed up and what payment method is used.',
      icon: Icons.sticky_note_2_outlined,
      color: Colors.teal,
    ),
    DashboardTip(
      title: 'Renewal Alert',
      message: 'Enable reminders to receive notifications before your subscriptions renew.',
      icon: Icons.notifications_active_outlined,
      color: Colors.red,
    ),
  ];
}
