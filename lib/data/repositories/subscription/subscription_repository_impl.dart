import 'package:isar_community/isar.dart';

import '../../../core/database/isar_database.dart';
import '../../models/subscriptions/subscription_models.dart';
import 'subscription_repository.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final IsarDatabase database;

  const SubscriptionRepositoryImpl({required this.database});

  Future<Isar> get _isar async => database.database;

  @override
  Future<void> save(Subscription subscription) async {
    final isar = await _isar;

    await isar.writeTxn(() async {
      await isar.subscriptions.put(subscription);
    });
  }

  @override
  Future<List<Subscription>> getAll() async {
    final isar = await _isar;

    return isar.subscriptions.where().findAll();
  }

  @override
  Future<Subscription?> getById(String id) async {
    final isar = await _isar;

    return isar.subscriptions.filter().idEqualTo(id).findFirst();
  }

  @override
  Future<void> delete(String id) async {
    final isar = await _isar;

    final subscription = await isar.subscriptions.filter().idEqualTo(id).findFirst();

    if (subscription == null) return;

    await isar.writeTxn(() async {
      await isar.subscriptions.delete(subscription.isarId);
    });
  }

  @override
  Future<void> clear() async {
    final isar = await _isar;

    await isar.writeTxn(() async {
      await isar.subscriptions.clear();
    });
  }

  @override
  Future<void> archive(String id) {
    // TODO: implement archive
    throw UnimplementedError();
  }



  @override
  Future<void> restore(String id) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Future<void> update(Subscription subscription) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
