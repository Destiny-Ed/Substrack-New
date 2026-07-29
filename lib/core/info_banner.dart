import 'package:flutter/material.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.info_outline,
    this.color,
    this.action,
  });

  final String title;
  final String message;
  final IconData icon;
  final Color? color;

  /// Optional trailing action.
  ///
  /// Examples:
  /// - TextButton
  /// - FilledButton.tonal
  /// - IconButton
  /// - Any custom widget
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bannerColor = color ?? theme.colorScheme.primary;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bannerColor.withOpacity(.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: bannerColor.withOpacity(.18)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: bannerColor.withOpacity(.15),
                child: Icon(icon, size: 18, color: bannerColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text(
                      message,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (action != null) ...[
            const SizedBox(height: 16),
            Align(alignment: Alignment.centerRight, child: action!),
          ],
        ],
      ),
    );
  }
}
