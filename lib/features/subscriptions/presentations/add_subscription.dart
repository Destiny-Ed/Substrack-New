import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:subtrack/core/enums.dart';
import 'package:subtrack/core/navigation/app_routes.dart';
import 'package:subtrack/features/subscriptions/view_models/add_subscription_vm.dart';
import 'package:subtrack/features/subscriptions/widgets/add_subscription_bottom_sheet.dart';
import 'package:subtrack/features/subscriptions/widgets/category_header.dart';
import 'package:subtrack/features/subscriptions/widgets/create_custom_tile.dart';
import 'package:subtrack/features/subscriptions/widgets/empty_search_view.dart';
import 'package:subtrack/features/subscriptions/widgets/subscription_added_bottom_sheet.dart';
import 'package:subtrack/features/subscriptions/widgets/subscription_search_bar.dart';
import 'package:subtrack/features/subscriptions/widgets/subscription_tile.dart';

class AddSubscriptionScreen extends StatelessWidget {
  const AddSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddSubscriptionViewModel()..load(),
      child: const _AddSubscriptionView(),
    );
  }
}

class _AddSubscriptionView extends StatelessWidget {
  const _AddSubscriptionView();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AddSubscriptionViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Subscription'), centerTitle: false),
      body: SafeArea(
        child: Column(
          children: [
            SubscriptionSearchBar(onChanged: vm.search),

            Expanded(
              child: Builder(
                builder: (_) {
                  if (vm.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (vm.filteredServices.isEmpty) {
                    return EmptySearchView(query: vm.searchQuery);
                  }

                  return ListView(
                    padding: const EdgeInsets.only(bottom: 24),
                    children: [
                      // CreateCustomSubscriptionTile(
                      //   // onTap: () async {
                      //   //   final saved = await showAddSubscriptionBottomSheet(context: context, service: null);

                      //   //   if (!context.mounted) return;

                      //   //   if (saved == true) {
                      //   //     // Navigate to summary or refresh
                      //   //   }
                      //   query: vm.searchQuery,
                      // ),
                      ...vm.groupedServices.entries.map((entry) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CategoryHeader(category: entry.key),

                            ...entry.value.map((service) {
                              return SubscriptionTile(
                                catalog: service,
                                onTap: () async {
                                  final saved = await showAddSubscriptionBottomSheet(
                                    context,
                                    catalog: service,
                                  );

                                  if (!context.mounted || saved != true) {
                                    return;
                                  }

                                  final action = await showSubscriptionAddedBottomSheet(
                                    context: context,
                                    serviceName: service.name,
                                  );

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
                              );
                            }),
                          ],
                        );
                      }),

                      if (vm.showCreateCustom) CreateCustomSubscriptionTile(query: vm.searchQuery),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
