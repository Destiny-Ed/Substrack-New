import 'package:flutter/foundation.dart';
import 'package:isar_community/isar.dart';
import 'package:subtrack/core/enums.dart';

import 'package:uuid/uuid.dart';

part 'subscription_models.g.dart';

@collection
class Subscription {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  final String id;

  final String name;

  final String? logoAsset;

  final int brandColor;

  String? collectionId;

  @Enumerated(EnumType.name)
  @Index()
  final SubscriptionCategory category;

  final double price;

  /// ISO currency code (USD, NGN, EUR...)
  final String currency;

  @Enumerated(EnumType.name)
  final BillingCycle billingCycle;

  @Index()
  final DateTime renewalDate;

  /// Whether this is currently a free trial
  final bool isTrial;

  /// Trial expiration date
  final DateTime? trialEndDate;

  @Enumerated(EnumType.name)
  @Index()
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

  @Index()
  final bool isArchived;

  final DateTime? cancelledAt;

  final DateTime? lastNotifiedAt;

  final DateTime createdAt;

  final DateTime updatedAt;

  Subscription({
    this.isarId = Isar.autoIncrement,
    required this.id,
    required this.name,
    this.logoAsset,
    required this.brandColor,
    required this.category,
    required this.price,
    required this.currency,
    this.collectionId,
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

  bool get isCancelled => status == SubscriptionStatus.cancelled;

  bool get isExpired => renewalDate.isBefore(DateTime.now());

  bool get hasTrial => trialEndDate != null;

  bool get hasNotes => notes?.isNotEmpty ?? false;

  int get daysUntilRenewal {
    return renewalDate.difference(DateTime.now()).inDays;
  }

  bool get renewsToday => daysUntilRenewal == 0;

  bool get renewsThisWeek => daysUntilRenewal >= 0 && daysUntilRenewal <= 7;

  factory Subscription.create({
    required String name,
    required SubscriptionCategory category,
    required double price,
    required String currency,
    required BillingCycle billingCycle,
    required DateTime renewalDate,
  }) {
    final now = DateTime.now();

    return Subscription(
      id: const Uuid().v4(),
      name: name,
      logoAsset: null,
      brandColor: 0xFF2196F3,
      category: category,
      price: price,
      currency: currency,
      billingCycle: billingCycle,
      renewalDate: renewalDate,
      isTrial: false,
      status: SubscriptionStatus.active,
      reminderDays: const [7, 3, 1, 0],
      autoRenew: true,
      createdAt: now,
      updatedAt: now,
    );
  }

  Subscription copyWith({
    String? id,
    String? name,
    String? logoAsset,
    int? brandColor,
    SubscriptionCategory? category,
    double? price,
    String? currency,
    String? collectionId,
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
      collectionId: collectionId ?? this.collectionId,
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
      collectionId: json['collectionId'] as String?,
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
      'collectionId': collectionId,
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
            collectionId == other.collectionId &&
            currency == other.currency &&
            billingCycle == other.billingCycle &&
            renewalDate == other.renewalDate &&
            isTrial == other.isTrial &&
            trialEndDate == other.trialEndDate &&
            status == other.status &&
            // reminderDays.toString() == other.reminderDays.toString() &&
            listEquals(reminderDays, other.reminderDays) &&
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
