// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RestaurantsTable extends Restaurants
    with TableInfo<$RestaurantsTable, Restaurant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RestaurantsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _restaurantIdMeta = const VerificationMeta(
    'restaurantId',
  );
  @override
  late final GeneratedColumn<String> restaurantId = GeneratedColumn<String>(
    'restaurant_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pictureIdMeta = const VerificationMeta(
    'pictureId',
  );
  @override
  late final GeneratedColumn<String> pictureId = GeneratedColumn<String>(
    'picture_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    restaurantId,
    name,
    description,
    city,
    address,
    pictureId,
    rating,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'restaurants';
  @override
  VerificationContext validateIntegrity(
    Insertable<Restaurant> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('restaurant_id')) {
      context.handle(
        _restaurantIdMeta,
        restaurantId.isAcceptableOrUnknown(
          data['restaurant_id']!,
          _restaurantIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_restaurantIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('picture_id')) {
      context.handle(
        _pictureIdMeta,
        pictureId.isAcceptableOrUnknown(data['picture_id']!, _pictureIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pictureIdMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {restaurantId};
  @override
  Restaurant map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Restaurant(
      restaurantId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}restaurant_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      city:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}city'],
          )!,
      address:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}address'],
          )!,
      pictureId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}picture_id'],
          )!,
      rating:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}rating'],
          )!,
    );
  }

  @override
  $RestaurantsTable createAlias(String alias) {
    return $RestaurantsTable(attachedDatabase, alias);
  }
}

