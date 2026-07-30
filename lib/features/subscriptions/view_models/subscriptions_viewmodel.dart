import 'package:flutter/foundation.dart';
import 'package:subtrack/data/repositories/subscription/subscription_repository.dart';

import '../../../../core/enums.dart';
import '../../../../data/models/subscriptions/subscription_models.dart';

class SubscriptionsViewModel extends ChangeNotifier {
  SubscriptionsViewModel({required SubscriptionRepository repository}) : _repository = repository;

  final SubscriptionRepository _repository;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Subscription> _subscriptions = [];

  List<Subscription> get allSubscriptions => List.unmodifiable(_subscriptions);

  String _searchQuery = '';

  SubscriptionFilter _filter = SubscriptionFilter.all;

  SubscriptionSort _sort = SubscriptionSort.nextRenewal;

  String get searchQuery => _searchQuery;

  SubscriptionFilter get filter => _filter;

  SubscriptionSort get sort => _sort;

  List<Subscription> get subscriptions {
    var list = List<Subscription>.from(_subscriptions);

    switch (_filter) {
      case SubscriptionFilter.active:
        list = list.where((e) => e.status == SubscriptionStatus.active).toList();
        break;

      case SubscriptionFilter.trial:
        list = list.where((e) => e.isTrial).toList();
        break;

      case SubscriptionFilter.cancelled:
        list = list.where((e) => e.status == SubscriptionStatus.cancelled).toList();
        break;

      case SubscriptionFilter.archived:
        list = list.where((e) => e.isArchived).toList();
        break;

      case SubscriptionFilter.all:
        break;
    }

    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();

      list = list.where((subscription) {
        return subscription.name.toLowerCase().contains(query) ||
            subscription.category.name.toLowerCase().contains(query) ||
            (subscription.notes?.toLowerCase().contains(query) ?? false);
      }).toList();
    }

    switch (_sort) {
      case SubscriptionSort.nextRenewal:
        list.sort((a, b) => a.renewalDate.compareTo(b.renewalDate));
        break;

      case SubscriptionSort.name:
        list.sort((a, b) => a.name.compareTo(b.name));
        break;

      case SubscriptionSort.price:
        list.sort((a, b) => b.price.compareTo(a.price));
        break;

      case SubscriptionSort.newest:
        list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;

      case SubscriptionSort.oldest:
        list.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
    }

    return list;
  }

  Map<SubscriptionFilter, int> get filterCounts => {
    SubscriptionFilter.all: _subscriptions.length,
    SubscriptionFilter.active: _subscriptions.where((e) => e.status == SubscriptionStatus.active).length,
    SubscriptionFilter.trial: _subscriptions.where((e) => e.isTrial).length,
    SubscriptionFilter.cancelled: _subscriptions
        .where((e) => e.status == SubscriptionStatus.cancelled)
        .length,
    SubscriptionFilter.archived: _subscriptions.where((e) => e.isArchived).length,
  };

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();

    _subscriptions = await _repository.getAll();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    await load();
  }

  void search(String query) {
    _searchQuery = query.trim();
    notifyListeners();
  }

  void changeFilter(SubscriptionFilter filter) {
    _filter = filter;
    notifyListeners();
  }

  void changeSort(SubscriptionSort sort) {
    _sort = sort;
    notifyListeners();
  }

  Future<void> delete(Subscription subscription) async {
    await _repository.delete(subscription.id);

    _subscriptions.removeWhere((e) => e.id == subscription.id);

    notifyListeners();
  }

  Future<void> archive(Subscription subscription) async {
    final updated = subscription.copyWith(isArchived: true);

    await _repository.update(updated);

    final index = _subscriptions.indexWhere((e) => e.id == updated.id);

    if (index != -1) {
      _subscriptions[index] = updated;
    }

    notifyListeners();
  }
}
