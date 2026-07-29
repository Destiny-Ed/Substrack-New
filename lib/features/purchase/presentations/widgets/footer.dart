import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("No payment today. Cancel anytime.", textAlign: TextAlign.center),
        const SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          children: [
            TextButton(onPressed: () {}, child: const Text("Terms")),
            TextButton(onPressed: () {}, child: const Text("Privacy")),
          ],
        ),
      ],
    );
  }
}
