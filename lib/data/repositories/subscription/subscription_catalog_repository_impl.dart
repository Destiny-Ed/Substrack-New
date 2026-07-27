import 'package:subtrack/data/models/subscriptions/subscription_catalog.dart';

import 'subscription_catalog_repository.dart';

class SubscriptionCatalogRepositoryImpl implements SubscriptionCatalogRepository {
  final List<SubscriptionCatalog> _subscriptions;

  const SubscriptionCatalogRepositoryImpl({required List<SubscriptionCatalog> subscriptions})
    : _subscriptions = subscriptions;

  @override
  Future<List<SubscriptionCatalog>> getAll() async {
    return List.unmodifiable(_subscriptions);
  }

  @override
  Future<List<SubscriptionCatalog>> getFeatured() async {
    return _subscriptions.where((subscription) => subscription.featured).toList(growable: false);
  }

  @override
  Future<SubscriptionCatalog?> findById(String id) async {
    try {
      return _subscriptions.firstWhere((subscription) => subscription.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<SubscriptionCatalog>> search(String query) async {
    final search = query.trim().toLowerCase();

    if (search.isEmpty) {
      return getFeatured();
    }

    return _subscriptions
        .where((subscription) {
          if (subscription.name.toLowerCase().contains(search)) {
            return true;
          }

          return subscription.keywords.any((keyword) => keyword.toLowerCase().contains(search));
        })
        .toList(growable: false);
  }
}
