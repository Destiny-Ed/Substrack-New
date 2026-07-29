import 'package:flutter/material.dart';

class PaywallHeader extends StatelessWidget {
  const PaywallHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        const SizedBox(height: 12),

        Container(
          width: 84,
          height: 84,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(.12),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.workspace_premium_rounded, size: 44, color: theme.colorScheme.primary),
        ),

        const SizedBox(height: 24),

        Text(
          "Stop losing money to forgotten subscriptions",
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, height: 1.2),
        ),

        const SizedBox(height: 16),

        Text(
          "Get reminders before every renewal, track unlimited subscriptions, and stay in complete control of your recurring spending.",
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge?.copyWith(color: Colors.grey.shade700, height: 1.5),
        ),
      ],
    );
  }
}
