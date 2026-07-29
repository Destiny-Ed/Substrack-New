import 'package:flutter/material.dart';

class DashboardSkeleton extends StatefulWidget {
  const DashboardSkeleton({super.key});

  @override
  State<DashboardSkeleton> createState() => _DashboardSkeletonState();
}

class _DashboardSkeletonState extends State<DashboardSkeleton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1300))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).colorScheme.surfaceContainerHighest;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          children: [
            _line(width: 180, height: 28, color: base),

            const SizedBox(height: 12),

            _line(width: 250, height: 16, color: base),

            const SizedBox(height: 28),

            _card(height: 170, color: base),

            const SizedBox(height: 20),

            _card(height: 170, color: base),

            const SizedBox(height: 24),

            _line(width: 180, height: 22, color: base),

            const SizedBox(height: 16),

            ...List.generate(
              4,
              (_) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _card(height: 88, color: base),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _card({required double height, required Color color}) {
    return Opacity(
      opacity: 0.45 + (_controller.value * .35),
      child: Container(
        height: height,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(24)),
      ),
    );
  }

  Widget _line({required double width, required double height, required Color color}) {
    return Opacity(
      opacity: 0.45 + (_controller.value * .35),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}
