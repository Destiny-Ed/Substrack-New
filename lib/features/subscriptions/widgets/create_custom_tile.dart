import 'package:flutter/material.dart';
import 'package:subtrack/features/subscriptions/widgets/add_subscription_bottom_sheet.dart';

class CreateCustomSubscriptionTile extends StatelessWidget {
  final String query;

  const CreateCustomSubscriptionTile({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.add)),
      title: Text('Create "$query"'),
      subtitle: const Text('Add a custom subscription'),
      onTap: () async {
        final saved = await showAddSubscriptionBottomSheet(context, catalog: null, initialName: query);

        if (saved == true && context.mounted) {
          // context.go(AppRoutes.summary);
        }
      },
    );
  }
}
