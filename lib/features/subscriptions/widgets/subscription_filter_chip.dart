import 'package:flutter/material.dart';
import 'package:subtrack/core/enums.dart';

class SubscriptionFilterChips extends StatelessWidget {
  const SubscriptionFilterChips({
    super.key,
    required this.selected,
    required this.onSelected,
    this.counts = const {},
  });

  final SubscriptionFilter selected;
  final ValueChanged<SubscriptionFilter> onSelected;

  /// Optional counts for each filter.
  ///
  /// Example:
  /// {
  ///   SubscriptionFilter.all: 20,
  ///   SubscriptionFilter.active: 16,
  ///   SubscriptionFilter.trial: 3,
  /// }
  final Map<SubscriptionFilter, int> counts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: SubscriptionFilter.values.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, index) {
          final filter = SubscriptionFilter.values[index];

          return _FilterChip(
            filter: filter,
            selected: filter == selected,
            count: counts[filter],
            onTap: () => onSelected(filter),
          );
        },
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.filter, required this.selected, required this.onTap, this.count});

  final SubscriptionFilter filter;
  final bool selected;
  final int? count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: selected ? theme.colorScheme.primary : theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _label(filter),
                  style: TextStyle(
                    color: selected ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                if (count != null) ...[
                  const SizedBox(width: 8),

                  AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: selected
                          ? theme.colorScheme.onPrimary.withOpacity(.18)
                          : theme.colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: selected ? theme.colorScheme.onPrimary : theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _label(SubscriptionFilter filter) {
    switch (filter) {
      case SubscriptionFilter.all:
        return 'All';
      case SubscriptionFilter.active:
        return 'Active';
      case SubscriptionFilter.trial:
        return 'Trials';
      case SubscriptionFilter.cancelled:
        return 'Cancelled';
      case SubscriptionFilter.archived:
        return 'Archived';
    }
  }
}
