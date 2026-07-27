// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSubscriptionCollection on Isar {
  IsarCollection<Subscription> get subscriptions => this.collection();
}

const SubscriptionSchema = CollectionSchema(
  name: r'Subscription',
  id: -3426239935225026138,
  properties: {
    r'autoRenew': PropertySchema(
      id: 0,
      name: r'autoRenew',
      type: IsarType.bool,
    ),
    r'billingCycle': PropertySchema(
      id: 1,
      name: r'billingCycle',
      type: IsarType.string,
      enumMap: _SubscriptionbillingCycleEnumValueMap,
    ),
    r'brandColor': PropertySchema(
      id: 2,
      name: r'brandColor',
      type: IsarType.long,
    ),
    r'cancelledAt': PropertySchema(
      id: 3,
      name: r'cancelledAt',
      type: IsarType.dateTime,
    ),
    r'category': PropertySchema(
      id: 4,
      name: r'category',
      type: IsarType.string,
      enumMap: _SubscriptioncategoryEnumValueMap,
    ),
    r'createdAt': PropertySchema(
      id: 5,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currency': PropertySchema(
      id: 6,
      name: r'currency',
      type: IsarType.string,
    ),
    r'daysUntilRenewal': PropertySchema(
      id: 7,
      name: r'daysUntilRenewal',
      type: IsarType.long,
    ),
    r'hasNotes': PropertySchema(id: 8, name: r'hasNotes', type: IsarType.bool),
    r'hasTrial': PropertySchema(id: 9, name: r'hasTrial', type: IsarType.bool),
    r'hashCode': PropertySchema(id: 10, name: r'hashCode', type: IsarType.long),
    r'id': PropertySchema(id: 11, name: r'id', type: IsarType.string),
    r'isArchived': PropertySchema(
      id: 12,
      name: r'isArchived',
      type: IsarType.bool,
    ),
    r'isCancelled': PropertySchema(
      id: 13,
      name: r'isCancelled',
      type: IsarType.bool,
    ),
    r'isExpired': PropertySchema(
      id: 14,
      name: r'isExpired',
      type: IsarType.bool,
    ),
    r'isTrial': PropertySchema(id: 15, name: r'isTrial', type: IsarType.bool),
    r'lastNotifiedAt': PropertySchema(
      id: 16,
      name: r'lastNotifiedAt',
      type: IsarType.dateTime,
    ),
    r'logoAsset': PropertySchema(
      id: 17,
      name: r'logoAsset',
      type: IsarType.string,
    ),
    r'name': PropertySchema(id: 18, name: r'name', type: IsarType.string),
    r'notes': PropertySchema(id: 19, name: r'notes', type: IsarType.string),
    r'price': PropertySchema(id: 20, name: r'price', type: IsarType.double),
    r'reminderDays': PropertySchema(
      id: 21,
      name: r'reminderDays',
      type: IsarType.longList,
    ),
    r'renewalDate': PropertySchema(
      id: 22,
      name: r'renewalDate',
      type: IsarType.dateTime,
    ),
    r'renewsThisWeek': PropertySchema(
      id: 23,
      name: r'renewsThisWeek',
      type: IsarType.bool,
    ),
    r'renewsToday': PropertySchema(
      id: 24,
      name: r'renewsToday',
      type: IsarType.bool,
    ),
    r'status': PropertySchema(
      id: 25,
      name: r'status',
      type: IsarType.string,
      enumMap: _SubscriptionstatusEnumValueMap,
    ),
    r'trialEndDate': PropertySchema(
      id: 26,
      name: r'trialEndDate',
      type: IsarType.dateTime,
    ),
    r'updatedAt': PropertySchema(
      id: 27,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'website': PropertySchema(id: 28, name: r'website', type: IsarType.string),
  },

  estimateSize: _subscriptionEstimateSize,
  serialize: _subscriptionSerialize,
  deserialize: _subscriptionDeserialize,
  deserializeProp: _subscriptionDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'id': IndexSchema(
      id: -3268401673993471357,
      name: r'id',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'id',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'category': IndexSchema(
      id: -7560358558326323820,
      name: r'category',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'category',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'renewalDate': IndexSchema(
      id: 4609864393096219240,
      name: r'renewalDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'renewalDate',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'isArchived': IndexSchema(
      id: 655844772568347876,
      name: r'isArchived',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isArchived',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _subscriptionGetId,
  getLinks: _subscriptionGetLinks,
  attach: _subscriptionAttach,
  version: '3.3.2',
);

int _subscriptionEstimateSize(
  Subscription object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.billingCycle.name.length * 3;
  bytesCount += 3 + object.category.name.length * 3;
  bytesCount += 3 + object.currency.length * 3;
  bytesCount += 3 + object.id.length * 3;
  {
    final value = object.logoAsset;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.reminderDays.length * 8;
  bytesCount += 3 + object.status.name.length * 3;
  {
    final value = object.website;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _subscriptionSerialize(
  Subscription object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.autoRenew);
  writer.writeString(offsets[1], object.billingCycle.name);
  writer.writeLong(offsets[2], object.brandColor);
  writer.writeDateTime(offsets[3], object.cancelledAt);
  writer.writeString(offsets[4], object.category.name);
  writer.writeDateTime(offsets[5], object.createdAt);
  writer.writeString(offsets[6], object.currency);
  writer.writeLong(offsets[7], object.daysUntilRenewal);
  writer.writeBool(offsets[8], object.hasNotes);
  writer.writeBool(offsets[9], object.hasTrial);
  writer.writeLong(offsets[10], object.hashCode);
  writer.writeString(offsets[11], object.id);
  writer.writeBool(offsets[12], object.isArchived);
  writer.writeBool(offsets[13], object.isCancelled);
  writer.writeBool(offsets[14], object.isExpired);
  writer.writeBool(offsets[15], object.isTrial);
  writer.writeDateTime(offsets[16], object.lastNotifiedAt);
  writer.writeString(offsets[17], object.logoAsset);
  writer.writeString(offsets[18], object.name);
  writer.writeString(offsets[19], object.notes);
  writer.writeDouble(offsets[20], object.price);
  writer.writeLongList(offsets[21], object.reminderDays);
  writer.writeDateTime(offsets[22], object.renewalDate);
  writer.writeBool(offsets[23], object.renewsThisWeek);
  writer.writeBool(offsets[24], object.renewsToday);
  writer.writeString(offsets[25], object.status.name);
  writer.writeDateTime(offsets[26], object.trialEndDate);
  writer.writeDateTime(offsets[27], object.updatedAt);
  writer.writeString(offsets[28], object.website);
}

Subscription _subscriptionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Subscription(
    autoRenew: reader.readBool(offsets[0]),
    billingCycle:
        _SubscriptionbillingCycleValueEnumMap[reader.readStringOrNull(
          offsets[1],
        )] ??
        BillingCycle.weekly,
    brandColor: reader.readLong(offsets[2]),
    cancelledAt: reader.readDateTimeOrNull(offsets[3]),
    category:
        _SubscriptioncategoryValueEnumMap[reader.readStringOrNull(
          offsets[4],
        )] ??
        SubscriptionCategory.streaming,
    createdAt: reader.readDateTime(offsets[5]),
    currency: reader.readString(offsets[6]),
    id: reader.readString(offsets[11]),
    isArchived: reader.readBoolOrNull(offsets[12]) ?? false,
    isTrial: reader.readBool(offsets[15]),
    isarId: id,
    lastNotifiedAt: reader.readDateTimeOrNull(offsets[16]),
    logoAsset: reader.readStringOrNull(offsets[17]),
    name: reader.readString(offsets[18]),
    notes: reader.readStringOrNull(offsets[19]),
    price: reader.readDouble(offsets[20]),
    reminderDays: reader.readLongList(offsets[21]) ?? [],
    renewalDate: reader.readDateTime(offsets[22]),
    status:
        _SubscriptionstatusValueEnumMap[reader.readStringOrNull(offsets[25])] ??
        SubscriptionStatus.active,
    trialEndDate: reader.readDateTimeOrNull(offsets[26]),
    updatedAt: reader.readDateTime(offsets[27]),
    website: reader.readStringOrNull(offsets[28]),
  );
  return object;
}

P _subscriptionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (_SubscriptionbillingCycleValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              BillingCycle.weekly)
          as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (_SubscriptioncategoryValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              SubscriptionCategory.streaming)
          as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readDouble(offset)) as P;
    case 21:
      return (reader.readLongList(offset) ?? []) as P;
    case 22:
      return (reader.readDateTime(offset)) as P;
    case 23:
      return (reader.readBool(offset)) as P;
    case 24:
      return (reader.readBool(offset)) as P;
    case 25:
      return (_SubscriptionstatusValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              SubscriptionStatus.active)
          as P;
    case 26:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 27:
      return (reader.readDateTime(offset)) as P;
    case 28:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SubscriptionbillingCycleEnumValueMap = {
  r'weekly': r'weekly',
  r'monthly': r'monthly',
  r'quarterly': r'quarterly',
  r'yearly': r'yearly',
  r'custom': r'custom',
};
const _SubscriptionbillingCycleValueEnumMap = {
  r'weekly': BillingCycle.weekly,
  r'monthly': BillingCycle.monthly,
  r'quarterly': BillingCycle.quarterly,
  r'yearly': BillingCycle.yearly,
  r'custom': BillingCycle.custom,
};
const _SubscriptioncategoryEnumValueMap = {
  r'streaming': r'streaming',
  r'ai': r'ai',
  r'music': r'music',
  r'gaming': r'gaming',
  r'productivity': r'productivity',
  r'cloud': r'cloud',
  r'finance': r'finance',
  r'education': r'education',
  r'shopping': r'shopping',
  r'fitness': r'fitness',
  r'utilities': r'utilities',
  r'business': r'business',
  r'health': r'health',
  r'other': r'other',
};
const _SubscriptioncategoryValueEnumMap = {
  r'streaming': SubscriptionCategory.streaming,
  r'ai': SubscriptionCategory.ai,
  r'music': SubscriptionCategory.music,
  r'gaming': SubscriptionCategory.gaming,
  r'productivity': SubscriptionCategory.productivity,
  r'cloud': SubscriptionCategory.cloud,
  r'finance': SubscriptionCategory.finance,
  r'education': SubscriptionCategory.education,
  r'shopping': SubscriptionCategory.shopping,
  r'fitness': SubscriptionCategory.fitness,
  r'utilities': SubscriptionCategory.utilities,
  r'business': SubscriptionCategory.business,
  r'health': SubscriptionCategory.health,
  r'other': SubscriptionCategory.other,
};
const _SubscriptionstatusEnumValueMap = {
  r'active': r'active',
  r'cancelled': r'cancelled',
  r'expired': r'expired',
  r'paused': r'paused',
};
const _SubscriptionstatusValueEnumMap = {
  r'active': SubscriptionStatus.active,
  r'cancelled': SubscriptionStatus.cancelled,
  r'expired': SubscriptionStatus.expired,
  r'paused': SubscriptionStatus.paused,
};

Id _subscriptionGetId(Subscription object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _subscriptionGetLinks(Subscription object) {
  return [];
}

void _subscriptionAttach(
  IsarCollection<dynamic> col,
  Id id,
  Subscription object,
) {
  object.isarId = id;
}

extension SubscriptionByIndex on IsarCollection<Subscription> {
  Future<Subscription?> getById(String id) {
    return getByIndex(r'id', [id]);
  }

  Subscription? getByIdSync(String id) {
    return getByIndexSync(r'id', [id]);
  }

  Future<bool> deleteById(String id) {
    return deleteByIndex(r'id', [id]);
  }

  bool deleteByIdSync(String id) {
    return deleteByIndexSync(r'id', [id]);
  }

  Future<List<Subscription?>> getAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndex(r'id', values);
  }

  List<Subscription?> getAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'id', values);
  }

  Future<int> deleteAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'id', values);
  }

  int deleteAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'id', values);
  }

  Future<Id> putById(Subscription object) {
    return putByIndex(r'id', object);
  }

  Id putByIdSync(Subscription object, {bool saveLinks = true}) {
    return putByIndexSync(r'id', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllById(List<Subscription> objects) {
    return putAllByIndex(r'id', objects);
  }

  List<Id> putAllByIdSync(List<Subscription> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'id', objects, saveLinks: saveLinks);
  }
}

