import 'package:subtrack/data/models/subscriptions/subscription_models.dart';
import 'package:subtrack/data/repositories/subscription/subscription_repository.dart';

import 'subscription_service.dart';

class SubscriptionServiceImpl implements SubscriptionService {
  final SubscriptionRepository repository;

  const SubscriptionServiceImpl(this.repository);

  @override
  Future<void> addSubscription(Subscription subscription) {
    return repository.save(subscription);
  }

  @override
  Future<void> archiveSubscription(String id) {
    return repository.archive(id);
  }

  @override
  Future<void> deleteSubscription(String id) {
    return repository.delete(id);
  }

  @override
  Future<Subscription?> getSubscription(String id) {
    return repository.getById(id);
  }

  @override
  Future<List<Subscription>> getSubscriptions() {
    return repository.getAll();
  }

  @override
  Future<void> restoreSubscription(String id) {
    return repository.restore(id);
  }

  @override
  Future<void> updateSubscription(Subscription subscription) {
    return repository.update(subscription);
  }
}
