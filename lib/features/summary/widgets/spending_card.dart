import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SpendingCard extends StatelessWidget {
  final double amount;

  const SpendingCard({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(symbol: "\$", decimalDigits: 2);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text("Monthly Spending", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            Text(
              formatter.format(amount),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
