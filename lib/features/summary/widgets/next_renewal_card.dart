import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:subtrack/data/models/subscriptions/subscription_models.dart';

class NextRenewalCard extends StatelessWidget {
  final Subscription subscription;

  const NextRenewalCard({super.key, required this.subscription});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_month),
        title: const Text("Next Renewal"),
        subtitle: Text("${subscription.name} • ${DateFormat.yMMMd().format(subscription.renewalDate)}"),
      ),
    );
  }
}
