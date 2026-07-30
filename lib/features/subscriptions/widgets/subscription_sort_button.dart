import 'package:flutter/material.dart';
import 'package:subtrack/core/enums.dart';

class SubscriptionSortButton extends StatelessWidget {
  const SubscriptionSortButton({super.key, required this.selected, required this.onSelected});

  final SubscriptionSort selected;
  final ValueChanged<SubscriptionSort> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Text("Sort", style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),

        const Spacer(),

        FilledButton.tonalIcon(
          onPressed: () => _showSortSheet(context),
          icon: const Icon(Icons.sort_rounded),
          label: Text(_label(selected)),
        ),
      ],
    );
  }

  Future<void> _showSortSheet(BuildContext context) async {
    final sort = await showModalBottomSheet<SubscriptionSort>(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      builder: (_) {
        return _SortBottomSheet(selected: selected);
      },
    );

    if (sort != null) {
      onSelected(sort);
    }
  }

  String _label(SubscriptionSort sort) {
    switch (sort) {
      case SubscriptionSort.nextRenewal:
        return "Next Renewal";
      case SubscriptionSort.name:
        return "Name";
      case SubscriptionSort.price:
        return "Price";
      case SubscriptionSort.newest:
        return "Newest";
      case SubscriptionSort.oldest:
        return "Oldest";
    }
  }
}

class _SortBottomSheet extends StatelessWidget {
  const _SortBottomSheet({required this.selected});

  final SubscriptionSort selected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Sort By",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 24),

              ...SubscriptionSort.values.map((sort) => _SortTile(sort: sort, selected: sort == selected)),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SortTile extends StatelessWidget {
  const _SortTile({required this.sort, required this.selected});

  final SubscriptionSort sort;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: EdgeInsets.zero,
      leading: Icon(_icon(sort)),
      title: Text(_title(sort)),
      trailing: selected ? Icon(Icons.check, color: theme.colorScheme.primary) : null,
      onTap: () {
        Navigator.pop(context, sort);
      },
    );
  }

  IconData _icon(SubscriptionSort sort) {
    switch (sort) {
      case SubscriptionSort.nextRenewal:
        return Icons.event_available_outlined;

      case SubscriptionSort.name:
        return Icons.sort_by_alpha;

      case SubscriptionSort.price:
        return Icons.attach_money;

      case SubscriptionSort.newest:
        return Icons.fiber_new_outlined;

      case SubscriptionSort.oldest:
        return Icons.history;
    }
  }

  String _title(SubscriptionSort sort) {
    switch (sort) {
      case SubscriptionSort.nextRenewal:
        return "Next Renewal";

      case SubscriptionSort.name:
        return "Name (A–Z)";

      case SubscriptionSort.price:
        return "Highest Price";

      case SubscriptionSort.newest:
        return "Newest First";

      case SubscriptionSort.oldest:
        return "Oldest First";
    }
  }
}
