import 'package:subtrack/data/enums.dart';

class SubscriptionCatalog {
  final String id;

  /// Display name
  final String name;

  /// Local asset path
  final String logoAsset;

  /// Brand color
  final int brandColor;

  final SubscriptionCategory category;

  /// Company website
  final String website;

  /// Suggested billing cycle
  final BillingCycle billingCycle;

  /// Suggested monthly/yearly price.
  /// Can be null because pricing differs by region.
  final double? suggestedPrice;

  /// ISO currency code.
  final String? currency;

  /// Search keywords
  final List<String> keywords;

  /// Whether this service is featured.
  final bool featured;

  const SubscriptionCatalog({
    required this.id,
    required this.name,
    required this.logoAsset,
    required this.brandColor,
    required this.category,
    required this.website,
    required this.billingCycle,
    this.suggestedPrice,
    this.currency,
    this.keywords = const [],
    this.featured = false,
  });

  SubscriptionCatalog copyWith({
    String? id,
    String? name,
    String? logoAsset,
    int? brandColor,
    SubscriptionCategory? category,
    String? website,
    BillingCycle? billingCycle,
    double? suggestedPrice,
    String? currency,
    List<String>? keywords,
    bool? featured,
  }) {
    return SubscriptionCatalog(
      id: id ?? this.id,
      name: name ?? this.name,
      logoAsset: logoAsset ?? this.logoAsset,
      brandColor: brandColor ?? this.brandColor,
      category: category ?? this.category,
      website: website ?? this.website,
      billingCycle: billingCycle ?? this.billingCycle,
      suggestedPrice: suggestedPrice ?? this.suggestedPrice,
      currency: currency ?? this.currency,
      keywords: keywords ?? this.keywords,
      featured: featured ?? this.featured,
    );
  }

  factory SubscriptionCatalog.fromJson(Map<String, dynamic> json) {
    return SubscriptionCatalog(
      id: json['id'],
      name: json['name'],
      logoAsset: json['logoAsset'],
      brandColor: json['brandColor'],
      category: SubscriptionCategory.values.firstWhere((e) => e.name == json['category']),
      website: json['website'],
      billingCycle: BillingCycle.values.firstWhere((e) => e.name == json['billingCycle']),
      suggestedPrice: json['suggestedPrice'] == null ? null : (json['suggestedPrice'] as num).toDouble(),
      currency: json['currency'],
      keywords: List<String>.from(json['keywords'] ?? []),
      featured: json['featured'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logoAsset': logoAsset,
      'brandColor': brandColor,
      'category': category.name,
      'website': website,
      'billingCycle': billingCycle.name,
      'suggestedPrice': suggestedPrice,
      'currency': currency,
      'keywords': keywords,
      'featured': featured,
    };
  }

  @override
  String toString() {
    return 'SubscriptionCatalog(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SubscriptionCatalog &&
            id == other.id &&
            name == other.name &&
            logoAsset == other.logoAsset &&
            brandColor == other.brandColor &&
            category == other.category &&
            website == other.website &&
            billingCycle == other.billingCycle &&
            suggestedPrice == other.suggestedPrice &&
            currency == other.currency &&
            featured == other.featured &&
            keywords.join(',') == other.keywords.join(',');
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    logoAsset,
    brandColor,
    category,
    website,
    billingCycle,
    suggestedPrice,
    currency,
    featured,
    Object.hashAll(keywords),
  );
}
