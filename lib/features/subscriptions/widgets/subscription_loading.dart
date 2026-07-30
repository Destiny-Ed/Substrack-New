import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SubscriptionsLoading extends StatelessWidget {
  const SubscriptionsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: 6,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (_, __) => Shimmer.fromColors(
        baseColor: theme.colorScheme.surfaceContainerHighest,
        highlightColor: theme.colorScheme.surface,
        child: const _SkeletonTile(),
      ),
    );
  }
}

class _SkeletonTile extends StatelessWidget {
  const _SkeletonTile();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.surfaceContainerHighest;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 18,
                  width: 140,
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
                ),

                const SizedBox(height: 10),

                Container(
                  height: 14,
                  width: 90,
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
                ),

                const SizedBox(height: 14),

                Container(
                  height: 28,
                  width: 120,
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(100)),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 60,
                height: 16,
                decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
              ),

              const SizedBox(height: 10),

              Container(
                width: 40,
                height: 14,
                decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
