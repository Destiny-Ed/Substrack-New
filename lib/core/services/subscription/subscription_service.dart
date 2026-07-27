import 'package:subtrack/data/models/subscriptions/subscription_models.dart';

abstract class SubscriptionService {
  Future<List<Subscription>> getSubscriptions();

  Future<Subscription?> getSubscription(String id);

  Future<void> addSubscription(Subscription subscription);

  Future<void> updateSubscription(Subscription subscription);

  Future<void> deleteSubscription(String id);

  Future<void> archiveSubscription(String id);

  Future<void> restoreSubscription(String id);
}
