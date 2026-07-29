import 'dart:async';

import '../../../data/models/purchase/product_plan.dart';
import '../../../data/models/purchase/purchase_result.dart';
import 'purchase_repository.dart';

class FakePurchaseRepository implements PurchaseRepository {
  bool _isPremium = false;

  @override
  Future<ProductPlan> getMainPlan() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return const ProductPlan(
      id: 'subtrack_pro_yearly',
      title: 'Subtrack Pro',
      description: 'Unlock every premium feature.',
      price: '\$19.99/year',
      hasFreeTrial: true,
      trialText: '7-day free trial',
    );
  }

  @override
  Future<PurchaseResult> purchase() async {
    await Future.delayed(const Duration(seconds: 2));

    _isPremium = true;

    return const PurchaseResult(status: PurchaseStatus.success);
  }

  @override
  Future<bool> isPremium() async {
    return _isPremium;
  }

  @override
  Future<PurchaseResult> restorePurchases() async {
    await Future.delayed(const Duration(seconds: 1));

    if (_isPremium) {
      return const PurchaseResult(status: PurchaseStatus.restored);
    }

    return const PurchaseResult(status: PurchaseStatus.failed, message: 'No purchases found.');
  }
}
