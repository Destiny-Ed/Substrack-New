enum PurchaseStatus { success, cancelled, failed, restored }

class PurchaseResult {
  final PurchaseStatus status;

  final String? message;

  const PurchaseResult({required this.status, this.message});

  bool get isSuccess => status == PurchaseStatus.success;
}
