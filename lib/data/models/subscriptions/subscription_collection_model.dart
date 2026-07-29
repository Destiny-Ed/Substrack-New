import 'package:isar_community/isar.dart';

part 'subscription_collection_model.g.dart';

@collection
class SubscriptionCollection {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  final String id;

  final String name;

  final int color;

  String? icon;

  final DateTime createdAt;

  SubscriptionCollection({
    required this.id,
    required this.name,
    required this.color,
    required this.createdAt,
  });
}