extension SubscriptionQueryWhereSort
    on QueryBuilder<Subscription, Subscription, QWhere> {
  QueryBuilder<Subscription, Subscription, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhere> anyRenewalDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'renewalDate'),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhere> anyIsArchived() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isArchived'),
      );
    });
  }
}

extension SubscriptionQueryWhere
    on QueryBuilder<Subscription, Subscription, QWhereClause> {
  QueryBuilder<Subscription, Subscription, QAfterWhereClause> isarIdEqualTo(
    Id isarId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause> isarIdNotEqualTo(
    Id isarId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause> isarIdGreaterThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause> isarIdLessThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerIsarId,
          includeLower: includeLower,
          upper: upperIsarId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause> idEqualTo(
    String id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'id', value: [id]),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause> idNotEqualTo(
    String id,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'id',
                lower: [],
                upper: [id],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'id',
                lower: [id],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'id',
                lower: [id],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'id',
                lower: [],
                upper: [id],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause> categoryEqualTo(
    SubscriptionCategory category,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'category', value: [category]),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause>
  categoryNotEqualTo(SubscriptionCategory category) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'category',
                lower: [],
                upper: [category],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'category',
                lower: [category],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'category',
                lower: [category],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'category',
                lower: [],
                upper: [category],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause>
  renewalDateEqualTo(DateTime renewalDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'renewalDate',
          value: [renewalDate],
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause>
  renewalDateNotEqualTo(DateTime renewalDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'renewalDate',
                lower: [],
                upper: [renewalDate],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'renewalDate',
                lower: [renewalDate],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'renewalDate',
                lower: [renewalDate],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'renewalDate',
                lower: [],
                upper: [renewalDate],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause>
  renewalDateGreaterThan(DateTime renewalDate, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'renewalDate',
          lower: [renewalDate],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause>
  renewalDateLessThan(DateTime renewalDate, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'renewalDate',
          lower: [],
          upper: [renewalDate],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause>
  renewalDateBetween(
    DateTime lowerRenewalDate,
    DateTime upperRenewalDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'renewalDate',
          lower: [lowerRenewalDate],
          includeLower: includeLower,
          upper: [upperRenewalDate],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause> statusEqualTo(
    SubscriptionStatus status,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'status', value: [status]),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause> statusNotEqualTo(
    SubscriptionStatus status,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [],
                upper: [status],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [status],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [status],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [],
                upper: [status],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause> isArchivedEqualTo(
    bool isArchived,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'isArchived', value: [isArchived]),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterWhereClause>
  isArchivedNotEqualTo(bool isArchived) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isArchived',
                lower: [],
                upper: [isArchived],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isArchived',
                lower: [isArchived],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isArchived',
                lower: [isArchived],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isArchived',
                lower: [],
                upper: [isArchived],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension SubscriptionQueryFilter
    on QueryBuilder<Subscription, Subscription, QFilterCondition> {
  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  autoRenewEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'autoRenew', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  billingCycleEqualTo(BillingCycle value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'billingCycle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  billingCycleGreaterThan(
    BillingCycle value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'billingCycle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  billingCycleLessThan(
    BillingCycle value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'billingCycle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  billingCycleBetween(
    BillingCycle lower,
    BillingCycle upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'billingCycle',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  billingCycleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'billingCycle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  billingCycleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'billingCycle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  billingCycleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'billingCycle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  billingCycleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'billingCycle',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  billingCycleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'billingCycle', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  billingCycleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'billingCycle', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  brandColorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'brandColor', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  brandColorGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'brandColor',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  brandColorLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'brandColor',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  brandColorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'brandColor',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  cancelledAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'cancelledAt'),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  cancelledAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'cancelledAt'),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  cancelledAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cancelledAt', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  cancelledAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cancelledAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  cancelledAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cancelledAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  cancelledAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cancelledAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  categoryEqualTo(SubscriptionCategory value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  categoryGreaterThan(
    SubscriptionCategory value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  categoryLessThan(
    SubscriptionCategory value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  categoryBetween(
    SubscriptionCategory lower,
    SubscriptionCategory upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'category',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  categoryStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  categoryEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'category',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'category',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'category', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'category', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  currencyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  currencyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  currencyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  currencyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currency',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  currencyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  currencyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  currencyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  currencyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'currency',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  currencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currency', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  currencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'currency', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  daysUntilRenewalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'daysUntilRenewal', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  daysUntilRenewalGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'daysUntilRenewal',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  daysUntilRenewalLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'daysUntilRenewal',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  daysUntilRenewalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'daysUntilRenewal',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  hasNotesEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasNotes', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  hasTrialEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasTrial', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hashCode', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  hashCodeGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hashCode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  hashCodeLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hashCode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hashCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'id',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'id',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'id',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> idContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'id',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> idMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'id',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'id', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  isArchivedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isArchived', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  isCancelledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isCancelled', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  isExpiredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isExpired', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  isTrialEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isTrial', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> isarIdEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  isarIdGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'isarId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  isarIdLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'isarId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'isarId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  lastNotifiedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastNotifiedAt'),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  lastNotifiedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastNotifiedAt'),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  lastNotifiedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastNotifiedAt', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  lastNotifiedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastNotifiedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  lastNotifiedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastNotifiedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  lastNotifiedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastNotifiedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  logoAssetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'logoAsset'),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  logoAssetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'logoAsset'),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  logoAssetEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'logoAsset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  logoAssetGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'logoAsset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  logoAssetLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'logoAsset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  logoAssetBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'logoAsset',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  logoAssetStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'logoAsset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  logoAssetEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'logoAsset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  logoAssetContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'logoAsset',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  logoAssetMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'logoAsset',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  logoAssetIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'logoAsset', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  logoAssetIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'logoAsset', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'notes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  notesStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> notesContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'notes',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> notesMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'notes',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'notes', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> priceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'price',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  priceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'price',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> priceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'price',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> priceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'price',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  reminderDaysElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'reminderDays', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  reminderDaysElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reminderDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  reminderDaysElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reminderDays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  reminderDaysElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reminderDays',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  reminderDaysLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'reminderDays', length, true, length, true);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  reminderDaysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'reminderDays', 0, true, 0, true);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  reminderDaysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'reminderDays', 0, false, 999999, true);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  reminderDaysLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'reminderDays', 0, true, length, include);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  reminderDaysLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'reminderDays', length, include, 999999, true);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  reminderDaysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reminderDays',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  renewalDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'renewalDate', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  renewalDateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'renewalDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  renewalDateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'renewalDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  renewalDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'renewalDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  renewsThisWeekEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'renewsThisWeek', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  renewsTodayEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'renewsToday', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> statusEqualTo(
    SubscriptionStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  statusGreaterThan(
    SubscriptionStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  statusLessThan(
    SubscriptionStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> statusBetween(
    SubscriptionStatus lower,
    SubscriptionStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  statusStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  statusEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'status',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition> statusMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'status',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'status', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  trialEndDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'trialEndDate'),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  trialEndDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'trialEndDate'),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  trialEndDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'trialEndDate', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  trialEndDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'trialEndDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  trialEndDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'trialEndDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  trialEndDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'trialEndDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  websiteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'website'),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  websiteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'website'),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  websiteEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'website',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  websiteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'website',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  websiteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'website',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  websiteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'website',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  websiteStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'website',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  websiteEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'website',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  websiteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'website',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  websiteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'website',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  websiteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'website', value: ''),
      );
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterFilterCondition>
  websiteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'website', value: ''),
      );
    });
  }
}

extension SubscriptionQueryObject
    on QueryBuilder<Subscription, Subscription, QFilterCondition> {}

extension SubscriptionQueryLinks
    on QueryBuilder<Subscription, Subscription, QFilterCondition> {}

extension SubscriptionQuerySortBy
    on QueryBuilder<Subscription, Subscription, QSortBy> {
  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByAutoRenew() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoRenew', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByAutoRenewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoRenew', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByBillingCycle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billingCycle', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  sortByBillingCycleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billingCycle', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByBrandColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandColor', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  sortByBrandColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandColor', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByCancelledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  sortByCancelledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  sortByDaysUntilRenewal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysUntilRenewal', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  sortByDaysUntilRenewalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysUntilRenewal', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByHasNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasNotes', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByHasNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasNotes', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByHasTrial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTrial', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByHasTrialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTrial', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByIsArchived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isArchived', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  sortByIsArchivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isArchived', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByIsCancelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  sortByIsCancelledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByIsExpired() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpired', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByIsExpiredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpired', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByIsTrial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTrial', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByIsTrialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTrial', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  sortByLastNotifiedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastNotifiedAt', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  sortByLastNotifiedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastNotifiedAt', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByLogoAsset() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoAsset', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByLogoAssetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoAsset', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByRenewalDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'renewalDate', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  sortByRenewalDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'renewalDate', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  sortByRenewsThisWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'renewsThisWeek', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  sortByRenewsThisWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'renewsThisWeek', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByRenewsToday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'renewsToday', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  sortByRenewsTodayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'renewsToday', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByTrialEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEndDate', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  sortByTrialEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEndDate', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByWebsite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'website', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> sortByWebsiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'website', Sort.desc);
    });
  }
}

extension SubscriptionQuerySortThenBy
    on QueryBuilder<Subscription, Subscription, QSortThenBy> {
  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByAutoRenew() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoRenew', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByAutoRenewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoRenew', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByBillingCycle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billingCycle', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  thenByBillingCycleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'billingCycle', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByBrandColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandColor', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  thenByBrandColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'brandColor', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByCancelledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  thenByCancelledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cancelledAt', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  thenByDaysUntilRenewal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysUntilRenewal', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  thenByDaysUntilRenewalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysUntilRenewal', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByHasNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasNotes', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByHasNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasNotes', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByHasTrial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTrial', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByHasTrialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasTrial', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByIsArchived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isArchived', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  thenByIsArchivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isArchived', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByIsCancelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  thenByIsCancelledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByIsExpired() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpired', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByIsExpiredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpired', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByIsTrial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTrial', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByIsTrialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTrial', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  thenByLastNotifiedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastNotifiedAt', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  thenByLastNotifiedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastNotifiedAt', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByLogoAsset() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoAsset', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByLogoAssetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoAsset', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByRenewalDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'renewalDate', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  thenByRenewalDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'renewalDate', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  thenByRenewsThisWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'renewsThisWeek', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  thenByRenewsThisWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'renewsThisWeek', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByRenewsToday() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'renewsToday', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  thenByRenewsTodayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'renewsToday', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByTrialEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEndDate', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy>
  thenByTrialEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trialEndDate', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByWebsite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'website', Sort.asc);
    });
  }

  QueryBuilder<Subscription, Subscription, QAfterSortBy> thenByWebsiteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'website', Sort.desc);
    });
  }
}