class Restaurant extends DataClass implements Insertable<Restaurant> {
  final String restaurantId;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final double rating;
  const Restaurant({
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.rating,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['restaurant_id'] = Variable<String>(restaurantId);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['city'] = Variable<String>(city);
    map['address'] = Variable<String>(address);
    map['picture_id'] = Variable<String>(pictureId);
    map['rating'] = Variable<double>(rating);
    return map;
  }

  RestaurantsCompanion toCompanion(bool nullToAbsent) {
    return RestaurantsCompanion(
      restaurantId: Value(restaurantId),
      name: Value(name),
      description: Value(description),
      city: Value(city),
      address: Value(address),
      pictureId: Value(pictureId),
      rating: Value(rating),
    );
  }

  factory Restaurant.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Restaurant(
      restaurantId: serializer.fromJson<String>(json['restaurantId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      city: serializer.fromJson<String>(json['city']),
      address: serializer.fromJson<String>(json['address']),
      pictureId: serializer.fromJson<String>(json['pictureId']),
      rating: serializer.fromJson<double>(json['rating']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'restaurantId': serializer.toJson<String>(restaurantId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'city': serializer.toJson<String>(city),
      'address': serializer.toJson<String>(address),
      'pictureId': serializer.toJson<String>(pictureId),
      'rating': serializer.toJson<double>(rating),
    };
  }

  Restaurant copyWith({
    String? restaurantId,
    String? name,
    String? description,
    String? city,
    String? address,
    String? pictureId,
    double? rating,
  }) => Restaurant(
    restaurantId: restaurantId ?? this.restaurantId,
    name: name ?? this.name,
    description: description ?? this.description,
    city: city ?? this.city,
    address: address ?? this.address,
    pictureId: pictureId ?? this.pictureId,
    rating: rating ?? this.rating,
  );
  Restaurant copyWithCompanion(RestaurantsCompanion data) {
    return Restaurant(
      restaurantId:
          data.restaurantId.present
              ? data.restaurantId.value
              : this.restaurantId,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      city: data.city.present ? data.city.value : this.city,
      address: data.address.present ? data.address.value : this.address,
      pictureId: data.pictureId.present ? data.pictureId.value : this.pictureId,
      rating: data.rating.present ? data.rating.value : this.rating,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Restaurant(')
          ..write('restaurantId: $restaurantId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('city: $city, ')
          ..write('address: $address, ')
          ..write('pictureId: $pictureId, ')
          ..write('rating: $rating')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    restaurantId,
    name,
    description,
    city,
    address,
    pictureId,
    rating,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Restaurant &&
          other.restaurantId == this.restaurantId &&
          other.name == this.name &&
          other.description == this.description &&
          other.city == this.city &&
          other.address == this.address &&
          other.pictureId == this.pictureId &&
          other.rating == this.rating);
}

class RestaurantsCompanion extends UpdateCompanion<Restaurant> {
  final Value<String> restaurantId;
  final Value<String> name;
  final Value<String> description;
  final Value<String> city;
  final Value<String> address;
  final Value<String> pictureId;
  final Value<double> rating;
  final Value<int> rowid;
  const RestaurantsCompanion({
    this.restaurantId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.city = const Value.absent(),
    this.address = const Value.absent(),
    this.pictureId = const Value.absent(),
    this.rating = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RestaurantsCompanion.insert({
    required String restaurantId,
    required String name,
    required String description,
    required String city,
    required String address,
    required String pictureId,
    required double rating,
    this.rowid = const Value.absent(),
  }) : restaurantId = Value(restaurantId),
       name = Value(name),
       description = Value(description),
       city = Value(city),
       address = Value(address),
       pictureId = Value(pictureId),
       rating = Value(rating);
  static Insertable<Restaurant> custom({
    Expression<String>? restaurantId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? city,
    Expression<String>? address,
    Expression<String>? pictureId,
    Expression<double>? rating,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (restaurantId != null) 'restaurant_id': restaurantId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (city != null) 'city': city,
      if (address != null) 'address': address,
      if (pictureId != null) 'picture_id': pictureId,
      if (rating != null) 'rating': rating,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RestaurantsCompanion copyWith({
    Value<String>? restaurantId,
    Value<String>? name,
    Value<String>? description,
    Value<String>? city,
    Value<String>? address,
    Value<String>? pictureId,
    Value<double>? rating,
    Value<int>? rowid,
  }) {
    return RestaurantsCompanion(
      restaurantId: restaurantId ?? this.restaurantId,
      name: name ?? this.name,
      description: description ?? this.description,
      city: city ?? this.city,
      address: address ?? this.address,
      pictureId: pictureId ?? this.pictureId,
      rating: rating ?? this.rating,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (restaurantId.present) {
      map['restaurant_id'] = Variable<String>(restaurantId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (pictureId.present) {
      map['picture_id'] = Variable<String>(pictureId.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RestaurantsCompanion(')
          ..write('restaurantId: $restaurantId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('city: $city, ')
          ..write('address: $address, ')
          ..write('pictureId: $pictureId, ')
          ..write('rating: $rating, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RestaurantsTable restaurants = $RestaurantsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [restaurants];
}

typedef $$RestaurantsTableCreateCompanionBuilder =
    RestaurantsCompanion Function({
      required String restaurantId,
      required String name,
      required String description,
      required String city,
      required String address,
      required String pictureId,
      required double rating,
      Value<int> rowid,
    });
typedef $$RestaurantsTableUpdateCompanionBuilder =
    RestaurantsCompanion Function({
      Value<String> restaurantId,
      Value<String> name,
      Value<String> description,
      Value<String> city,
      Value<String> address,
      Value<String> pictureId,
      Value<double> rating,
      Value<int> rowid,
    });

class $$RestaurantsTableFilterComposer
    extends Composer<_$AppDatabase, $RestaurantsTable> {
  $$RestaurantsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get restaurantId => $composableBuilder(
    column: $table.restaurantId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pictureId => $composableBuilder(
    column: $table.pictureId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RestaurantsTableOrderingComposer
    extends Composer<_$AppDatabase, $RestaurantsTable> {
  $$RestaurantsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get restaurantId => $composableBuilder(
    column: $table.restaurantId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pictureId => $composableBuilder(
    column: $table.pictureId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RestaurantsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RestaurantsTable> {
  $$RestaurantsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get restaurantId => $composableBuilder(
    column: $table.restaurantId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get pictureId =>
      $composableBuilder(column: $table.pictureId, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);
}

class $$RestaurantsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RestaurantsTable,
          Restaurant,
          $$RestaurantsTableFilterComposer,
          $$RestaurantsTableOrderingComposer,
          $$RestaurantsTableAnnotationComposer,
          $$RestaurantsTableCreateCompanionBuilder,
          $$RestaurantsTableUpdateCompanionBuilder,
          (
            Restaurant,
            BaseReferences<_$AppDatabase, $RestaurantsTable, Restaurant>,
          ),
          Restaurant,
          PrefetchHooks Function()
        > {
  $$RestaurantsTableTableManager(_$AppDatabase db, $RestaurantsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$RestaurantsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$RestaurantsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$RestaurantsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> restaurantId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> city = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> pictureId = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RestaurantsCompanion(
                restaurantId: restaurantId,
                name: name,
                description: description,
                city: city,
                address: address,
                pictureId: pictureId,
                rating: rating,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String restaurantId,
                required String name,
                required String description,
                required String city,
                required String address,
                required String pictureId,
                required double rating,
                Value<int> rowid = const Value.absent(),
              }) => RestaurantsCompanion.insert(
                restaurantId: restaurantId,
                name: name,
                description: description,
                city: city,
                address: address,
                pictureId: pictureId,
                rating: rating,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RestaurantsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RestaurantsTable,
      Restaurant,
      $$RestaurantsTableFilterComposer,
      $$RestaurantsTableOrderingComposer,
      $$RestaurantsTableAnnotationComposer,
      $$RestaurantsTableCreateCompanionBuilder,
      $$RestaurantsTableUpdateCompanionBuilder,
      (
        Restaurant,
        BaseReferences<_$AppDatabase, $RestaurantsTable, Restaurant>,
      ),
      Restaurant,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RestaurantsTableTableManager get restaurants =>
      $$RestaurantsTableTableManager(_db, _db.restaurants);
}
