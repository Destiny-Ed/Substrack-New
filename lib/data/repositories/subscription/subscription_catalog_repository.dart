import 'package:subtrack/data/models/subscriptions/subscription_catalog.dart';

abstract class SubscriptionCatalogRepository {
  Future<List<SubscriptionCatalog>> getAll();

  Future<List<SubscriptionCatalog>> getFeatured();

  Future<List<SubscriptionCatalog>> search(String query);

  Future<SubscriptionCatalog?> findById(String id);
}
