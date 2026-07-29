class UpcomingRenewal {
  final String id;
  final String name;
  final String? logoAsset;
  final double amount;
  final String currency;
  final int daysRemaining;
  final DateTime renewalDate;
  final bool isTrial;

  UpcomingRenewal({
    required this.id,
    required this.name,
    required this.logoAsset,
    required this.amount,
    required this.currency,
    required this.daysRemaining,
    required this.renewalDate,
    required this.isTrial,
  });
}
