import 'package:flutter/material.dart';
import 'package:subtrack/features/onboarding/models/onboarding_item.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Spacer(),
          Expanded(flex: 5, child: Image.asset(item.image)),
          const SizedBox(height: 32),
          Text(item.title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          Text(item.description, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
          const Spacer(),
        ],
      ),
    );
  }
}
