import 'package:flutter/material.dart';

class SubscriptionGroupHeader extends StatelessWidget {
  const SubscriptionGroupHeader({super.key, required this.title, required this.icon, required this.count});

  final String title;
  final IconData icon;
  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon, size: 20, color: theme.colorScheme.primary),

        const SizedBox(width: 8),

        Text(title, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),

        const SizedBox(width: 8),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            count.toString(),
            style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
