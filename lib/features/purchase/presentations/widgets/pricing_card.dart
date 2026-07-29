import 'package:flutter/material.dart';

import '../../../../data/models/purchase/product_plan.dart';

class PricingCard extends StatelessWidget {
  const PricingCard({super.key, required this.plan});

  final ProductPlan plan;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: theme.colorScheme.primary, width: 2),
      ),
      child: Column(
        children: [
          if (plan.hasFreeTrial)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                plan.trialText,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),

          const SizedBox(height: 20),

          Text(plan.title, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),

          const SizedBox(height: 8),

          Text(plan.description, textAlign: TextAlign.center),

          const SizedBox(height: 24),

          Text(plan.price, style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold)),

          const SizedBox(height: 8),

          Text("≈ \$1.67 per month", style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
