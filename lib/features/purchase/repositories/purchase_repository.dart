import '../../../data/models/purchase/product_plan.dart';
import '../../../data/models/purchase/purchase_result.dart';

abstract class PurchaseRepository {
  Future<ProductPlan> getMainPlan();

  Future<PurchaseResult> purchase();

  Future<PurchaseResult> restorePurchases();

  Future<bool> isPremium();
}
