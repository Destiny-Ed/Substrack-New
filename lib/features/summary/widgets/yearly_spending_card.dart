import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YearlySpendingCard extends StatelessWidget {
  final double yearlyAmount;

  const YearlySpendingCard({super.key, required this.yearlyAmount});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(symbol: "\$", decimalDigits: 2);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text("Estimated Yearly Spending", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            Text(
              formatter.format(yearlyAmount),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
