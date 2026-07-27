import 'package:subtrack/data/enums.dart';

class Subscription {
  final String id;

  final String name;

  final String? logoAsset;

  final int brandColor;

  final SubscriptionCategory category;

  final double price;

  /// ISO currency code (USD, NGN, EUR...)
  final String currency;

  final BillingCycle billingCycle;

  final DateTime renewalDate;

  /// Whether this is currently a free trial
  final bool isTrial;

  /// Trial expiration date
  final DateTime? trialEndDate;

  final SubscriptionStatus status;

  /// Days before renewal to remind the user.
  ///
  /// Example:
  /// [30, 7, 1, 0]
  ///
  /// 0 = renewal day
  final List<int> reminderDays;

  final String? website;

  final String? notes;

  /// Whether the subscription automatically renews.
  final bool autoRenew;

  /// Soft delete.
  final bool isArchived;

  final DateTime? cancelledAt;

  final DateTime? lastNotifiedAt;

  final DateTime createdAt;

  final DateTime updatedAt;

  const Subscription({
    required this.id,
    required this.name,
    this.logoAsset,
    required this.brandColor,
    required this.category,
    required this.price,
    required this.currency,
    required this.billingCycle,
    required this.renewalDate,
    required this.isTrial,
    this.trialEndDate,
    required this.status,
    required this.reminderDays,
    this.website,
    this.notes,
    required this.autoRenew,
    this.isArchived = false,
    this.cancelledAt,
    this.lastNotifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  Subscription copyWith({
    String? id,
    String? name,
    String? logoAsset,
    int? brandColor,
    SubscriptionCategory? category,
    double? price,
    String? currency,
    BillingCycle? billingCycle,
    DateTime? renewalDate,
    bool? isTrial,
    DateTime? trialEndDate,
    SubscriptionStatus? status,
    List<int>? reminderDays,
    String? website,
    String? notes,
    bool? autoRenew,
    bool? isArchived,
    DateTime? cancelledAt,
    DateTime? lastNotifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Subscription(
      id: id ?? this.id,
      name: name ?? this.name,
      logoAsset: logoAsset ?? this.logoAsset,
      brandColor: brandColor ?? this.brandColor,
      category: category ?? this.category,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      billingCycle: billingCycle ?? this.billingCycle,
      renewalDate: renewalDate ?? this.renewalDate,
      isTrial: isTrial ?? this.isTrial,
      trialEndDate: trialEndDate ?? this.trialEndDate,
      status: status ?? this.status,
      reminderDays: reminderDays ?? this.reminderDays,
      website: website ?? this.website,
      notes: notes ?? this.notes,
      autoRenew: autoRenew ?? this.autoRenew,
      isArchived: isArchived ?? this.isArchived,
      cancelledAt: cancelledAt ?? this.cancelledAt,
      lastNotifiedAt: lastNotifiedAt ?? this.lastNotifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'] as String,
      name: json['name'] as String,
      logoAsset: json['logoAsset'] as String?,
      brandColor: json['brandColor'] as int,
      category: SubscriptionCategory.values.firstWhere((e) => e.name == json['category']),
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      billingCycle: BillingCycle.values.firstWhere((e) => e.name == json['billingCycle']),
      renewalDate: DateTime.parse(json['renewalDate']),
      isTrial: json['isTrial'] as bool,
      trialEndDate: json['trialEndDate'] == null ? null : DateTime.parse(json['trialEndDate']),
      status: SubscriptionStatus.values.firstWhere((e) => e.name == json['status']),
      reminderDays: List<int>.from(json['reminderDays']),
      website: json['website'] as String?,
      notes: json['notes'] as String?,
      autoRenew: json['autoRenew'] as bool,
      isArchived: json['isArchived'] as bool? ?? false,
      cancelledAt: json['cancelledAt'] == null ? null : DateTime.parse(json['cancelledAt']),
      lastNotifiedAt: json['lastNotifiedAt'] == null ? null : DateTime.parse(json['lastNotifiedAt']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logoAsset': logoAsset,
      'brandColor': brandColor,
      'category': category.name,
      'price': price,
      'currency': currency,
      'billingCycle': billingCycle.name,
      'renewalDate': renewalDate.toIso8601String(),
      'isTrial': isTrial,
      'trialEndDate': trialEndDate?.toIso8601String(),
      'status': status.name,
      'reminderDays': reminderDays,
      'website': website,
      'notes': notes,
      'autoRenew': autoRenew,
      'isArchived': isArchived,
      'cancelledAt': cancelledAt?.toIso8601String(),
      'lastNotifiedAt': lastNotifiedAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Subscription(id: $id, name: $name, price: $price, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Subscription &&
            id == other.id &&
            name == other.name &&
            logoAsset == other.logoAsset &&
            brandColor == other.brandColor &&
            category == other.category &&
            price == other.price &&
            currency == other.currency &&
            billingCycle == other.billingCycle &&
            renewalDate == other.renewalDate &&
            isTrial == other.isTrial &&
            trialEndDate == other.trialEndDate &&
            status == other.status &&
            reminderDays.toString() == other.reminderDays.toString() &&
            website == other.website &&
            notes == other.notes &&
            autoRenew == other.autoRenew &&
            isArchived == other.isArchived &&
            cancelledAt == other.cancelledAt &&
            lastNotifiedAt == other.lastNotifiedAt &&
            createdAt == other.createdAt &&
            updatedAt == other.updatedAt;
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    logoAsset,
    brandColor,
    category,
    price,
    currency,
    billingCycle,
    renewalDate,
    isTrial,
    trialEndDate,
    status,
    reminderDays,
    website,
    notes,
    autoRenew,
    isArchived,
    cancelledAt,
    lastNotifiedAt,
    createdAt,
    // updatedAt,
  );
}
