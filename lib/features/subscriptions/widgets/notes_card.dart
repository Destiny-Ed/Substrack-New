import 'package:flutter/material.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({super.key, required this.notes, this.onEdit});

  final String? notes;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final hasNotes = notes?.trim().isNotEmpty ?? false;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.sticky_note_2_outlined, color: theme.colorScheme.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Notes',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              if (onEdit != null) IconButton(onPressed: onEdit, icon: const Icon(Icons.edit_outlined)),
            ],
          ),

          const SizedBox(height: 16),

          if (hasNotes)
            SelectableText(notes!, style: theme.textTheme.bodyLarge?.copyWith(height: 1.5))
          else
            Column(
              children: [
                Icon(Icons.note_add_outlined, size: 48, color: theme.colorScheme.outline),

                const SizedBox(height: 12),

                Text('No notes yet', style: theme.textTheme.titleMedium),

                const SizedBox(height: 6),

                Text(
                  'Save useful information like payment methods, account details or cancellation instructions.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
        ],
      ),
    );
  }
}


