import 'package:flutter/material.dart';
import 'package:subtrack/core/services/subscription/subscription_service.dart';
import 'package:subtrack/data/models/subscriptions/subscription_catalog.dart';
import 'package:subtrack/data/repositories/subscription/subscription_catalog_repository.dart';
import 'package:subtrack/data/repositories/subscription/subscription_repository.dart';

import '../../../../core/di/injection.dart';
import '../../../core/enums.dart';
import '../../../../data/models/subscriptions/subscription_models.dart';

class AddSubscriptionViewModel extends ChangeNotifier {
  AddSubscriptionViewModel({
    SubscriptionRepository? subscriptionRepository,
    SubscriptionCatalogRepository? catalogRepository,
  }) : _subscriptionRepository = subscriptionRepository ?? getIt<SubscriptionRepository>(),
       _catalogRepository = catalogRepository ?? getIt<SubscriptionCatalogRepository>();

  final SubscriptionRepository _subscriptionRepository;
  final SubscriptionCatalogRepository _catalogRepository;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  final List<SubscriptionCatalog> _catalogs = [];

  List<SubscriptionCatalog> get catalogs => List.unmodifiable(_catalogs);

  List<SubscriptionCatalog> get filteredServices {
    if (_searchQuery.trim().isEmpty) {
      return catalogs;
    }

    final query = _searchQuery.toLowerCase();

    return _catalogs.where((service) {
      return service.name.toLowerCase().contains(query) ||
          service.category.name.toLowerCase().contains(query);
    }).toList();
  }

  bool get hasResults => filteredServices.isNotEmpty;

  bool get showCreateCustom => _searchQuery.trim().isNotEmpty && !hasResults;

  Future<void> load() async {
    _setLoading(true);

    _catalogs
      ..clear()
      ..addAll(await _catalogRepository.getAll());

    _setLoading(false);
  }

  void search(String value) {
    _searchQuery = value;

    notifyListeners();
  }

  void resetSearch() {
    _searchQuery = '';
    // _filteredServices = _allServices;
    notifyListeners();
  }

  Future<void> saveSubscription({
    required SubscriptionCatalog service,
    required double price,
    required String currency,
    required BillingCycle billingCycle,
    required DateTime renewalDate,
    required bool autoRenew,
  }) async {
    final subscription =
        Subscription.create(
          name: service.name,
          category: service.category,
          price: price,
          currency: currency,
          billingCycle: billingCycle,
          renewalDate: renewalDate,
        ).copyWith(
          logoAsset: service.logoAsset,
          brandColor: service.brandColor,
          website: service.website,
          autoRenew: autoRenew,
        );

    await _subscriptionRepository.save(subscription);
  }

  Future<void> saveCustomSubscription({
    required String name,
    required SubscriptionCategory category,
    required double price,
    required String currency,
    required BillingCycle billingCycle,
    required DateTime renewalDate,
    required bool autoRenew,
    String? website,
  }) async {
    final subscription = Subscription.create(
      name: name,
      category: category,
      price: price,
      currency: currency,
      billingCycle: billingCycle,
      renewalDate: renewalDate,
    ).copyWith(website: website, autoRenew: autoRenew);

    await _subscriptionRepository.save(subscription);
  }

  Map<SubscriptionCategory, List<SubscriptionCatalog>> get groupedServices {
    final map = <SubscriptionCategory, List<SubscriptionCatalog>>{};

    for (final service in filteredServices) {
      map.putIfAbsent(service.category, () => []);

      map[service.category]!.add(service);
    }

    return map;
  }

  void _setLoading(bool value) {
    _isLoading = value;

    notifyListeners();
  }
}