extension SubscriptionQueryWhereDistinct
    on QueryBuilder<Subscription, Subscription, QDistinct> {
  QueryBuilder<Subscription, Subscription, QDistinct> distinctByAutoRenew() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoRenew');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByBillingCycle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'billingCycle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByBrandColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'brandColor');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByCancelledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cancelledAt');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByCategory({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByCurrency({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currency', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct>
  distinctByDaysUntilRenewal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'daysUntilRenewal');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByHasNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasNotes');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByHasTrial() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasTrial');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctById({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByIsArchived() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isArchived');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByIsCancelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCancelled');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByIsExpired() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isExpired');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByIsTrial() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isTrial');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct>
  distinctByLastNotifiedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastNotifiedAt');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByLogoAsset({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logoAsset', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByNotes({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByReminderDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reminderDays');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByRenewalDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'renewalDate');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct>
  distinctByRenewsThisWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'renewsThisWeek');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByRenewsToday() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'renewsToday');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByStatus({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByTrialEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trialEndDate');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Subscription, Subscription, QDistinct> distinctByWebsite({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'website', caseSensitive: caseSensitive);
    });
  }
}

extension SubscriptionQueryProperty
    on QueryBuilder<Subscription, Subscription, QQueryProperty> {
  QueryBuilder<Subscription, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Subscription, bool, QQueryOperations> autoRenewProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoRenew');
    });
  }

  QueryBuilder<Subscription, BillingCycle, QQueryOperations>
  billingCycleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'billingCycle');
    });
  }

  QueryBuilder<Subscription, int, QQueryOperations> brandColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'brandColor');
    });
  }

  QueryBuilder<Subscription, DateTime?, QQueryOperations>
  cancelledAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cancelledAt');
    });
  }

  QueryBuilder<Subscription, SubscriptionCategory, QQueryOperations>
  categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<Subscription, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Subscription, String, QQueryOperations> currencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currency');
    });
  }

  QueryBuilder<Subscription, int, QQueryOperations> daysUntilRenewalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'daysUntilRenewal');
    });
  }

  QueryBuilder<Subscription, bool, QQueryOperations> hasNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasNotes');
    });
  }

  QueryBuilder<Subscription, bool, QQueryOperations> hasTrialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasTrial');
    });
  }

  QueryBuilder<Subscription, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<Subscription, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Subscription, bool, QQueryOperations> isArchivedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isArchived');
    });
  }

  QueryBuilder<Subscription, bool, QQueryOperations> isCancelledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCancelled');
    });
  }

  QueryBuilder<Subscription, bool, QQueryOperations> isExpiredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isExpired');
    });
  }

  QueryBuilder<Subscription, bool, QQueryOperations> isTrialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isTrial');
    });
  }

  QueryBuilder<Subscription, DateTime?, QQueryOperations>
  lastNotifiedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastNotifiedAt');
    });
  }

  QueryBuilder<Subscription, String?, QQueryOperations> logoAssetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logoAsset');
    });
  }

  QueryBuilder<Subscription, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Subscription, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<Subscription, double, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<Subscription, List<int>, QQueryOperations>
  reminderDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reminderDays');
    });
  }

  QueryBuilder<Subscription, DateTime, QQueryOperations> renewalDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'renewalDate');
    });
  }

  QueryBuilder<Subscription, bool, QQueryOperations> renewsThisWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'renewsThisWeek');
    });
  }

  QueryBuilder<Subscription, bool, QQueryOperations> renewsTodayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'renewsToday');
    });
  }

  QueryBuilder<Subscription, SubscriptionStatus, QQueryOperations>
  statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Subscription, DateTime?, QQueryOperations>
  trialEndDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trialEndDate');
    });
  }

  QueryBuilder<Subscription, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Subscription, String?, QQueryOperations> websiteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'website');
    });
  }
}
