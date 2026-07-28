import 'package:subtrack/data/datasources/local/subscription_catalog_local_data_source.dart';
import 'package:subtrack/data/models/subscriptions/subscription_catalog.dart';

import 'subscription_catalog_repository.dart';

class SubscriptionCatalogRepositoryImpl implements SubscriptionCatalogRepository {
  final SubscriptionCatalogLocalDataSource _dataSource;

  const SubscriptionCatalogRepositoryImpl({required SubscriptionCatalogLocalDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<SubscriptionCatalog>> getAll() async {
    return _dataSource.load();
  }

  @override
  Future<List<SubscriptionCatalog>> getFeatured() async {
    final subscription = await getAll();
    return subscription.where((subscription) => subscription.featured).toList(growable: false);
  }

  @override
  Future<SubscriptionCatalog?> findById(String id) async {
    try {
      final subscription = await getAll();

      return subscription.firstWhere((subscription) => subscription.id == id);
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

    final subscription = await getAll();

    return subscription
        .where((sub) {
          if (sub.name.toLowerCase().contains(search)) {
            return true;
          }

          return sub.keywords.any((keyword) => keyword.toLowerCase().contains(search));
        })
        .toList(growable: false);
  }
}
