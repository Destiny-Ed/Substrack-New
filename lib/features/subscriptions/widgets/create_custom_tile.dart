import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:subtrack/core/enums.dart';
import 'package:subtrack/core/navigation/app_routes.dart';
import 'package:subtrack/features/subscriptions/view_models/add_subscription_vm.dart';
import 'package:subtrack/features/subscriptions/widgets/add_subscription_bottom_sheet.dart';
import 'package:subtrack/features/subscriptions/widgets/subscription_added_bottom_sheet.dart';

class CreateCustomSubscriptionTile extends StatelessWidget {
  final String query;

  const CreateCustomSubscriptionTile({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.add)),
        title: Text('Create "$query"'),
        subtitle: const Text('Add a custom subscription'),
        onTap: () async {
          final saved = await showAddSubscriptionBottomSheet(context, catalog: null, initialName: query);
      
          if (!context.mounted || saved != true) {
            return;
          }
      
          final action = await showSubscriptionAddedBottomSheet(context: context, serviceName: query);
      
          if (!context.mounted || action == null) {
            return;
          }
      
          switch (action) {
            case AddSubscriptionAction.addAnother:
              context.read<AddSubscriptionViewModel>().resetSearch();
              break;
      
            case AddSubscriptionAction.continueToPaywall:
              context.go(AppRoutes.paywall);
              break;
          }
        },
      ),
    );
  }
}
