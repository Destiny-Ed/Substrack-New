import 'package:flutter/material.dart';
import 'package:subtrack/data/models/subscriptions/subscription_models.dart';


class SubscriptionPreviewList extends StatelessWidget {
  final List<Subscription> subscriptions;

  const SubscriptionPreviewList({super.key, required this.subscriptions});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: subscriptions.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (_, index) {
          final item = subscriptions[index];

          return Material(
            color: Colors.transparent,
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Color(item.brandColor), child: Text(item.name[0])),
              title: Text(item.name),
              subtitle: Text(item.billingCycle.name),
              trailing: Text("\$${item.price.toStringAsFixed(2)}"),
            ),
          );
        },
      ),
    );
  }
}
