// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:subtrack/features/dashboard/models/dashboard_summary.dart';

// class SpendingSummaryCard extends StatelessWidget {
//   const SpendingSummaryCard({super.key, required this.summary, required this.currency});

//   final DashboardSummary summary;
//   final String currency;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(28),
//         gradient: LinearGradient(
//           colors: [theme.colorScheme.primary, theme.colorScheme.primary.withOpacity(.82)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Monthly Spending', style: theme.textTheme.titleMedium?.copyWith(color: Colors.white70)),

//           const SizedBox(height: 8),

//           Text(
//             _format(summary.monthlySpend),
//             style: theme.textTheme.displaySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
//           ),

//           const SizedBox(height: 4),

//           Text(
//             '$currency • ${summary.activeSubscriptions} Active • ${summary.trialSubscriptions} Trials',
//             style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white70),
//           ),

//           const SizedBox(height: 24),

//           Row(
//             children: [
//               Expanded(
//                 child: _InfoTile(title: 'Yearly', value: _format(summary.yearlySpend)),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: _InfoTile(title: 'Upcoming', value: '${summary.upcomingRenewals.length}'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   String _format(double value) {
//     return NumberFormat.currency(symbol: currency, decimalDigits: 2).format(value);
//   }
// }

// class _InfoTile extends StatelessWidget {
//   const _InfoTile({required this.title, required this.value});

//   final String title;
//   final String value;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(.14),
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title, style: const TextStyle(color: Colors.white70)),
//           const SizedBox(height: 4),
//           Text(
//             value,
//             style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/dashboard_summary.dart';

class SpendingSummaryCard extends StatelessWidget {
  const SpendingSummaryCard({super.key, required this.summary, required this.currency, this.onTap});

  final DashboardSummary summary;
  final String currency;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              colors: [Color(0xff4F46E5), Color(0xff2563EB)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.account_balance_wallet_outlined, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    "Monthly Spending",
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Text(
                NumberFormat.currency(symbol: currency, decimalDigits: 2).format(summary.monthlySpend),
                style: theme.textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Across ${summary.activeSubscriptions} active subscriptions",
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white.withOpacity(.9)),
              ),

              const SizedBox(height: 28),

              Row(
                children: [
                  Expanded(
                    child: _MetricCard(
                      label: "Active",
                      value: summary.activeSubscriptions.toString(),
                      icon: Icons.check_circle_outline,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _MetricCard(
                      label: "Trials",
                      value: summary.trialSubscriptions.toString(),
                      icon: Icons.workspace_premium_outlined,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _MetricCard(
                      label: "Yearly",
                      value: NumberFormat.compactCurrency(symbol: currency).format(summary.yearlySpend),
                      icon: Icons.calendar_month_outlined,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.label, required this.value, required this.icon});

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.12),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 22),
          const SizedBox(height: 10),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
