import 'package:flutter/material.dart';

import '../../../../data/enums.dart';

class CategoryHeader extends StatelessWidget {
  final SubscriptionCategory category;

  const CategoryHeader({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Text(
        category.name.toUpperCase(),
        style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
