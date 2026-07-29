import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../data/models/purchase/product_plan.dart';
import '../../../data/models/purchase/purchase_result.dart';
import '../repositories/purchase_repository.dart';

class PaywallViewModel extends ChangeNotifier {
  final PurchaseRepository _repository = GetIt.I();

  bool isLoading = true;

  bool isPurchasing = false;

  ProductPlan? plan;

  Future<void> load() async {
    plan = await _repository.getMainPlan();

    isLoading = false;

    notifyListeners();
  }

  Future<PurchaseResult> purchase() async {
    isPurchasing = true;
    notifyListeners();

    final result = await _repository.purchase();

    isPurchasing = false;
    notifyListeners();

    return result;
  }

  Future<PurchaseResult> restore() {
    return _repository.restorePurchases();
  }
}
