import 'package:flutter/material.dart';
import 'package:subtrack/features/subscriptions/widgets/create_custom_tile.dart';

class EmptySearchView extends StatelessWidget {
  final String query;

  const EmptySearchView({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search_off, size: 64),
            const SizedBox(height: 16),
            const Text('No subscriptions found', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Try another search or create "$query".', textAlign: TextAlign.center),
            const SizedBox(height: 10),

            CreateCustomSubscriptionTile(query: query),
          ],
        ),
      ),
    );
  }
}
