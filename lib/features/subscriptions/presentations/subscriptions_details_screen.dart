import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subtrack/core/info_banner.dart';
import 'package:subtrack/core/navigation/app_routes.dart';
import 'package:subtrack/features/subscriptions/view_models/subscription_details_vm.dart';
import 'package:subtrack/features/subscriptions/widgets/danger_zone_card.dart';
import 'package:subtrack/features/subscriptions/widgets/notes_card.dart';
import 'package:subtrack/features/subscriptions/widgets/reminder_card.dart';
import 'package:subtrack/features/subscriptions/widgets/renewal_card.dart';
import 'package:subtrack/features/subscriptions/widgets/subscription_header.dart';

class SubscriptionDetailsScreen extends StatefulWidget {
  const SubscriptionDetailsScreen({super.key, required this.subscriptionId});

  final String subscriptionId;

  @override
  State<SubscriptionDetailsScreen> createState() => _SubscriptionDetailsScreenState();
}

class _SubscriptionDetailsScreenState extends State<SubscriptionDetailsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SubscriptionDetailsViewModel>().load(widget.subscriptionId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SubscriptionDetailsViewModel>(
      builder: (_, vm, __) {
        if (vm.isLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final subscription = vm.subscription;

        if (subscription == null) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: Text("Subscription not found")),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Subscription"),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () async {
                  final updated = await Navigator.pushNamed(
                    context,
                    AppRoutes.editSubscription,
                    arguments: subscription.id,
                  );

                  if (updated == true && mounted) {
                    vm.load(widget.subscriptionId);
                  }
                },
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () => vm.load(widget.subscriptionId),
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                SubscriptionHeader(subscription: subscription),

                const SizedBox(height: 24),

                RenewalCard(subscription: subscription),

                const SizedBox(height: 20),

                ReminderCard(
                  reminderDays: subscription.reminderDays,
                  notificationsEnabled: true, // simulated for now
                  onEnableNotifications: () {
                    // Later:
                    // NotificationService.requestPermission();
                  },
                ),
                if (subscription.notes?.isNotEmpty ?? false) ...[
                  const SizedBox(height: 20),
                  NotesCard(notes: subscription.notes!),
                ],

                const SizedBox(height: 24),

                const InfoBanner(
                  title: "Important",
                  message:
                      "Subtrack only tracks your subscriptions. Cancelling, archiving or deleting a subscription here does not cancel it with the service provider.",
                ),

                if (subscription.website != null)
                  InfoBanner(
                    title: "Manage with Provider",
                    message:
                        "To stop future charges, cancel this subscription directly with the service provider.",
                    icon: Icons.open_in_new,
                    action: TextButton(
                      onPressed: () {
                        // launchUrlString(subscription.website!);
                        print(subscription.website);
                      },
                      child: const Text("Open Website"),
                    ),
                  ),

                const SizedBox(height: 20),
                DangerZoneCard(
                  subscription: subscription,
                  onCancel: () async {
                    final result = await showCancelDialog(context);

                    if (result) {}
                  },
                  onArchive: () async {
                    final result = await showArchiveDialog(context);

                    if (result) {
                      vm.archive();
                    }
                  },
                  onDelete: () async {
                    final result = await showDeleteDialog(context);

                    if (result) {
                      final deleted = await vm.delete(context);

                      if (deleted && mounted) {
                        Navigator.pop(context, true);
                      }
                    }
                  },
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<bool> showCancelDialog(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Cancel Subscription?"),
          content: const Text(
            "This only updates the status inside Subtrack. It does not cancel your subscription with the provider.",
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Keep Active")),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Mark as Cancelled"),
            ),
          ],
        ),
      ) ??
      false;
}

Future<bool> showDeleteDialog(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Delete Subscription?"),
          content: const Text(
            "This permanently removes this subscription from Subtrack.\nThis action cannot be undone.",
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Keep Active")),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Mark as Cancelled"),
            ),
          ],
        ),
      ) ??
      false;
}

Future<bool> showArchiveDialog(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Archive Subscription?"),
          content: const Text(
            "Archived subscriptions will be hidden from your dashboard but can be restored later.",
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Cancel")),
            FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text("Archive")),
          ],
        ),
      ) ??
      false;
}
