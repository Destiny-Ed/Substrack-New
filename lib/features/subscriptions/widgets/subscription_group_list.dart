import 'package:flutter/material.dart';
import 'package:subtrack/features/subscriptions/widgets/subscription_group_header.dart';
import 'package:subtrack/features/subscriptions/widgets/subscription_group_tile.dart';

import '../../../../data/models/subscriptions/subscription_models.dart';

class SubscriptionGroupList extends StatelessWidget {
  const SubscriptionGroupList({super.key, required this.subscriptions});

  final List<Subscription> subscriptions;

  @override
  Widget build(BuildContext context) {
    final groups = _groupSubscriptions();

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final entry = groups.entries.elementAt(index);

        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubscriptionGroupHeader(
                title: entry.key.title,
                icon: entry.key.icon,
                count: entry.value.length,
              ),

              const SizedBox(height: 12),

              ...entry.value.map(
                (subscription) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SubscriptionGroupTile(subscription: subscription),
                ),
              ),
            ],
          ),
        );
      }, childCount: groups.length),
    );
  }

  Map<_Group, List<Subscription>> _groupSubscriptions() {
    final map = <_Group, List<Subscription>>{};

    for (final subscription in subscriptions) {
      final group = _resolve(subscription);

      map.putIfAbsent(group, () => []);

      map[group]!.add(subscription);
    }

    return map;
  }

  _Group _resolve(Subscription subscription) {
    if (subscription.isArchived) {
      return _Group.archived;
    }

    final today = DateTime.now();

    final targetDate = subscription.isTrial && subscription.trialEndDate != null
        ? subscription.trialEndDate!
        : subscription.renewalDate;

    // final renewal = DateTime(
    //   subscription.renewalDate.year,
    //   subscription.renewalDate.month,
    //   subscription.renewalDate.day,
    // );

    final now = DateTime(today.year, today.month, today.day);

    final days = targetDate.difference(now).inDays;

    if (days <= 0) {
      return _Group.today;
    }

    if (days == 1) {
      return _Group.tomorrow;
    }

    if (days <= 7) {
      return _Group.thisWeek;
    }

    return _Group.later;
  }
}

enum _Group { today, tomorrow, thisWeek, later, archived }

extension GroupExtension on _Group {
  String get title {
    switch (this) {
      case _Group.today:
        return "Today";

      case _Group.tomorrow:
        return "Tomorrow";

      case _Group.thisWeek:
        return "This Week";

      case _Group.later:
        return "Later";

      case _Group.archived:
        return "Archived";
    }
  }

  IconData get icon {
    switch (this) {
      case _Group.today:
        return Icons.local_fire_department;

      case _Group.tomorrow:
        return Icons.schedule;

      case _Group.thisWeek:
        return Icons.calendar_today;

      case _Group.later:
        return Icons.event_note;

      case _Group.archived:
        return Icons.archive_outlined;
    }
  }
}
