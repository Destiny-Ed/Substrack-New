import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:subtrack/core/navigation/app_routes.dart';
import 'package:subtrack/features/subscriptions/view_models/subscriptions_viewmodel.dart';
import 'package:subtrack/features/subscriptions/widgets/empty_subscription_list.dart';
import 'package:subtrack/features/subscriptions/widgets/subscription_filter_chip.dart';
import 'package:subtrack/features/subscriptions/widgets/subscription_group_list.dart';
import 'package:subtrack/features/subscriptions/widgets/subscription_loading.dart';
import 'package:subtrack/features/subscriptions/widgets/subscription_sort_button.dart';

import '../widgets/subscription_search_bar.dart';

class SubscriptionsScreen extends StatefulWidget {
  const SubscriptionsScreen({super.key});

  @override
  State<SubscriptionsScreen> createState() => _SubscriptionsScreenState();
}

class _SubscriptionsScreenState extends State<SubscriptionsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SubscriptionsViewModel>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SubscriptionsViewModel>(
      builder: (_, vm, __) {
        return Scaffold(
          appBar: AppBar(title: const Text("Subscriptions")),

          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              final result = await Navigator.pushNamed(context, AppRoutes.addSubscription);

              if (result == true && mounted) {
                vm.refresh();
              }
            },
            icon: const Icon(Icons.add),
            label: const Text("Add"),
          ),

          body: RefreshIndicator(
            onRefresh: vm.refresh,
            child: Builder(
              builder: (_) {
                if (vm.isLoading) {
                  return const SubscriptionsLoading();
                }

                return CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          SubscriptionSearchBar(onChanged: vm.search),

                          const SizedBox(height: 16),

                          SubscriptionFilterChips(
                            selected: vm.filter,
                            counts: vm.filterCounts,
                            onSelected: vm.changeFilter,
                          ),

                          const SizedBox(height: 16),

                          SubscriptionSortButton(selected: vm.sort, onSelected: vm.changeSort),

                          const SizedBox(height: 24),
                        ]),
                      ),
                    ),

                    if (vm.subscriptions.isEmpty)
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: EmptySubscriptionList(
                          isSearching: vm.searchQuery.isNotEmpty,
                          onClearSearch: () => vm.search(''),
                          onAddSubscription: () async {
                            final result = await context.push(AppRoutes.addSubscription);

                            if (result == true) {
                              vm.refresh();
                            }
                          },
                        ),
                      )
                    else
                      SubscriptionGroupList(subscriptions: vm.subscriptions),

                    const SliverToBoxAdapter(child: SizedBox(height: 100)),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
