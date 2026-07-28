import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:subtrack/core/enums.dart';
import 'package:subtrack/data/models/subscriptions/subscription_catalog.dart';

class SubscriptionCatalogLocalDataSource {
  const SubscriptionCatalogLocalDataSource();

  Future<List<SubscriptionCatalog>> load() async {
    final jsonString = await rootBundle.loadString('assets/data/subscriptions.json');

    final List<dynamic> data = json.decode(jsonString);

    return data.map((item) {
      return SubscriptionCatalog(
        id: item['id'],
        name: item['name'],
        brandColor: item['brandColor'],
        category: SubscriptionCategory.values.firstWhere((e) => e.name == item['category']),
        website: item['website'],
        billingCycle: BillingCycle.values.firstWhere((e) => e.name == item['billingCycle']),
        featured: item['featured'] ?? false,
        keywords: List<String>.from(item['keywords'] ?? []),
      );
    }).toList();
  }
}
