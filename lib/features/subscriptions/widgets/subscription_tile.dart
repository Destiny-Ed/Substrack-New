import 'package:flutter/material.dart';
import 'package:subtrack/data/models/subscriptions/subscription_catalog.dart';

 
class SubscriptionTile extends StatelessWidget {
  final SubscriptionCatalog catalog;
  final VoidCallback onTap;

  const SubscriptionTile({super.key, required this.catalog, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Color(catalog.brandColor),
        child: catalog.logoAsset.isNotEmpty
            ? ClipOval(child: Image.asset(catalog.logoAsset, fit: BoxFit.cover))
            : Text(catalog.name[0]),
      ),
      title: Text(catalog.name),
      subtitle: Text(catalog.category.name),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
