import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/enums.dart';

class CategoryBreakdownCard extends StatelessWidget {
  const CategoryBreakdownCard({super.key, required this.categories, required this.currency});

  final Map<SubscriptionCategory, double> categories;
  final String currency;

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    final items = categories.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

    final total = items.fold<double>(0, (sum, item) => sum + item.value);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Spending by Category",
            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          ...items.map(
            (entry) => Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: _CategoryItem(
                category: entry.key,
                amount: entry.value,
                total: total,
                currency: currency,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.category,
    required this.amount,
    required this.total,
    required this.currency,
  });

  final SubscriptionCategory category;
  final double amount;
  final double total;
  final String currency;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final percentage = total == 0 ? 0.0 : amount / total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: _color(category).withOpacity(.15),
              child: Icon(_icon(category), color: _color(category), size: 18),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                _title(category),
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),

            Text(
              NumberFormat.currency(symbol: currency).format(amount),
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),

        const SizedBox(height: 10),

        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: LinearProgressIndicator(
            value: percentage,
            minHeight: 8,
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            valueColor: AlwaysStoppedAnimation(_color(category)),
          ),
        ),

        const SizedBox(height: 6),

        Align(
          alignment: Alignment.centerRight,
          child: Text("${(percentage * 100).toStringAsFixed(0)}%", style: theme.textTheme.bodySmall),
        ),
      ],
    );
  }

  String _title(SubscriptionCategory category) {
    switch (category) {
      case SubscriptionCategory.entertainment:
        return "Entertainment";
      case SubscriptionCategory.productivity:
        return "Productivity";
      case SubscriptionCategory.music:
        return "Music";
      case SubscriptionCategory.streaming:
        return "Video";
      case SubscriptionCategory.cloud:
        return "Cloud Storage";
      case SubscriptionCategory.finance:
        return "Finance";
      case SubscriptionCategory.shopping:
        return "Shopping";
      case SubscriptionCategory.health:
        return "Health";
      case SubscriptionCategory.education:
        return "Education";
      case SubscriptionCategory.gaming:
        return "Gaming";
      case SubscriptionCategory.news:
        return "News";
      case SubscriptionCategory.ai:
        return "AI";
      case SubscriptionCategory.other:
        return "Other";
      case SubscriptionCategory.fitness:
        return "Fitness";
      case SubscriptionCategory.utilities:
        return "Utilities";
      case SubscriptionCategory.business:
        return "Business";
    }
  }

  IconData _icon(SubscriptionCategory category) {
    switch (category) {
      case SubscriptionCategory.entertainment:
        return Icons.movie_outlined;
      case SubscriptionCategory.productivity:
        return Icons.work_outline;
      case SubscriptionCategory.music:
        return Icons.music_note_outlined;
      case SubscriptionCategory.streaming:
        return Icons.play_circle_outline;
      case SubscriptionCategory.cloud:
        return Icons.cloud_outlined;
      case SubscriptionCategory.finance:
        return Icons.account_balance_wallet_outlined;
      case SubscriptionCategory.shopping:
        return Icons.shopping_bag_outlined;
      case SubscriptionCategory.health:
        return Icons.favorite_border;
      case SubscriptionCategory.education:
        return Icons.school_outlined;
      case SubscriptionCategory.gaming:
        return Icons.sports_esports_outlined;
      case SubscriptionCategory.news:
        return Icons.newspaper_outlined;
      case SubscriptionCategory.ai:
        return Icons.auto_awesome_outlined;
      case SubscriptionCategory.other:
        return Icons.category_outlined;
      case SubscriptionCategory.fitness:
        return Icons.sports_gymnastics;

      case SubscriptionCategory.utilities:
        return Icons.unarchive;

      case SubscriptionCategory.business:
        return Icons.account_balance_wallet_outlined;
    }
  }

  Color _color(SubscriptionCategory category) {
    switch (category) {
      case SubscriptionCategory.entertainment:
        return Colors.red;
      case SubscriptionCategory.productivity:
        return Colors.blue;
      case SubscriptionCategory.music:
        return Colors.green;
      case SubscriptionCategory.streaming:
        return Colors.deepPurple;
      case SubscriptionCategory.cloud:
        return Colors.indigo;
      case SubscriptionCategory.finance:
        return Colors.teal;
      case SubscriptionCategory.shopping:
        return Colors.orange;
      case SubscriptionCategory.health:
        return Colors.pink;
      case SubscriptionCategory.education:
        return Colors.cyan;
      case SubscriptionCategory.gaming:
        return Colors.deepOrange;
      case SubscriptionCategory.news:
        return Colors.amber;
      case SubscriptionCategory.ai:
        return Colors.purple;
      case SubscriptionCategory.other:
        return Colors.grey;
      case SubscriptionCategory.fitness:
        return Colors.pink;

      case SubscriptionCategory.utilities:
        return Colors.cyan;

      case SubscriptionCategory.business:
        return Colors.teal;
    }
  }
}
