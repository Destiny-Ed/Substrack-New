import 'package:subtrack/data/models/subscriptions/subscription_models.dart';

abstract class SubscriptionRepository {
  Future<List<Subscription>> getAll();

  Future<Subscription?> getById(String id);

  Future<void> save(Subscription subscription);

  Future<void> update(Subscription subscription);

  Future<void> delete(String id);

  Future<void> archive(String id);

  Future<void> restore(String id);

  Future<void> clear();
}
