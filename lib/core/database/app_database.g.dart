// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $LinksTable extends Links with TableInfo<$LinksTable, Link> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _domainMeta = const VerificationMeta('domain');
  @override
  late final GeneratedColumn<String> domain = GeneratedColumn<String>(
    'domain',
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
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _sourceImageUrlMeta = const VerificationMeta(
    'sourceImageUrl',
  );
  @override
  late final GeneratedColumn<String> sourceImageUrl = GeneratedColumn<String>(
    'source_image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _readingTimeMeta = const VerificationMeta(
    'readingTime',
  );
  @override
  late final GeneratedColumn<String> readingTime = GeneratedColumn<String>(
    'reading_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    url,
    domain,
    description,
    sourceImageUrl,
    readingTime,
    isArchived,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'links';
  @override
  VerificationContext validateIntegrity(
    Insertable<Link> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('domain')) {
      context.handle(
        _domainMeta,
        domain.isAcceptableOrUnknown(data['domain']!, _domainMeta),
      );
    } else if (isInserting) {
      context.missing(_domainMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('source_image_url')) {
      context.handle(
        _sourceImageUrlMeta,
        sourceImageUrl.isAcceptableOrUnknown(
          data['source_image_url']!,
          _sourceImageUrlMeta,
        ),
      );
    }
    if (data.containsKey('reading_time')) {
      context.handle(
        _readingTimeMeta,
        readingTime.isAcceptableOrUnknown(
          data['reading_time']!,
          _readingTimeMeta,
        ),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Link map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Link(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      domain: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}domain'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      sourceImageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_image_url'],
      ),
      readingTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reading_time'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LinksTable createAlias(String alias) {
    return $LinksTable(attachedDatabase, alias);
  }
}

class Link extends DataClass implements Insertable<Link> {
  final int id;
  final String title;
  final String url;
  final String domain;
  final String description;
  final String? sourceImageUrl;
  final String readingTime;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Link({
    required this.id,
    required this.title,
    required this.url,
    required this.domain,
    required this.description,
    this.sourceImageUrl,
    required this.readingTime,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['url'] = Variable<String>(url);
    map['domain'] = Variable<String>(domain);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || sourceImageUrl != null) {
      map['source_image_url'] = Variable<String>(sourceImageUrl);
    }
    map['reading_time'] = Variable<String>(readingTime);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  LinksCompanion toCompanion(bool nullToAbsent) {
    return LinksCompanion(
      id: Value(id),
      title: Value(title),
      url: Value(url),
      domain: Value(domain),
      description: Value(description),
      sourceImageUrl: sourceImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceImageUrl),
      readingTime: Value(readingTime),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Link.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Link(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      url: serializer.fromJson<String>(json['url']),
      domain: serializer.fromJson<String>(json['domain']),
      description: serializer.fromJson<String>(json['description']),
      sourceImageUrl: serializer.fromJson<String?>(json['sourceImageUrl']),
      readingTime: serializer.fromJson<String>(json['readingTime']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'url': serializer.toJson<String>(url),
      'domain': serializer.toJson<String>(domain),
      'description': serializer.toJson<String>(description),
      'sourceImageUrl': serializer.toJson<String?>(sourceImageUrl),
      'readingTime': serializer.toJson<String>(readingTime),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Link copyWith({
    int? id,
    String? title,
    String? url,
    String? domain,
    String? description,
    Value<String?> sourceImageUrl = const Value.absent(),
    String? readingTime,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Link(
    id: id ?? this.id,
    title: title ?? this.title,
    url: url ?? this.url,
    domain: domain ?? this.domain,
    description: description ?? this.description,
    sourceImageUrl: sourceImageUrl.present
        ? sourceImageUrl.value
        : this.sourceImageUrl,
    readingTime: readingTime ?? this.readingTime,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Link copyWithCompanion(LinksCompanion data) {
    return Link(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      url: data.url.present ? data.url.value : this.url,
      domain: data.domain.present ? data.domain.value : this.domain,
      description: data.description.present
          ? data.description.value
          : this.description,
      sourceImageUrl: data.sourceImageUrl.present
          ? data.sourceImageUrl.value
          : this.sourceImageUrl,
      readingTime: data.readingTime.present
          ? data.readingTime.value
          : this.readingTime,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Link(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('domain: $domain, ')
          ..write('description: $description, ')
          ..write('sourceImageUrl: $sourceImageUrl, ')
          ..write('readingTime: $readingTime, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    url,
    domain,
    description,
    sourceImageUrl,
    readingTime,
    isArchived,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Link &&
          other.id == this.id &&
          other.title == this.title &&
          other.url == this.url &&
          other.domain == this.domain &&
          other.description == this.description &&
          other.sourceImageUrl == this.sourceImageUrl &&
          other.readingTime == this.readingTime &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LinksCompanion extends UpdateCompanion<Link> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> url;
  final Value<String> domain;
  final Value<String> description;
  final Value<String?> sourceImageUrl;
  final Value<String> readingTime;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const LinksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.domain = const Value.absent(),
    this.description = const Value.absent(),
    this.sourceImageUrl = const Value.absent(),
    this.readingTime = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  LinksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String url,
    required String domain,
    this.description = const Value.absent(),
    this.sourceImageUrl = const Value.absent(),
    this.readingTime = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : title = Value(title),
       url = Value(url),
       domain = Value(domain);
  static Insertable<Link> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? url,
    Expression<String>? domain,
    Expression<String>? description,
    Expression<String>? sourceImageUrl,
    Expression<String>? readingTime,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (domain != null) 'domain': domain,
      if (description != null) 'description': description,
      if (sourceImageUrl != null) 'source_image_url': sourceImageUrl,
      if (readingTime != null) 'reading_time': readingTime,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  LinksCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? url,
    Value<String>? domain,
    Value<String>? description,
    Value<String?>? sourceImageUrl,
    Value<String>? readingTime,
    Value<bool>? isArchived,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return LinksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      domain: domain ?? this.domain,
      description: description ?? this.description,
      sourceImageUrl: sourceImageUrl ?? this.sourceImageUrl,
      readingTime: readingTime ?? this.readingTime,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (domain.present) {
      map['domain'] = Variable<String>(domain.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sourceImageUrl.present) {
      map['source_image_url'] = Variable<String>(sourceImageUrl.value);
    }
    if (readingTime.present) {
      map['reading_time'] = Variable<String>(readingTime.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LinksCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('domain: $domain, ')
          ..write('description: $description, ')
          ..write('sourceImageUrl: $sourceImageUrl, ')
          ..write('readingTime: $readingTime, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $LinkPreviewsTable extends LinkPreviews
    with TableInfo<$LinkPreviewsTable, LinkPreview> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LinkPreviewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _linkIdMeta = const VerificationMeta('linkId');
  @override
  late final GeneratedColumn<int> linkId = GeneratedColumn<int>(
    'link_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES links (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _previewTitleMeta = const VerificationMeta(
    'previewTitle',
  );
  @override
  late final GeneratedColumn<String> previewTitle = GeneratedColumn<String>(
    'preview_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _previewDescriptionMeta =
      const VerificationMeta('previewDescription');
  @override
  late final GeneratedColumn<String> previewDescription =
      GeneratedColumn<String>(
        'preview_description',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageLabelMeta = const VerificationMeta(
    'imageLabel',
  );
  @override
  late final GeneratedColumn<String> imageLabel = GeneratedColumn<String>(
    'image_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('SOURCE_PREVIEW.JPG'),
  );
  static const VerificationMeta _imageDimensionsMeta = const VerificationMeta(
    'imageDimensions',
  );
  @override
  late final GeneratedColumn<String> imageDimensions = GeneratedColumn<String>(
    'image_dimensions',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('1240 x 800'),
  );
  static const VerificationMeta _fetchedAtMeta = const VerificationMeta(
    'fetchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> fetchedAt = GeneratedColumn<DateTime>(
    'fetched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    linkId,
    previewTitle,
    previewDescription,
    imageUrl,
    imageLabel,
    imageDimensions,
    fetchedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'link_previews';
  @override
  VerificationContext validateIntegrity(
    Insertable<LinkPreview> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('link_id')) {
      context.handle(
        _linkIdMeta,
        linkId.isAcceptableOrUnknown(data['link_id']!, _linkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_linkIdMeta);
    }
    if (data.containsKey('preview_title')) {
      context.handle(
        _previewTitleMeta,
        previewTitle.isAcceptableOrUnknown(
          data['preview_title']!,
          _previewTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_previewTitleMeta);
    }
    if (data.containsKey('preview_description')) {
      context.handle(
        _previewDescriptionMeta,
        previewDescription.isAcceptableOrUnknown(
          data['preview_description']!,
          _previewDescriptionMeta,
        ),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('image_label')) {
      context.handle(
        _imageLabelMeta,
        imageLabel.isAcceptableOrUnknown(data['image_label']!, _imageLabelMeta),
      );
    }
    if (data.containsKey('image_dimensions')) {
      context.handle(
        _imageDimensionsMeta,
        imageDimensions.isAcceptableOrUnknown(
          data['image_dimensions']!,
          _imageDimensionsMeta,
        ),
      );
    }
    if (data.containsKey('fetched_at')) {
      context.handle(
        _fetchedAtMeta,
        fetchedAt.isAcceptableOrUnknown(data['fetched_at']!, _fetchedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LinkPreview map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LinkPreview(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      linkId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}link_id'],
      )!,
      previewTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}preview_title'],
      )!,
      previewDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}preview_description'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      imageLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_label'],
      )!,
      imageDimensions: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_dimensions'],
      )!,
      fetchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fetched_at'],
      )!,
    );
  }

  @override
  $LinkPreviewsTable createAlias(String alias) {
    return $LinkPreviewsTable(attachedDatabase, alias);
  }
}

class LinkPreview extends DataClass implements Insertable<LinkPreview> {
  final int id;
  final int linkId;
  final String previewTitle;
  final String previewDescription;
  final String? imageUrl;
  final String imageLabel;
  final String imageDimensions;
  final DateTime fetchedAt;
  const LinkPreview({
    required this.id,
    required this.linkId,
    required this.previewTitle,
    required this.previewDescription,
    this.imageUrl,
    required this.imageLabel,
    required this.imageDimensions,
    required this.fetchedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['link_id'] = Variable<int>(linkId);
    map['preview_title'] = Variable<String>(previewTitle);
    map['preview_description'] = Variable<String>(previewDescription);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['image_label'] = Variable<String>(imageLabel);
    map['image_dimensions'] = Variable<String>(imageDimensions);
    map['fetched_at'] = Variable<DateTime>(fetchedAt);
    return map;
  }

  LinkPreviewsCompanion toCompanion(bool nullToAbsent) {
    return LinkPreviewsCompanion(
      id: Value(id),
      linkId: Value(linkId),
      previewTitle: Value(previewTitle),
      previewDescription: Value(previewDescription),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      imageLabel: Value(imageLabel),
      imageDimensions: Value(imageDimensions),
      fetchedAt: Value(fetchedAt),
    );
  }

  factory LinkPreview.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LinkPreview(
      id: serializer.fromJson<int>(json['id']),
      linkId: serializer.fromJson<int>(json['linkId']),
      previewTitle: serializer.fromJson<String>(json['previewTitle']),
      previewDescription: serializer.fromJson<String>(
        json['previewDescription'],
      ),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      imageLabel: serializer.fromJson<String>(json['imageLabel']),
      imageDimensions: serializer.fromJson<String>(json['imageDimensions']),
      fetchedAt: serializer.fromJson<DateTime>(json['fetchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'linkId': serializer.toJson<int>(linkId),
      'previewTitle': serializer.toJson<String>(previewTitle),
      'previewDescription': serializer.toJson<String>(previewDescription),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'imageLabel': serializer.toJson<String>(imageLabel),
      'imageDimensions': serializer.toJson<String>(imageDimensions),
      'fetchedAt': serializer.toJson<DateTime>(fetchedAt),
    };
  }

  LinkPreview copyWith({
    int? id,
    int? linkId,
    String? previewTitle,
    String? previewDescription,
    Value<String?> imageUrl = const Value.absent(),
    String? imageLabel,
    String? imageDimensions,
    DateTime? fetchedAt,
  }) => LinkPreview(
    id: id ?? this.id,
    linkId: linkId ?? this.linkId,
    previewTitle: previewTitle ?? this.previewTitle,
    previewDescription: previewDescription ?? this.previewDescription,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    imageLabel: imageLabel ?? this.imageLabel,
    imageDimensions: imageDimensions ?? this.imageDimensions,
    fetchedAt: fetchedAt ?? this.fetchedAt,
  );
  LinkPreview copyWithCompanion(LinkPreviewsCompanion data) {
    return LinkPreview(
      id: data.id.present ? data.id.value : this.id,
      linkId: data.linkId.present ? data.linkId.value : this.linkId,
      previewTitle: data.previewTitle.present
          ? data.previewTitle.value
          : this.previewTitle,
      previewDescription: data.previewDescription.present
          ? data.previewDescription.value
          : this.previewDescription,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      imageLabel: data.imageLabel.present
          ? data.imageLabel.value
          : this.imageLabel,
      imageDimensions: data.imageDimensions.present
          ? data.imageDimensions.value
          : this.imageDimensions,
      fetchedAt: data.fetchedAt.present ? data.fetchedAt.value : this.fetchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LinkPreview(')
          ..write('id: $id, ')
          ..write('linkId: $linkId, ')
          ..write('previewTitle: $previewTitle, ')
          ..write('previewDescription: $previewDescription, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('imageLabel: $imageLabel, ')
          ..write('imageDimensions: $imageDimensions, ')
          ..write('fetchedAt: $fetchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    linkId,
    previewTitle,
    previewDescription,
    imageUrl,
    imageLabel,
    imageDimensions,
    fetchedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LinkPreview &&
          other.id == this.id &&
          other.linkId == this.linkId &&
          other.previewTitle == this.previewTitle &&
          other.previewDescription == this.previewDescription &&
          other.imageUrl == this.imageUrl &&
          other.imageLabel == this.imageLabel &&
          other.imageDimensions == this.imageDimensions &&
          other.fetchedAt == this.fetchedAt);
}

class LinkPreviewsCompanion extends UpdateCompanion<LinkPreview> {
  final Value<int> id;
  final Value<int> linkId;
  final Value<String> previewTitle;
  final Value<String> previewDescription;
  final Value<String?> imageUrl;
  final Value<String> imageLabel;
  final Value<String> imageDimensions;
  final Value<DateTime> fetchedAt;
  const LinkPreviewsCompanion({
    this.id = const Value.absent(),
    this.linkId = const Value.absent(),
    this.previewTitle = const Value.absent(),
    this.previewDescription = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.imageLabel = const Value.absent(),
    this.imageDimensions = const Value.absent(),
    this.fetchedAt = const Value.absent(),
  });
  LinkPreviewsCompanion.insert({
    this.id = const Value.absent(),
    required int linkId,
    required String previewTitle,
    this.previewDescription = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.imageLabel = const Value.absent(),
    this.imageDimensions = const Value.absent(),
    this.fetchedAt = const Value.absent(),
  }) : linkId = Value(linkId),
       previewTitle = Value(previewTitle);
  static Insertable<LinkPreview> custom({
    Expression<int>? id,
    Expression<int>? linkId,
    Expression<String>? previewTitle,
    Expression<String>? previewDescription,
    Expression<String>? imageUrl,
    Expression<String>? imageLabel,
    Expression<String>? imageDimensions,
    Expression<DateTime>? fetchedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (linkId != null) 'link_id': linkId,
      if (previewTitle != null) 'preview_title': previewTitle,
      if (previewDescription != null) 'preview_description': previewDescription,
      if (imageUrl != null) 'image_url': imageUrl,
      if (imageLabel != null) 'image_label': imageLabel,
      if (imageDimensions != null) 'image_dimensions': imageDimensions,
      if (fetchedAt != null) 'fetched_at': fetchedAt,
    });
  }

  LinkPreviewsCompanion copyWith({
    Value<int>? id,
    Value<int>? linkId,
    Value<String>? previewTitle,
    Value<String>? previewDescription,
    Value<String?>? imageUrl,
    Value<String>? imageLabel,
    Value<String>? imageDimensions,
    Value<DateTime>? fetchedAt,
  }) {
    return LinkPreviewsCompanion(
      id: id ?? this.id,
      linkId: linkId ?? this.linkId,
      previewTitle: previewTitle ?? this.previewTitle,
      previewDescription: previewDescription ?? this.previewDescription,
      imageUrl: imageUrl ?? this.imageUrl,
      imageLabel: imageLabel ?? this.imageLabel,
      imageDimensions: imageDimensions ?? this.imageDimensions,
      fetchedAt: fetchedAt ?? this.fetchedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (linkId.present) {
      map['link_id'] = Variable<int>(linkId.value);
    }
    if (previewTitle.present) {
      map['preview_title'] = Variable<String>(previewTitle.value);
    }
    if (previewDescription.present) {
      map['preview_description'] = Variable<String>(previewDescription.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (imageLabel.present) {
      map['image_label'] = Variable<String>(imageLabel.value);
    }
    if (imageDimensions.present) {
      map['image_dimensions'] = Variable<String>(imageDimensions.value);
    }
    if (fetchedAt.present) {
      map['fetched_at'] = Variable<DateTime>(fetchedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LinkPreviewsCompanion(')
          ..write('id: $id, ')
          ..write('linkId: $linkId, ')
          ..write('previewTitle: $previewTitle, ')
          ..write('previewDescription: $previewDescription, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('imageLabel: $imageLabel, ')
          ..write('imageDimensions: $imageDimensions, ')
          ..write('fetchedAt: $fetchedAt')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('GENERAL'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, category, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }
}

class Tag extends DataClass implements Insertable<Tag> {
  final int id;
  final String name;
  final String category;
  final DateTime createdAt;
  const Tag({
    required this.id,
    required this.name,
    required this.category,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      createdAt: Value(createdAt),
    );
  }

  factory Tag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Tag copyWith({
    int? id,
    String? name,
    String? category,
    DateTime? createdAt,
  }) => Tag(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    createdAt: createdAt ?? this.createdAt,
  );
  Tag copyWithCompanion(TagsCompanion data) {
    return Tag(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, category, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.createdAt == this.createdAt);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> category;
  final Value<DateTime> createdAt;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TagsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.category = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Tag> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TagsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? category,
    Value<DateTime>? createdAt,
  }) {
    return TagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $LinkTagsTable extends LinkTags with TableInfo<$LinkTagsTable, LinkTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LinkTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _linkIdMeta = const VerificationMeta('linkId');
  @override
  late final GeneratedColumn<int> linkId = GeneratedColumn<int>(
    'link_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES links (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tags (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [linkId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'link_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<LinkTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('link_id')) {
      context.handle(
        _linkIdMeta,
        linkId.isAcceptableOrUnknown(data['link_id']!, _linkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_linkIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {linkId, tagId};
  @override
  LinkTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LinkTag(
      linkId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}link_id'],
      )!,
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tag_id'],
      )!,
    );
  }

  @override
  $LinkTagsTable createAlias(String alias) {
    return $LinkTagsTable(attachedDatabase, alias);
  }
}

class LinkTag extends DataClass implements Insertable<LinkTag> {
  final int linkId;
  final int tagId;
  const LinkTag({required this.linkId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['link_id'] = Variable<int>(linkId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  LinkTagsCompanion toCompanion(bool nullToAbsent) {
    return LinkTagsCompanion(linkId: Value(linkId), tagId: Value(tagId));
  }

  factory LinkTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LinkTag(
      linkId: serializer.fromJson<int>(json['linkId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'linkId': serializer.toJson<int>(linkId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  LinkTag copyWith({int? linkId, int? tagId}) =>
      LinkTag(linkId: linkId ?? this.linkId, tagId: tagId ?? this.tagId);
  LinkTag copyWithCompanion(LinkTagsCompanion data) {
    return LinkTag(
      linkId: data.linkId.present ? data.linkId.value : this.linkId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LinkTag(')
          ..write('linkId: $linkId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(linkId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LinkTag &&
          other.linkId == this.linkId &&
          other.tagId == this.tagId);
}

class LinkTagsCompanion extends UpdateCompanion<LinkTag> {
  final Value<int> linkId;
  final Value<int> tagId;
  final Value<int> rowid;
  const LinkTagsCompanion({
    this.linkId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LinkTagsCompanion.insert({
    required int linkId,
    required int tagId,
    this.rowid = const Value.absent(),
  }) : linkId = Value(linkId),
       tagId = Value(tagId);
  static Insertable<LinkTag> custom({
    Expression<int>? linkId,
    Expression<int>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (linkId != null) 'link_id': linkId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LinkTagsCompanion copyWith({
    Value<int>? linkId,
    Value<int>? tagId,
    Value<int>? rowid,
  }) {
    return LinkTagsCompanion(
      linkId: linkId ?? this.linkId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (linkId.present) {
      map['link_id'] = Variable<int>(linkId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LinkTagsCompanion(')
          ..write('linkId: $linkId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CollectionsTable extends Collections
    with TableInfo<$CollectionsTable, Collection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconKeyMeta = const VerificationMeta(
    'iconKey',
  );
  @override
  late final GeneratedColumn<String> iconKey = GeneratedColumn<String>(
    'icon_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('folder'),
  );
  static const VerificationMeta _tagNameMeta = const VerificationMeta(
    'tagName',
  );
  @override
  late final GeneratedColumn<String> tagName = GeneratedColumn<String>(
    'tag_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    type,
    iconKey,
    tagName,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collections';
  @override
  VerificationContext validateIntegrity(
    Insertable<Collection> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('icon_key')) {
      context.handle(
        _iconKeyMeta,
        iconKey.isAcceptableOrUnknown(data['icon_key']!, _iconKeyMeta),
      );
    }
    if (data.containsKey('tag_name')) {
      context.handle(
        _tagNameMeta,
        tagName.isAcceptableOrUnknown(data['tag_name']!, _tagNameMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Collection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Collection(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      iconKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_key'],
      )!,
      tagName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CollectionsTable createAlias(String alias) {
    return $CollectionsTable(attachedDatabase, alias);
  }
}

class Collection extends DataClass implements Insertable<Collection> {
  final int id;
  final String title;
  final String type;
  final String iconKey;
  final String tagName;
  final DateTime createdAt;
  const Collection({
    required this.id,
    required this.title,
    required this.type,
    required this.iconKey,
    required this.tagName,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['type'] = Variable<String>(type);
    map['icon_key'] = Variable<String>(iconKey);
    map['tag_name'] = Variable<String>(tagName);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CollectionsCompanion toCompanion(bool nullToAbsent) {
    return CollectionsCompanion(
      id: Value(id),
      title: Value(title),
      type: Value(type),
      iconKey: Value(iconKey),
      tagName: Value(tagName),
      createdAt: Value(createdAt),
    );
  }

  factory Collection.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Collection(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<String>(json['type']),
      iconKey: serializer.fromJson<String>(json['iconKey']),
      tagName: serializer.fromJson<String>(json['tagName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<String>(type),
      'iconKey': serializer.toJson<String>(iconKey),
      'tagName': serializer.toJson<String>(tagName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Collection copyWith({
    int? id,
    String? title,
    String? type,
    String? iconKey,
    String? tagName,
    DateTime? createdAt,
  }) => Collection(
    id: id ?? this.id,
    title: title ?? this.title,
    type: type ?? this.type,
    iconKey: iconKey ?? this.iconKey,
    tagName: tagName ?? this.tagName,
    createdAt: createdAt ?? this.createdAt,
  );
  Collection copyWithCompanion(CollectionsCompanion data) {
    return Collection(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      iconKey: data.iconKey.present ? data.iconKey.value : this.iconKey,
      tagName: data.tagName.present ? data.tagName.value : this.tagName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Collection(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('iconKey: $iconKey, ')
          ..write('tagName: $tagName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, type, iconKey, tagName, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Collection &&
          other.id == this.id &&
          other.title == this.title &&
          other.type == this.type &&
          other.iconKey == this.iconKey &&
          other.tagName == this.tagName &&
          other.createdAt == this.createdAt);
}

class CollectionsCompanion extends UpdateCompanion<Collection> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> type;
  final Value<String> iconKey;
  final Value<String> tagName;
  final Value<DateTime> createdAt;
  const CollectionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.iconKey = const Value.absent(),
    this.tagName = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CollectionsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String type,
    this.iconKey = const Value.absent(),
    this.tagName = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : title = Value(title),
       type = Value(type);
  static Insertable<Collection> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? type,
    Expression<String>? iconKey,
    Expression<String>? tagName,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (iconKey != null) 'icon_key': iconKey,
      if (tagName != null) 'tag_name': tagName,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CollectionsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? type,
    Value<String>? iconKey,
    Value<String>? tagName,
    Value<DateTime>? createdAt,
  }) {
    return CollectionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      iconKey: iconKey ?? this.iconKey,
      tagName: tagName ?? this.tagName,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (iconKey.present) {
      map['icon_key'] = Variable<String>(iconKey.value);
    }
    if (tagName.present) {
      map['tag_name'] = Variable<String>(tagName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('iconKey: $iconKey, ')
          ..write('tagName: $tagName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CollectionLinksTable extends CollectionLinks
    with TableInfo<$CollectionLinksTable, CollectionLink> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionLinksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _collectionIdMeta = const VerificationMeta(
    'collectionId',
  );
  @override
  late final GeneratedColumn<int> collectionId = GeneratedColumn<int>(
    'collection_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES collections (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _linkIdMeta = const VerificationMeta('linkId');
  @override
  late final GeneratedColumn<int> linkId = GeneratedColumn<int>(
    'link_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES links (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [collectionId, linkId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collection_links';
  @override
  VerificationContext validateIntegrity(
    Insertable<CollectionLink> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('collection_id')) {
      context.handle(
        _collectionIdMeta,
        collectionId.isAcceptableOrUnknown(
          data['collection_id']!,
          _collectionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('link_id')) {
      context.handle(
        _linkIdMeta,
        linkId.isAcceptableOrUnknown(data['link_id']!, _linkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_linkIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {collectionId, linkId};
  @override
  CollectionLink map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionLink(
      collectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}collection_id'],
      )!,
      linkId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}link_id'],
      )!,
    );
  }

  @override
  $CollectionLinksTable createAlias(String alias) {
    return $CollectionLinksTable(attachedDatabase, alias);
  }
}

class CollectionLink extends DataClass implements Insertable<CollectionLink> {
  final int collectionId;
  final int linkId;
  const CollectionLink({required this.collectionId, required this.linkId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['collection_id'] = Variable<int>(collectionId);
    map['link_id'] = Variable<int>(linkId);
    return map;
  }

  CollectionLinksCompanion toCompanion(bool nullToAbsent) {
    return CollectionLinksCompanion(
      collectionId: Value(collectionId),
      linkId: Value(linkId),
    );
  }

  factory CollectionLink.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionLink(
      collectionId: serializer.fromJson<int>(json['collectionId']),
      linkId: serializer.fromJson<int>(json['linkId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'collectionId': serializer.toJson<int>(collectionId),
      'linkId': serializer.toJson<int>(linkId),
    };
  }

  CollectionLink copyWith({int? collectionId, int? linkId}) => CollectionLink(
    collectionId: collectionId ?? this.collectionId,
    linkId: linkId ?? this.linkId,
  );
  CollectionLink copyWithCompanion(CollectionLinksCompanion data) {
    return CollectionLink(
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
      linkId: data.linkId.present ? data.linkId.value : this.linkId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionLink(')
          ..write('collectionId: $collectionId, ')
          ..write('linkId: $linkId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(collectionId, linkId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionLink &&
          other.collectionId == this.collectionId &&
          other.linkId == this.linkId);
}

class CollectionLinksCompanion extends UpdateCompanion<CollectionLink> {
  final Value<int> collectionId;
  final Value<int> linkId;
  final Value<int> rowid;
  const CollectionLinksCompanion({
    this.collectionId = const Value.absent(),
    this.linkId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CollectionLinksCompanion.insert({
    required int collectionId,
    required int linkId,
    this.rowid = const Value.absent(),
  }) : collectionId = Value(collectionId),
       linkId = Value(linkId);
  static Insertable<CollectionLink> custom({
    Expression<int>? collectionId,
    Expression<int>? linkId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (collectionId != null) 'collection_id': collectionId,
      if (linkId != null) 'link_id': linkId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CollectionLinksCompanion copyWith({
    Value<int>? collectionId,
    Value<int>? linkId,
    Value<int>? rowid,
  }) {
    return CollectionLinksCompanion(
      collectionId: collectionId ?? this.collectionId,
      linkId: linkId ?? this.linkId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (collectionId.present) {
      map['collection_id'] = Variable<int>(collectionId.value);
    }
    if (linkId.present) {
      map['link_id'] = Variable<int>(linkId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionLinksCompanion(')
          ..write('collectionId: $collectionId, ')
          ..write('linkId: $linkId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('USER_CORE'),
  );
  static const VerificationMeta _authLevelMeta = const VerificationMeta(
    'authLevel',
  );
  @override
  late final GeneratedColumn<String> authLevel = GeneratedColumn<String>(
    'auth_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('AUTH_LEVEL_01'),
  );
  static const VerificationMeta _linksSavedMeta = const VerificationMeta(
    'linksSaved',
  );
  @override
  late final GeneratedColumn<int> linksSaved = GeneratedColumn<int>(
    'links_saved',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1284),
  );
  static const VerificationMeta _dataUsedMbMeta = const VerificationMeta(
    'dataUsedMb',
  );
  @override
  late final GeneratedColumn<double> dataUsedMb = GeneratedColumn<double>(
    'data_used_mb',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(42.8),
  );
  static const VerificationMeta _storagePercentMeta = const VerificationMeta(
    'storagePercent',
  );
  @override
  late final GeneratedColumn<double> storagePercent = GeneratedColumn<double>(
    'storage_percent',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(.68),
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('LINKVAULT_OS v2.4.0-STABLE'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    displayName,
    authLevel,
    linksSaved,
    dataUsedMb,
    storagePercent,
    version,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    }
    if (data.containsKey('auth_level')) {
      context.handle(
        _authLevelMeta,
        authLevel.isAcceptableOrUnknown(data['auth_level']!, _authLevelMeta),
      );
    }
    if (data.containsKey('links_saved')) {
      context.handle(
        _linksSavedMeta,
        linksSaved.isAcceptableOrUnknown(data['links_saved']!, _linksSavedMeta),
      );
    }
    if (data.containsKey('data_used_mb')) {
      context.handle(
        _dataUsedMbMeta,
        dataUsedMb.isAcceptableOrUnknown(
          data['data_used_mb']!,
          _dataUsedMbMeta,
        ),
      );
    }
    if (data.containsKey('storage_percent')) {
      context.handle(
        _storagePercentMeta,
        storagePercent.isAcceptableOrUnknown(
          data['storage_percent']!,
          _storagePercentMeta,
        ),
      );
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      authLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}auth_level'],
      )!,
      linksSaved: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}links_saved'],
      )!,
      dataUsedMb: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}data_used_mb'],
      )!,
      storagePercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}storage_percent'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}version'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfile extends DataClass implements Insertable<UserProfile> {
  final int id;
  final String displayName;
  final String authLevel;
  final int linksSaved;
  final double dataUsedMb;
  final double storagePercent;
  final String version;
  final DateTime updatedAt;
  const UserProfile({
    required this.id,
    required this.displayName,
    required this.authLevel,
    required this.linksSaved,
    required this.dataUsedMb,
    required this.storagePercent,
    required this.version,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['display_name'] = Variable<String>(displayName);
    map['auth_level'] = Variable<String>(authLevel);
    map['links_saved'] = Variable<int>(linksSaved);
    map['data_used_mb'] = Variable<double>(dataUsedMb);
    map['storage_percent'] = Variable<double>(storagePercent);
    map['version'] = Variable<String>(version);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      displayName: Value(displayName),
      authLevel: Value(authLevel),
      linksSaved: Value(linksSaved),
      dataUsedMb: Value(dataUsedMb),
      storagePercent: Value(storagePercent),
      version: Value(version),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfile(
      id: serializer.fromJson<int>(json['id']),
      displayName: serializer.fromJson<String>(json['displayName']),
      authLevel: serializer.fromJson<String>(json['authLevel']),
      linksSaved: serializer.fromJson<int>(json['linksSaved']),
      dataUsedMb: serializer.fromJson<double>(json['dataUsedMb']),
      storagePercent: serializer.fromJson<double>(json['storagePercent']),
      version: serializer.fromJson<String>(json['version']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'displayName': serializer.toJson<String>(displayName),
      'authLevel': serializer.toJson<String>(authLevel),
      'linksSaved': serializer.toJson<int>(linksSaved),
      'dataUsedMb': serializer.toJson<double>(dataUsedMb),
      'storagePercent': serializer.toJson<double>(storagePercent),
      'version': serializer.toJson<String>(version),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserProfile copyWith({
    int? id,
    String? displayName,
    String? authLevel,
    int? linksSaved,
    double? dataUsedMb,
    double? storagePercent,
    String? version,
    DateTime? updatedAt,
  }) => UserProfile(
    id: id ?? this.id,
    displayName: displayName ?? this.displayName,
    authLevel: authLevel ?? this.authLevel,
    linksSaved: linksSaved ?? this.linksSaved,
    dataUsedMb: dataUsedMb ?? this.dataUsedMb,
    storagePercent: storagePercent ?? this.storagePercent,
    version: version ?? this.version,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UserProfile copyWithCompanion(UserProfilesCompanion data) {
    return UserProfile(
      id: data.id.present ? data.id.value : this.id,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      authLevel: data.authLevel.present ? data.authLevel.value : this.authLevel,
      linksSaved: data.linksSaved.present
          ? data.linksSaved.value
          : this.linksSaved,
      dataUsedMb: data.dataUsedMb.present
          ? data.dataUsedMb.value
          : this.dataUsedMb,
      storagePercent: data.storagePercent.present
          ? data.storagePercent.value
          : this.storagePercent,
      version: data.version.present ? data.version.value : this.version,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfile(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('authLevel: $authLevel, ')
          ..write('linksSaved: $linksSaved, ')
          ..write('dataUsedMb: $dataUsedMb, ')
          ..write('storagePercent: $storagePercent, ')
          ..write('version: $version, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    displayName,
    authLevel,
    linksSaved,
    dataUsedMb,
    storagePercent,
    version,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfile &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.authLevel == this.authLevel &&
          other.linksSaved == this.linksSaved &&
          other.dataUsedMb == this.dataUsedMb &&
          other.storagePercent == this.storagePercent &&
          other.version == this.version &&
          other.updatedAt == this.updatedAt);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfile> {
  final Value<int> id;
  final Value<String> displayName;
  final Value<String> authLevel;
  final Value<int> linksSaved;
  final Value<double> dataUsedMb;
  final Value<double> storagePercent;
  final Value<String> version;
  final Value<DateTime> updatedAt;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.authLevel = const Value.absent(),
    this.linksSaved = const Value.absent(),
    this.dataUsedMb = const Value.absent(),
    this.storagePercent = const Value.absent(),
    this.version = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.authLevel = const Value.absent(),
    this.linksSaved = const Value.absent(),
    this.dataUsedMb = const Value.absent(),
    this.storagePercent = const Value.absent(),
    this.version = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<UserProfile> custom({
    Expression<int>? id,
    Expression<String>? displayName,
    Expression<String>? authLevel,
    Expression<int>? linksSaved,
    Expression<double>? dataUsedMb,
    Expression<double>? storagePercent,
    Expression<String>? version,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (authLevel != null) 'auth_level': authLevel,
      if (linksSaved != null) 'links_saved': linksSaved,
      if (dataUsedMb != null) 'data_used_mb': dataUsedMb,
      if (storagePercent != null) 'storage_percent': storagePercent,
      if (version != null) 'version': version,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UserProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? displayName,
    Value<String>? authLevel,
    Value<int>? linksSaved,
    Value<double>? dataUsedMb,
    Value<double>? storagePercent,
    Value<String>? version,
    Value<DateTime>? updatedAt,
  }) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      authLevel: authLevel ?? this.authLevel,
      linksSaved: linksSaved ?? this.linksSaved,
      dataUsedMb: dataUsedMb ?? this.dataUsedMb,
      storagePercent: storagePercent ?? this.storagePercent,
      version: version ?? this.version,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (authLevel.present) {
      map['auth_level'] = Variable<String>(authLevel.value);
    }
    if (linksSaved.present) {
      map['links_saved'] = Variable<int>(linksSaved.value);
    }
    if (dataUsedMb.present) {
      map['data_used_mb'] = Variable<double>(dataUsedMb.value);
    }
    if (storagePercent.present) {
      map['storage_percent'] = Variable<double>(storagePercent.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('authLevel: $authLevel, ')
          ..write('linksSaved: $linksSaved, ')
          ..write('dataUsedMb: $dataUsedMb, ')
          ..write('storagePercent: $storagePercent, ')
          ..write('version: $version, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ProfileMetricsTable extends ProfileMetrics
    with TableInfo<$ProfileMetricsTable, ProfileMetric> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfileMetricsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_profiles (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    label,
    value,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profile_metrics';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProfileMetric> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProfileMetric map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileMetric(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $ProfileMetricsTable createAlias(String alias) {
    return $ProfileMetricsTable(attachedDatabase, alias);
  }
}

class ProfileMetric extends DataClass implements Insertable<ProfileMetric> {
  final int id;
  final int profileId;
  final String label;
  final double value;
  final int sortOrder;
  const ProfileMetric({
    required this.id,
    required this.profileId,
    required this.label,
    required this.value,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['label'] = Variable<String>(label);
    map['value'] = Variable<double>(value);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  ProfileMetricsCompanion toCompanion(bool nullToAbsent) {
    return ProfileMetricsCompanion(
      id: Value(id),
      profileId: Value(profileId),
      label: Value(label),
      value: Value(value),
      sortOrder: Value(sortOrder),
    );
  }

  factory ProfileMetric.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileMetric(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      label: serializer.fromJson<String>(json['label']),
      value: serializer.fromJson<double>(json['value']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'label': serializer.toJson<String>(label),
      'value': serializer.toJson<double>(value),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  ProfileMetric copyWith({
    int? id,
    int? profileId,
    String? label,
    double? value,
    int? sortOrder,
  }) => ProfileMetric(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    label: label ?? this.label,
    value: value ?? this.value,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  ProfileMetric copyWithCompanion(ProfileMetricsCompanion data) {
    return ProfileMetric(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      label: data.label.present ? data.label.value : this.label,
      value: data.value.present ? data.value.value : this.value,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProfileMetric(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('label: $label, ')
          ..write('value: $value, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, profileId, label, value, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileMetric &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.label == this.label &&
          other.value == this.value &&
          other.sortOrder == this.sortOrder);
}

class ProfileMetricsCompanion extends UpdateCompanion<ProfileMetric> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> label;
  final Value<double> value;
  final Value<int> sortOrder;
  const ProfileMetricsCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.label = const Value.absent(),
    this.value = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  ProfileMetricsCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String label,
    required double value,
    required int sortOrder,
  }) : profileId = Value(profileId),
       label = Value(label),
       value = Value(value),
       sortOrder = Value(sortOrder);
  static Insertable<ProfileMetric> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? label,
    Expression<double>? value,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (label != null) 'label': label,
      if (value != null) 'value': value,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  ProfileMetricsCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? label,
    Value<double>? value,
    Value<int>? sortOrder,
  }) {
    return ProfileMetricsCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      label: label ?? this.label,
      value: value ?? this.value,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileMetricsCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('label: $label, ')
          ..write('value: $value, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

class $SettingItemsTable extends SettingItems
    with TableInfo<$SettingItemsTable, SettingItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sectionMeta = const VerificationMeta(
    'section',
  );
  @override
  late final GeneratedColumn<String> section = GeneratedColumn<String>(
    'section',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtitleMeta = const VerificationMeta(
    'subtitle',
  );
  @override
  late final GeneratedColumn<String> subtitle = GeneratedColumn<String>(
    'subtitle',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('row'),
  );
  static const VerificationMeta _iconKeyMeta = const VerificationMeta(
    'iconKey',
  );
  @override
  late final GeneratedColumn<String> iconKey = GeneratedColumn<String>(
    'icon_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('settings'),
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    section,
    title,
    subtitle,
    kind,
    iconKey,
    enabled,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'setting_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<SettingItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('section')) {
      context.handle(
        _sectionMeta,
        section.isAcceptableOrUnknown(data['section']!, _sectionMeta),
      );
    } else if (isInserting) {
      context.missing(_sectionMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('subtitle')) {
      context.handle(
        _subtitleMeta,
        subtitle.isAcceptableOrUnknown(data['subtitle']!, _subtitleMeta),
      );
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    }
    if (data.containsKey('icon_key')) {
      context.handle(
        _iconKeyMeta,
        iconKey.isAcceptableOrUnknown(data['icon_key']!, _iconKeyMeta),
      );
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      section: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}section'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      subtitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subtitle'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      iconKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_key'],
      )!,
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $SettingItemsTable createAlias(String alias) {
    return $SettingItemsTable(attachedDatabase, alias);
  }
}

class SettingItem extends DataClass implements Insertable<SettingItem> {
  final int id;
  final String section;
  final String title;
  final String subtitle;
  final String kind;
  final String iconKey;
  final bool enabled;
  final int sortOrder;
  const SettingItem({
    required this.id,
    required this.section,
    required this.title,
    required this.subtitle,
    required this.kind,
    required this.iconKey,
    required this.enabled,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['section'] = Variable<String>(section);
    map['title'] = Variable<String>(title);
    map['subtitle'] = Variable<String>(subtitle);
    map['kind'] = Variable<String>(kind);
    map['icon_key'] = Variable<String>(iconKey);
    map['enabled'] = Variable<bool>(enabled);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  SettingItemsCompanion toCompanion(bool nullToAbsent) {
    return SettingItemsCompanion(
      id: Value(id),
      section: Value(section),
      title: Value(title),
      subtitle: Value(subtitle),
      kind: Value(kind),
      iconKey: Value(iconKey),
      enabled: Value(enabled),
      sortOrder: Value(sortOrder),
    );
  }

  factory SettingItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingItem(
      id: serializer.fromJson<int>(json['id']),
      section: serializer.fromJson<String>(json['section']),
      title: serializer.fromJson<String>(json['title']),
      subtitle: serializer.fromJson<String>(json['subtitle']),
      kind: serializer.fromJson<String>(json['kind']),
      iconKey: serializer.fromJson<String>(json['iconKey']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'section': serializer.toJson<String>(section),
      'title': serializer.toJson<String>(title),
      'subtitle': serializer.toJson<String>(subtitle),
      'kind': serializer.toJson<String>(kind),
      'iconKey': serializer.toJson<String>(iconKey),
      'enabled': serializer.toJson<bool>(enabled),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  SettingItem copyWith({
    int? id,
    String? section,
    String? title,
    String? subtitle,
    String? kind,
    String? iconKey,
    bool? enabled,
    int? sortOrder,
  }) => SettingItem(
    id: id ?? this.id,
    section: section ?? this.section,
    title: title ?? this.title,
    subtitle: subtitle ?? this.subtitle,
    kind: kind ?? this.kind,
    iconKey: iconKey ?? this.iconKey,
    enabled: enabled ?? this.enabled,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  SettingItem copyWithCompanion(SettingItemsCompanion data) {
    return SettingItem(
      id: data.id.present ? data.id.value : this.id,
      section: data.section.present ? data.section.value : this.section,
      title: data.title.present ? data.title.value : this.title,
      subtitle: data.subtitle.present ? data.subtitle.value : this.subtitle,
      kind: data.kind.present ? data.kind.value : this.kind,
      iconKey: data.iconKey.present ? data.iconKey.value : this.iconKey,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingItem(')
          ..write('id: $id, ')
          ..write('section: $section, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('kind: $kind, ')
          ..write('iconKey: $iconKey, ')
          ..write('enabled: $enabled, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    section,
    title,
    subtitle,
    kind,
    iconKey,
    enabled,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingItem &&
          other.id == this.id &&
          other.section == this.section &&
          other.title == this.title &&
          other.subtitle == this.subtitle &&
          other.kind == this.kind &&
          other.iconKey == this.iconKey &&
          other.enabled == this.enabled &&
          other.sortOrder == this.sortOrder);
}

class SettingItemsCompanion extends UpdateCompanion<SettingItem> {
  final Value<int> id;
  final Value<String> section;
  final Value<String> title;
  final Value<String> subtitle;
  final Value<String> kind;
  final Value<String> iconKey;
  final Value<bool> enabled;
  final Value<int> sortOrder;
  const SettingItemsCompanion({
    this.id = const Value.absent(),
    this.section = const Value.absent(),
    this.title = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.kind = const Value.absent(),
    this.iconKey = const Value.absent(),
    this.enabled = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  SettingItemsCompanion.insert({
    this.id = const Value.absent(),
    required String section,
    required String title,
    this.subtitle = const Value.absent(),
    this.kind = const Value.absent(),
    this.iconKey = const Value.absent(),
    this.enabled = const Value.absent(),
    required int sortOrder,
  }) : section = Value(section),
       title = Value(title),
       sortOrder = Value(sortOrder);
  static Insertable<SettingItem> custom({
    Expression<int>? id,
    Expression<String>? section,
    Expression<String>? title,
    Expression<String>? subtitle,
    Expression<String>? kind,
    Expression<String>? iconKey,
    Expression<bool>? enabled,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (section != null) 'section': section,
      if (title != null) 'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (kind != null) 'kind': kind,
      if (iconKey != null) 'icon_key': iconKey,
      if (enabled != null) 'enabled': enabled,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  SettingItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? section,
    Value<String>? title,
    Value<String>? subtitle,
    Value<String>? kind,
    Value<String>? iconKey,
    Value<bool>? enabled,
    Value<int>? sortOrder,
  }) {
    return SettingItemsCompanion(
      id: id ?? this.id,
      section: section ?? this.section,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      kind: kind ?? this.kind,
      iconKey: iconKey ?? this.iconKey,
      enabled: enabled ?? this.enabled,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (section.present) {
      map['section'] = Variable<String>(section.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (iconKey.present) {
      map['icon_key'] = Variable<String>(iconKey.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingItemsCompanion(')
          ..write('id: $id, ')
          ..write('section: $section, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('kind: $kind, ')
          ..write('iconKey: $iconKey, ')
          ..write('enabled: $enabled, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

class $OnboardingStepsTable extends OnboardingSteps
    with TableInfo<$OnboardingStepsTable, OnboardingStep> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OnboardingStepsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _stepNumberMeta = const VerificationMeta(
    'stepNumber',
  );
  @override
  late final GeneratedColumn<String> stepNumber = GeneratedColumn<String>(
    'step_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
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
  static const VerificationMeta _iconKeyMeta = const VerificationMeta(
    'iconKey',
  );
  @override
  late final GeneratedColumn<String> iconKey = GeneratedColumn<String>(
    'icon_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _showPlatformsMeta = const VerificationMeta(
    'showPlatforms',
  );
  @override
  late final GeneratedColumn<bool> showPlatforms = GeneratedColumn<bool>(
    'show_platforms',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("show_platforms" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    stepNumber,
    title,
    description,
    iconKey,
    showPlatforms,
    sortOrder,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'onboarding_steps';
  @override
  VerificationContext validateIntegrity(
    Insertable<OnboardingStep> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('step_number')) {
      context.handle(
        _stepNumberMeta,
        stepNumber.isAcceptableOrUnknown(data['step_number']!, _stepNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_stepNumberMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
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
    if (data.containsKey('icon_key')) {
      context.handle(
        _iconKeyMeta,
        iconKey.isAcceptableOrUnknown(data['icon_key']!, _iconKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_iconKeyMeta);
    }
    if (data.containsKey('show_platforms')) {
      context.handle(
        _showPlatformsMeta,
        showPlatforms.isAcceptableOrUnknown(
          data['show_platforms']!,
          _showPlatformsMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OnboardingStep map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OnboardingStep(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      stepNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}step_number'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      iconKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_key'],
      )!,
      showPlatforms: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}show_platforms'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $OnboardingStepsTable createAlias(String alias) {
    return $OnboardingStepsTable(attachedDatabase, alias);
  }
}

class OnboardingStep extends DataClass implements Insertable<OnboardingStep> {
  final int id;
  final String stepNumber;
  final String title;
  final String description;
  final String iconKey;
  final bool showPlatforms;
  final int sortOrder;
  const OnboardingStep({
    required this.id,
    required this.stepNumber,
    required this.title,
    required this.description,
    required this.iconKey,
    required this.showPlatforms,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['step_number'] = Variable<String>(stepNumber);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['icon_key'] = Variable<String>(iconKey);
    map['show_platforms'] = Variable<bool>(showPlatforms);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  OnboardingStepsCompanion toCompanion(bool nullToAbsent) {
    return OnboardingStepsCompanion(
      id: Value(id),
      stepNumber: Value(stepNumber),
      title: Value(title),
      description: Value(description),
      iconKey: Value(iconKey),
      showPlatforms: Value(showPlatforms),
      sortOrder: Value(sortOrder),
    );
  }

  factory OnboardingStep.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OnboardingStep(
      id: serializer.fromJson<int>(json['id']),
      stepNumber: serializer.fromJson<String>(json['stepNumber']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      iconKey: serializer.fromJson<String>(json['iconKey']),
      showPlatforms: serializer.fromJson<bool>(json['showPlatforms']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'stepNumber': serializer.toJson<String>(stepNumber),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'iconKey': serializer.toJson<String>(iconKey),
      'showPlatforms': serializer.toJson<bool>(showPlatforms),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  OnboardingStep copyWith({
    int? id,
    String? stepNumber,
    String? title,
    String? description,
    String? iconKey,
    bool? showPlatforms,
    int? sortOrder,
  }) => OnboardingStep(
    id: id ?? this.id,
    stepNumber: stepNumber ?? this.stepNumber,
    title: title ?? this.title,
    description: description ?? this.description,
    iconKey: iconKey ?? this.iconKey,
    showPlatforms: showPlatforms ?? this.showPlatforms,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  OnboardingStep copyWithCompanion(OnboardingStepsCompanion data) {
    return OnboardingStep(
      id: data.id.present ? data.id.value : this.id,
      stepNumber: data.stepNumber.present
          ? data.stepNumber.value
          : this.stepNumber,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      iconKey: data.iconKey.present ? data.iconKey.value : this.iconKey,
      showPlatforms: data.showPlatforms.present
          ? data.showPlatforms.value
          : this.showPlatforms,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OnboardingStep(')
          ..write('id: $id, ')
          ..write('stepNumber: $stepNumber, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('iconKey: $iconKey, ')
          ..write('showPlatforms: $showPlatforms, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    stepNumber,
    title,
    description,
    iconKey,
    showPlatforms,
    sortOrder,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OnboardingStep &&
          other.id == this.id &&
          other.stepNumber == this.stepNumber &&
          other.title == this.title &&
          other.description == this.description &&
          other.iconKey == this.iconKey &&
          other.showPlatforms == this.showPlatforms &&
          other.sortOrder == this.sortOrder);
}

class OnboardingStepsCompanion extends UpdateCompanion<OnboardingStep> {
  final Value<int> id;
  final Value<String> stepNumber;
  final Value<String> title;
  final Value<String> description;
  final Value<String> iconKey;
  final Value<bool> showPlatforms;
  final Value<int> sortOrder;
  const OnboardingStepsCompanion({
    this.id = const Value.absent(),
    this.stepNumber = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.iconKey = const Value.absent(),
    this.showPlatforms = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  OnboardingStepsCompanion.insert({
    this.id = const Value.absent(),
    required String stepNumber,
    required String title,
    required String description,
    required String iconKey,
    this.showPlatforms = const Value.absent(),
    required int sortOrder,
  }) : stepNumber = Value(stepNumber),
       title = Value(title),
       description = Value(description),
       iconKey = Value(iconKey),
       sortOrder = Value(sortOrder);
  static Insertable<OnboardingStep> custom({
    Expression<int>? id,
    Expression<String>? stepNumber,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? iconKey,
    Expression<bool>? showPlatforms,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (stepNumber != null) 'step_number': stepNumber,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (iconKey != null) 'icon_key': iconKey,
      if (showPlatforms != null) 'show_platforms': showPlatforms,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  OnboardingStepsCompanion copyWith({
    Value<int>? id,
    Value<String>? stepNumber,
    Value<String>? title,
    Value<String>? description,
    Value<String>? iconKey,
    Value<bool>? showPlatforms,
    Value<int>? sortOrder,
  }) {
    return OnboardingStepsCompanion(
      id: id ?? this.id,
      stepNumber: stepNumber ?? this.stepNumber,
      title: title ?? this.title,
      description: description ?? this.description,
      iconKey: iconKey ?? this.iconKey,
      showPlatforms: showPlatforms ?? this.showPlatforms,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (stepNumber.present) {
      map['step_number'] = Variable<String>(stepNumber.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (iconKey.present) {
      map['icon_key'] = Variable<String>(iconKey.value);
    }
    if (showPlatforms.present) {
      map['show_platforms'] = Variable<bool>(showPlatforms.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OnboardingStepsCompanion(')
          ..write('id: $id, ')
          ..write('stepNumber: $stepNumber, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('iconKey: $iconKey, ')
          ..write('showPlatforms: $showPlatforms, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

class $BrowserPlatformsTable extends BrowserPlatforms
    with TableInfo<$BrowserPlatformsTable, BrowserPlatform> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BrowserPlatformsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _iconKeyMeta = const VerificationMeta(
    'iconKey',
  );
  @override
  late final GeneratedColumn<String> iconKey = GeneratedColumn<String>(
    'icon_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('public'),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, iconKey, sortOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'browser_platforms';
  @override
  VerificationContext validateIntegrity(
    Insertable<BrowserPlatform> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon_key')) {
      context.handle(
        _iconKeyMeta,
        iconKey.isAcceptableOrUnknown(data['icon_key']!, _iconKeyMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_sortOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BrowserPlatform map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BrowserPlatform(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      iconKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_key'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $BrowserPlatformsTable createAlias(String alias) {
    return $BrowserPlatformsTable(attachedDatabase, alias);
  }
}

class BrowserPlatform extends DataClass implements Insertable<BrowserPlatform> {
  final int id;
  final String name;
  final String iconKey;
  final int sortOrder;
  const BrowserPlatform({
    required this.id,
    required this.name,
    required this.iconKey,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['icon_key'] = Variable<String>(iconKey);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  BrowserPlatformsCompanion toCompanion(bool nullToAbsent) {
    return BrowserPlatformsCompanion(
      id: Value(id),
      name: Value(name),
      iconKey: Value(iconKey),
      sortOrder: Value(sortOrder),
    );
  }

  factory BrowserPlatform.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BrowserPlatform(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      iconKey: serializer.fromJson<String>(json['iconKey']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'iconKey': serializer.toJson<String>(iconKey),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  BrowserPlatform copyWith({
    int? id,
    String? name,
    String? iconKey,
    int? sortOrder,
  }) => BrowserPlatform(
    id: id ?? this.id,
    name: name ?? this.name,
    iconKey: iconKey ?? this.iconKey,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  BrowserPlatform copyWithCompanion(BrowserPlatformsCompanion data) {
    return BrowserPlatform(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      iconKey: data.iconKey.present ? data.iconKey.value : this.iconKey,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BrowserPlatform(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('iconKey: $iconKey, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, iconKey, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BrowserPlatform &&
          other.id == this.id &&
          other.name == this.name &&
          other.iconKey == this.iconKey &&
          other.sortOrder == this.sortOrder);
}

class BrowserPlatformsCompanion extends UpdateCompanion<BrowserPlatform> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> iconKey;
  final Value<int> sortOrder;
  const BrowserPlatformsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.iconKey = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  BrowserPlatformsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.iconKey = const Value.absent(),
    required int sortOrder,
  }) : name = Value(name),
       sortOrder = Value(sortOrder);
  static Insertable<BrowserPlatform> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? iconKey,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (iconKey != null) 'icon_key': iconKey,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  BrowserPlatformsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? iconKey,
    Value<int>? sortOrder,
  }) {
    return BrowserPlatformsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      iconKey: iconKey ?? this.iconKey,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (iconKey.present) {
      map['icon_key'] = Variable<String>(iconKey.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BrowserPlatformsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('iconKey: $iconKey, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LinksTable links = $LinksTable(this);
  late final $LinkPreviewsTable linkPreviews = $LinkPreviewsTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $LinkTagsTable linkTags = $LinkTagsTable(this);
  late final $CollectionsTable collections = $CollectionsTable(this);
  late final $CollectionLinksTable collectionLinks = $CollectionLinksTable(
    this,
  );
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $ProfileMetricsTable profileMetrics = $ProfileMetricsTable(this);
  late final $SettingItemsTable settingItems = $SettingItemsTable(this);
  late final $OnboardingStepsTable onboardingSteps = $OnboardingStepsTable(
    this,
  );
  late final $BrowserPlatformsTable browserPlatforms = $BrowserPlatformsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    links,
    linkPreviews,
    tags,
    linkTags,
    collections,
    collectionLinks,
    userProfiles,
    profileMetrics,
    settingItems,
    onboardingSteps,
    browserPlatforms,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'links',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('link_previews', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'links',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('link_tags', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tags',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('link_tags', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'collections',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('collection_links', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'links',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('collection_links', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'user_profiles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('profile_metrics', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$LinksTableCreateCompanionBuilder =
    LinksCompanion Function({
      Value<int> id,
      required String title,
      required String url,
      required String domain,
      Value<String> description,
      Value<String?> sourceImageUrl,
      Value<String> readingTime,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$LinksTableUpdateCompanionBuilder =
    LinksCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> url,
      Value<String> domain,
      Value<String> description,
      Value<String?> sourceImageUrl,
      Value<String> readingTime,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$LinksTableReferences
    extends BaseReferences<_$AppDatabase, $LinksTable, Link> {
  $$LinksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LinkPreviewsTable, List<LinkPreview>>
  _linkPreviewsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.linkPreviews,
    aliasName: $_aliasNameGenerator(db.links.id, db.linkPreviews.linkId),
  );

  $$LinkPreviewsTableProcessedTableManager get linkPreviewsRefs {
    final manager = $$LinkPreviewsTableTableManager(
      $_db,
      $_db.linkPreviews,
    ).filter((f) => f.linkId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_linkPreviewsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LinkTagsTable, List<LinkTag>> _linkTagsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.linkTags,
    aliasName: $_aliasNameGenerator(db.links.id, db.linkTags.linkId),
  );

  $$LinkTagsTableProcessedTableManager get linkTagsRefs {
    final manager = $$LinkTagsTableTableManager(
      $_db,
      $_db.linkTags,
    ).filter((f) => f.linkId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_linkTagsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CollectionLinksTable, List<CollectionLink>>
  _collectionLinksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.collectionLinks,
    aliasName: $_aliasNameGenerator(db.links.id, db.collectionLinks.linkId),
  );

  $$CollectionLinksTableProcessedTableManager get collectionLinksRefs {
    final manager = $$CollectionLinksTableTableManager(
      $_db,
      $_db.collectionLinks,
    ).filter((f) => f.linkId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _collectionLinksRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LinksTableFilterComposer extends Composer<_$AppDatabase, $LinksTable> {
  $$LinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get domain => $composableBuilder(
    column: $table.domain,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceImageUrl => $composableBuilder(
    column: $table.sourceImageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get readingTime => $composableBuilder(
    column: $table.readingTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> linkPreviewsRefs(
    Expression<bool> Function($$LinkPreviewsTableFilterComposer f) f,
  ) {
    final $$LinkPreviewsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.linkPreviews,
      getReferencedColumn: (t) => t.linkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinkPreviewsTableFilterComposer(
            $db: $db,
            $table: $db.linkPreviews,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> linkTagsRefs(
    Expression<bool> Function($$LinkTagsTableFilterComposer f) f,
  ) {
    final $$LinkTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.linkTags,
      getReferencedColumn: (t) => t.linkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinkTagsTableFilterComposer(
            $db: $db,
            $table: $db.linkTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> collectionLinksRefs(
    Expression<bool> Function($$CollectionLinksTableFilterComposer f) f,
  ) {
    final $$CollectionLinksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.collectionLinks,
      getReferencedColumn: (t) => t.linkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionLinksTableFilterComposer(
            $db: $db,
            $table: $db.collectionLinks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LinksTableOrderingComposer
    extends Composer<_$AppDatabase, $LinksTable> {
  $$LinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get domain => $composableBuilder(
    column: $table.domain,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceImageUrl => $composableBuilder(
    column: $table.sourceImageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get readingTime => $composableBuilder(
    column: $table.readingTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $LinksTable> {
  $$LinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get domain =>
      $composableBuilder(column: $table.domain, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceImageUrl => $composableBuilder(
    column: $table.sourceImageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get readingTime => $composableBuilder(
    column: $table.readingTime,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> linkPreviewsRefs<T extends Object>(
    Expression<T> Function($$LinkPreviewsTableAnnotationComposer a) f,
  ) {
    final $$LinkPreviewsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.linkPreviews,
      getReferencedColumn: (t) => t.linkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinkPreviewsTableAnnotationComposer(
            $db: $db,
            $table: $db.linkPreviews,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> linkTagsRefs<T extends Object>(
    Expression<T> Function($$LinkTagsTableAnnotationComposer a) f,
  ) {
    final $$LinkTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.linkTags,
      getReferencedColumn: (t) => t.linkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinkTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.linkTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> collectionLinksRefs<T extends Object>(
    Expression<T> Function($$CollectionLinksTableAnnotationComposer a) f,
  ) {
    final $$CollectionLinksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.collectionLinks,
      getReferencedColumn: (t) => t.linkId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionLinksTableAnnotationComposer(
            $db: $db,
            $table: $db.collectionLinks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LinksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LinksTable,
          Link,
          $$LinksTableFilterComposer,
          $$LinksTableOrderingComposer,
          $$LinksTableAnnotationComposer,
          $$LinksTableCreateCompanionBuilder,
          $$LinksTableUpdateCompanionBuilder,
          (Link, $$LinksTableReferences),
          Link,
          PrefetchHooks Function({
            bool linkPreviewsRefs,
            bool linkTagsRefs,
            bool collectionLinksRefs,
          })
        > {
  $$LinksTableTableManager(_$AppDatabase db, $LinksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LinksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LinksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String> domain = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String?> sourceImageUrl = const Value.absent(),
                Value<String> readingTime = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => LinksCompanion(
                id: id,
                title: title,
                url: url,
                domain: domain,
                description: description,
                sourceImageUrl: sourceImageUrl,
                readingTime: readingTime,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String url,
                required String domain,
                Value<String> description = const Value.absent(),
                Value<String?> sourceImageUrl = const Value.absent(),
                Value<String> readingTime = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => LinksCompanion.insert(
                id: id,
                title: title,
                url: url,
                domain: domain,
                description: description,
                sourceImageUrl: sourceImageUrl,
                readingTime: readingTime,
                isArchived: isArchived,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$LinksTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                linkPreviewsRefs = false,
                linkTagsRefs = false,
                collectionLinksRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (linkPreviewsRefs) db.linkPreviews,
                    if (linkTagsRefs) db.linkTags,
                    if (collectionLinksRefs) db.collectionLinks,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (linkPreviewsRefs)
                        await $_getPrefetchedData<
                          Link,
                          $LinksTable,
                          LinkPreview
                        >(
                          currentTable: table,
                          referencedTable: $$LinksTableReferences
                              ._linkPreviewsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LinksTableReferences(
                                db,
                                table,
                                p0,
                              ).linkPreviewsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.linkId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (linkTagsRefs)
                        await $_getPrefetchedData<Link, $LinksTable, LinkTag>(
                          currentTable: table,
                          referencedTable: $$LinksTableReferences
                              ._linkTagsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LinksTableReferences(
                                db,
                                table,
                                p0,
                              ).linkTagsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.linkId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (collectionLinksRefs)
                        await $_getPrefetchedData<
                          Link,
                          $LinksTable,
                          CollectionLink
                        >(
                          currentTable: table,
                          referencedTable: $$LinksTableReferences
                              ._collectionLinksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LinksTableReferences(
                                db,
                                table,
                                p0,
                              ).collectionLinksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.linkId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LinksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LinksTable,
      Link,
      $$LinksTableFilterComposer,
      $$LinksTableOrderingComposer,
      $$LinksTableAnnotationComposer,
      $$LinksTableCreateCompanionBuilder,
      $$LinksTableUpdateCompanionBuilder,
      (Link, $$LinksTableReferences),
      Link,
      PrefetchHooks Function({
        bool linkPreviewsRefs,
        bool linkTagsRefs,
        bool collectionLinksRefs,
      })
    >;
typedef $$LinkPreviewsTableCreateCompanionBuilder =
    LinkPreviewsCompanion Function({
      Value<int> id,
      required int linkId,
      required String previewTitle,
      Value<String> previewDescription,
      Value<String?> imageUrl,
      Value<String> imageLabel,
      Value<String> imageDimensions,
      Value<DateTime> fetchedAt,
    });
typedef $$LinkPreviewsTableUpdateCompanionBuilder =
    LinkPreviewsCompanion Function({
      Value<int> id,
      Value<int> linkId,
      Value<String> previewTitle,
      Value<String> previewDescription,
      Value<String?> imageUrl,
      Value<String> imageLabel,
      Value<String> imageDimensions,
      Value<DateTime> fetchedAt,
    });

final class $$LinkPreviewsTableReferences
    extends BaseReferences<_$AppDatabase, $LinkPreviewsTable, LinkPreview> {
  $$LinkPreviewsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LinksTable _linkIdTable(_$AppDatabase db) => db.links.createAlias(
    $_aliasNameGenerator(db.linkPreviews.linkId, db.links.id),
  );

  $$LinksTableProcessedTableManager get linkId {
    final $_column = $_itemColumn<int>('link_id')!;

    final manager = $$LinksTableTableManager(
      $_db,
      $_db.links,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_linkIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LinkPreviewsTableFilterComposer
    extends Composer<_$AppDatabase, $LinkPreviewsTable> {
  $$LinkPreviewsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get previewTitle => $composableBuilder(
    column: $table.previewTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get previewDescription => $composableBuilder(
    column: $table.previewDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageLabel => $composableBuilder(
    column: $table.imageLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageDimensions => $composableBuilder(
    column: $table.imageDimensions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$LinksTableFilterComposer get linkId {
    final $$LinksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.linkId,
      referencedTable: $db.links,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinksTableFilterComposer(
            $db: $db,
            $table: $db.links,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LinkPreviewsTableOrderingComposer
    extends Composer<_$AppDatabase, $LinkPreviewsTable> {
  $$LinkPreviewsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get previewTitle => $composableBuilder(
    column: $table.previewTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get previewDescription => $composableBuilder(
    column: $table.previewDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageLabel => $composableBuilder(
    column: $table.imageLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageDimensions => $composableBuilder(
    column: $table.imageDimensions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$LinksTableOrderingComposer get linkId {
    final $$LinksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.linkId,
      referencedTable: $db.links,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinksTableOrderingComposer(
            $db: $db,
            $table: $db.links,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LinkPreviewsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LinkPreviewsTable> {
  $$LinkPreviewsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get previewTitle => $composableBuilder(
    column: $table.previewTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get previewDescription => $composableBuilder(
    column: $table.previewDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get imageLabel => $composableBuilder(
    column: $table.imageLabel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageDimensions => $composableBuilder(
    column: $table.imageDimensions,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fetchedAt =>
      $composableBuilder(column: $table.fetchedAt, builder: (column) => column);

  $$LinksTableAnnotationComposer get linkId {
    final $$LinksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.linkId,
      referencedTable: $db.links,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinksTableAnnotationComposer(
            $db: $db,
            $table: $db.links,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LinkPreviewsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LinkPreviewsTable,
          LinkPreview,
          $$LinkPreviewsTableFilterComposer,
          $$LinkPreviewsTableOrderingComposer,
          $$LinkPreviewsTableAnnotationComposer,
          $$LinkPreviewsTableCreateCompanionBuilder,
          $$LinkPreviewsTableUpdateCompanionBuilder,
          (LinkPreview, $$LinkPreviewsTableReferences),
          LinkPreview,
          PrefetchHooks Function({bool linkId})
        > {
  $$LinkPreviewsTableTableManager(_$AppDatabase db, $LinkPreviewsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LinkPreviewsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LinkPreviewsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LinkPreviewsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> linkId = const Value.absent(),
                Value<String> previewTitle = const Value.absent(),
                Value<String> previewDescription = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String> imageLabel = const Value.absent(),
                Value<String> imageDimensions = const Value.absent(),
                Value<DateTime> fetchedAt = const Value.absent(),
              }) => LinkPreviewsCompanion(
                id: id,
                linkId: linkId,
                previewTitle: previewTitle,
                previewDescription: previewDescription,
                imageUrl: imageUrl,
                imageLabel: imageLabel,
                imageDimensions: imageDimensions,
                fetchedAt: fetchedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int linkId,
                required String previewTitle,
                Value<String> previewDescription = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<String> imageLabel = const Value.absent(),
                Value<String> imageDimensions = const Value.absent(),
                Value<DateTime> fetchedAt = const Value.absent(),
              }) => LinkPreviewsCompanion.insert(
                id: id,
                linkId: linkId,
                previewTitle: previewTitle,
                previewDescription: previewDescription,
                imageUrl: imageUrl,
                imageLabel: imageLabel,
                imageDimensions: imageDimensions,
                fetchedAt: fetchedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LinkPreviewsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({linkId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (linkId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.linkId,
                                referencedTable: $$LinkPreviewsTableReferences
                                    ._linkIdTable(db),
                                referencedColumn: $$LinkPreviewsTableReferences
                                    ._linkIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LinkPreviewsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LinkPreviewsTable,
      LinkPreview,
      $$LinkPreviewsTableFilterComposer,
      $$LinkPreviewsTableOrderingComposer,
      $$LinkPreviewsTableAnnotationComposer,
      $$LinkPreviewsTableCreateCompanionBuilder,
      $$LinkPreviewsTableUpdateCompanionBuilder,
      (LinkPreview, $$LinkPreviewsTableReferences),
      LinkPreview,
      PrefetchHooks Function({bool linkId})
    >;
typedef $$TagsTableCreateCompanionBuilder =
    TagsCompanion Function({
      Value<int> id,
      required String name,
      Value<String> category,
      Value<DateTime> createdAt,
    });
typedef $$TagsTableUpdateCompanionBuilder =
    TagsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> category,
      Value<DateTime> createdAt,
    });

final class $$TagsTableReferences
    extends BaseReferences<_$AppDatabase, $TagsTable, Tag> {
  $$TagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LinkTagsTable, List<LinkTag>> _linkTagsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.linkTags,
    aliasName: $_aliasNameGenerator(db.tags.id, db.linkTags.tagId),
  );

  $$LinkTagsTableProcessedTableManager get linkTagsRefs {
    final manager = $$LinkTagsTableTableManager(
      $_db,
      $_db.linkTags,
    ).filter((f) => f.tagId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_linkTagsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TagsTableFilterComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> linkTagsRefs(
    Expression<bool> Function($$LinkTagsTableFilterComposer f) f,
  ) {
    final $$LinkTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.linkTags,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinkTagsTableFilterComposer(
            $db: $db,
            $table: $db.linkTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableOrderingComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> linkTagsRefs<T extends Object>(
    Expression<T> Function($$LinkTagsTableAnnotationComposer a) f,
  ) {
    final $$LinkTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.linkTags,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinkTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.linkTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TagsTable,
          Tag,
          $$TagsTableFilterComposer,
          $$TagsTableOrderingComposer,
          $$TagsTableAnnotationComposer,
          $$TagsTableCreateCompanionBuilder,
          $$TagsTableUpdateCompanionBuilder,
          (Tag, $$TagsTableReferences),
          Tag,
          PrefetchHooks Function({bool linkTagsRefs})
        > {
  $$TagsTableTableManager(_$AppDatabase db, $TagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TagsCompanion(
                id: id,
                name: name,
                category: category,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String> category = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TagsCompanion.insert(
                id: id,
                name: name,
                category: category,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TagsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({linkTagsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (linkTagsRefs) db.linkTags],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (linkTagsRefs)
                    await $_getPrefetchedData<Tag, $TagsTable, LinkTag>(
                      currentTable: table,
                      referencedTable: $$TagsTableReferences._linkTagsRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$TagsTableReferences(db, table, p0).linkTagsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.tagId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TagsTable,
      Tag,
      $$TagsTableFilterComposer,
      $$TagsTableOrderingComposer,
      $$TagsTableAnnotationComposer,
      $$TagsTableCreateCompanionBuilder,
      $$TagsTableUpdateCompanionBuilder,
      (Tag, $$TagsTableReferences),
      Tag,
      PrefetchHooks Function({bool linkTagsRefs})
    >;
typedef $$LinkTagsTableCreateCompanionBuilder =
    LinkTagsCompanion Function({
      required int linkId,
      required int tagId,
      Value<int> rowid,
    });
typedef $$LinkTagsTableUpdateCompanionBuilder =
    LinkTagsCompanion Function({
      Value<int> linkId,
      Value<int> tagId,
      Value<int> rowid,
    });

final class $$LinkTagsTableReferences
    extends BaseReferences<_$AppDatabase, $LinkTagsTable, LinkTag> {
  $$LinkTagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LinksTable _linkIdTable(_$AppDatabase db) => db.links.createAlias(
    $_aliasNameGenerator(db.linkTags.linkId, db.links.id),
  );

  $$LinksTableProcessedTableManager get linkId {
    final $_column = $_itemColumn<int>('link_id')!;

    final manager = $$LinksTableTableManager(
      $_db,
      $_db.links,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_linkIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TagsTable _tagIdTable(_$AppDatabase db) =>
      db.tags.createAlias($_aliasNameGenerator(db.linkTags.tagId, db.tags.id));

  $$TagsTableProcessedTableManager get tagId {
    final $_column = $_itemColumn<int>('tag_id')!;

    final manager = $$TagsTableTableManager(
      $_db,
      $_db.tags,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LinkTagsTableFilterComposer
    extends Composer<_$AppDatabase, $LinkTagsTable> {
  $$LinkTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$LinksTableFilterComposer get linkId {
    final $$LinksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.linkId,
      referencedTable: $db.links,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinksTableFilterComposer(
            $db: $db,
            $table: $db.links,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableFilterComposer get tagId {
    final $$TagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableFilterComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LinkTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $LinkTagsTable> {
  $$LinkTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$LinksTableOrderingComposer get linkId {
    final $$LinksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.linkId,
      referencedTable: $db.links,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinksTableOrderingComposer(
            $db: $db,
            $table: $db.links,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableOrderingComposer get tagId {
    final $$TagsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableOrderingComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LinkTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LinkTagsTable> {
  $$LinkTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$LinksTableAnnotationComposer get linkId {
    final $$LinksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.linkId,
      referencedTable: $db.links,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinksTableAnnotationComposer(
            $db: $db,
            $table: $db.links,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableAnnotationComposer get tagId {
    final $$TagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableAnnotationComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LinkTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LinkTagsTable,
          LinkTag,
          $$LinkTagsTableFilterComposer,
          $$LinkTagsTableOrderingComposer,
          $$LinkTagsTableAnnotationComposer,
          $$LinkTagsTableCreateCompanionBuilder,
          $$LinkTagsTableUpdateCompanionBuilder,
          (LinkTag, $$LinkTagsTableReferences),
          LinkTag,
          PrefetchHooks Function({bool linkId, bool tagId})
        > {
  $$LinkTagsTableTableManager(_$AppDatabase db, $LinkTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LinkTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LinkTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LinkTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> linkId = const Value.absent(),
                Value<int> tagId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) =>
                  LinkTagsCompanion(linkId: linkId, tagId: tagId, rowid: rowid),
          createCompanionCallback:
              ({
                required int linkId,
                required int tagId,
                Value<int> rowid = const Value.absent(),
              }) => LinkTagsCompanion.insert(
                linkId: linkId,
                tagId: tagId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LinkTagsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({linkId = false, tagId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (linkId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.linkId,
                                referencedTable: $$LinkTagsTableReferences
                                    ._linkIdTable(db),
                                referencedColumn: $$LinkTagsTableReferences
                                    ._linkIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (tagId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tagId,
                                referencedTable: $$LinkTagsTableReferences
                                    ._tagIdTable(db),
                                referencedColumn: $$LinkTagsTableReferences
                                    ._tagIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LinkTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LinkTagsTable,
      LinkTag,
      $$LinkTagsTableFilterComposer,
      $$LinkTagsTableOrderingComposer,
      $$LinkTagsTableAnnotationComposer,
      $$LinkTagsTableCreateCompanionBuilder,
      $$LinkTagsTableUpdateCompanionBuilder,
      (LinkTag, $$LinkTagsTableReferences),
      LinkTag,
      PrefetchHooks Function({bool linkId, bool tagId})
    >;
typedef $$CollectionsTableCreateCompanionBuilder =
    CollectionsCompanion Function({
      Value<int> id,
      required String title,
      required String type,
      Value<String> iconKey,
      Value<String> tagName,
      Value<DateTime> createdAt,
    });
typedef $$CollectionsTableUpdateCompanionBuilder =
    CollectionsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> type,
      Value<String> iconKey,
      Value<String> tagName,
      Value<DateTime> createdAt,
    });

final class $$CollectionsTableReferences
    extends BaseReferences<_$AppDatabase, $CollectionsTable, Collection> {
  $$CollectionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CollectionLinksTable, List<CollectionLink>>
  _collectionLinksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.collectionLinks,
    aliasName: $_aliasNameGenerator(
      db.collections.id,
      db.collectionLinks.collectionId,
    ),
  );

  $$CollectionLinksTableProcessedTableManager get collectionLinksRefs {
    final manager = $$CollectionLinksTableTableManager(
      $_db,
      $_db.collectionLinks,
    ).filter((f) => f.collectionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _collectionLinksRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CollectionsTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionsTable> {
  $$CollectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconKey => $composableBuilder(
    column: $table.iconKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagName => $composableBuilder(
    column: $table.tagName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> collectionLinksRefs(
    Expression<bool> Function($$CollectionLinksTableFilterComposer f) f,
  ) {
    final $$CollectionLinksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.collectionLinks,
      getReferencedColumn: (t) => t.collectionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionLinksTableFilterComposer(
            $db: $db,
            $table: $db.collectionLinks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CollectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionsTable> {
  $$CollectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconKey => $composableBuilder(
    column: $table.iconKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagName => $composableBuilder(
    column: $table.tagName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CollectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionsTable> {
  $$CollectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get iconKey =>
      $composableBuilder(column: $table.iconKey, builder: (column) => column);

  GeneratedColumn<String> get tagName =>
      $composableBuilder(column: $table.tagName, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> collectionLinksRefs<T extends Object>(
    Expression<T> Function($$CollectionLinksTableAnnotationComposer a) f,
  ) {
    final $$CollectionLinksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.collectionLinks,
      getReferencedColumn: (t) => t.collectionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionLinksTableAnnotationComposer(
            $db: $db,
            $table: $db.collectionLinks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CollectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CollectionsTable,
          Collection,
          $$CollectionsTableFilterComposer,
          $$CollectionsTableOrderingComposer,
          $$CollectionsTableAnnotationComposer,
          $$CollectionsTableCreateCompanionBuilder,
          $$CollectionsTableUpdateCompanionBuilder,
          (Collection, $$CollectionsTableReferences),
          Collection,
          PrefetchHooks Function({bool collectionLinksRefs})
        > {
  $$CollectionsTableTableManager(_$AppDatabase db, $CollectionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> iconKey = const Value.absent(),
                Value<String> tagName = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CollectionsCompanion(
                id: id,
                title: title,
                type: type,
                iconKey: iconKey,
                tagName: tagName,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String type,
                Value<String> iconKey = const Value.absent(),
                Value<String> tagName = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CollectionsCompanion.insert(
                id: id,
                title: title,
                type: type,
                iconKey: iconKey,
                tagName: tagName,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CollectionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({collectionLinksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (collectionLinksRefs) db.collectionLinks,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (collectionLinksRefs)
                    await $_getPrefetchedData<
                      Collection,
                      $CollectionsTable,
                      CollectionLink
                    >(
                      currentTable: table,
                      referencedTable: $$CollectionsTableReferences
                          ._collectionLinksRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CollectionsTableReferences(
                            db,
                            table,
                            p0,
                          ).collectionLinksRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.collectionId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CollectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CollectionsTable,
      Collection,
      $$CollectionsTableFilterComposer,
      $$CollectionsTableOrderingComposer,
      $$CollectionsTableAnnotationComposer,
      $$CollectionsTableCreateCompanionBuilder,
      $$CollectionsTableUpdateCompanionBuilder,
      (Collection, $$CollectionsTableReferences),
      Collection,
      PrefetchHooks Function({bool collectionLinksRefs})
    >;
typedef $$CollectionLinksTableCreateCompanionBuilder =
    CollectionLinksCompanion Function({
      required int collectionId,
      required int linkId,
      Value<int> rowid,
    });
typedef $$CollectionLinksTableUpdateCompanionBuilder =
    CollectionLinksCompanion Function({
      Value<int> collectionId,
      Value<int> linkId,
      Value<int> rowid,
    });

final class $$CollectionLinksTableReferences
    extends
        BaseReferences<_$AppDatabase, $CollectionLinksTable, CollectionLink> {
  $$CollectionLinksTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CollectionsTable _collectionIdTable(_$AppDatabase db) =>
      db.collections.createAlias(
        $_aliasNameGenerator(
          db.collectionLinks.collectionId,
          db.collections.id,
        ),
      );

  $$CollectionsTableProcessedTableManager get collectionId {
    final $_column = $_itemColumn<int>('collection_id')!;

    final manager = $$CollectionsTableTableManager(
      $_db,
      $_db.collections,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_collectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LinksTable _linkIdTable(_$AppDatabase db) => db.links.createAlias(
    $_aliasNameGenerator(db.collectionLinks.linkId, db.links.id),
  );

  $$LinksTableProcessedTableManager get linkId {
    final $_column = $_itemColumn<int>('link_id')!;

    final manager = $$LinksTableTableManager(
      $_db,
      $_db.links,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_linkIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CollectionLinksTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionLinksTable> {
  $$CollectionLinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CollectionsTableFilterComposer get collectionId {
    final $$CollectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.collectionId,
      referencedTable: $db.collections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionsTableFilterComposer(
            $db: $db,
            $table: $db.collections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LinksTableFilterComposer get linkId {
    final $$LinksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.linkId,
      referencedTable: $db.links,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinksTableFilterComposer(
            $db: $db,
            $table: $db.links,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CollectionLinksTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionLinksTable> {
  $$CollectionLinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CollectionsTableOrderingComposer get collectionId {
    final $$CollectionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.collectionId,
      referencedTable: $db.collections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionsTableOrderingComposer(
            $db: $db,
            $table: $db.collections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LinksTableOrderingComposer get linkId {
    final $$LinksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.linkId,
      referencedTable: $db.links,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinksTableOrderingComposer(
            $db: $db,
            $table: $db.links,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CollectionLinksTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionLinksTable> {
  $$CollectionLinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CollectionsTableAnnotationComposer get collectionId {
    final $$CollectionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.collectionId,
      referencedTable: $db.collections,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionsTableAnnotationComposer(
            $db: $db,
            $table: $db.collections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LinksTableAnnotationComposer get linkId {
    final $$LinksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.linkId,
      referencedTable: $db.links,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinksTableAnnotationComposer(
            $db: $db,
            $table: $db.links,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CollectionLinksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CollectionLinksTable,
          CollectionLink,
          $$CollectionLinksTableFilterComposer,
          $$CollectionLinksTableOrderingComposer,
          $$CollectionLinksTableAnnotationComposer,
          $$CollectionLinksTableCreateCompanionBuilder,
          $$CollectionLinksTableUpdateCompanionBuilder,
          (CollectionLink, $$CollectionLinksTableReferences),
          CollectionLink,
          PrefetchHooks Function({bool collectionId, bool linkId})
        > {
  $$CollectionLinksTableTableManager(
    _$AppDatabase db,
    $CollectionLinksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionLinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionLinksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionLinksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> collectionId = const Value.absent(),
                Value<int> linkId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CollectionLinksCompanion(
                collectionId: collectionId,
                linkId: linkId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int collectionId,
                required int linkId,
                Value<int> rowid = const Value.absent(),
              }) => CollectionLinksCompanion.insert(
                collectionId: collectionId,
                linkId: linkId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CollectionLinksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({collectionId = false, linkId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (collectionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.collectionId,
                                referencedTable:
                                    $$CollectionLinksTableReferences
                                        ._collectionIdTable(db),
                                referencedColumn:
                                    $$CollectionLinksTableReferences
                                        ._collectionIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (linkId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.linkId,
                                referencedTable:
                                    $$CollectionLinksTableReferences
                                        ._linkIdTable(db),
                                referencedColumn:
                                    $$CollectionLinksTableReferences
                                        ._linkIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CollectionLinksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CollectionLinksTable,
      CollectionLink,
      $$CollectionLinksTableFilterComposer,
      $$CollectionLinksTableOrderingComposer,
      $$CollectionLinksTableAnnotationComposer,
      $$CollectionLinksTableCreateCompanionBuilder,
      $$CollectionLinksTableUpdateCompanionBuilder,
      (CollectionLink, $$CollectionLinksTableReferences),
      CollectionLink,
      PrefetchHooks Function({bool collectionId, bool linkId})
    >;
typedef $$UserProfilesTableCreateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<int> id,
      Value<String> displayName,
      Value<String> authLevel,
      Value<int> linksSaved,
      Value<double> dataUsedMb,
      Value<double> storagePercent,
      Value<String> version,
      Value<DateTime> updatedAt,
    });
typedef $$UserProfilesTableUpdateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<int> id,
      Value<String> displayName,
      Value<String> authLevel,
      Value<int> linksSaved,
      Value<double> dataUsedMb,
      Value<double> storagePercent,
      Value<String> version,
      Value<DateTime> updatedAt,
    });

final class $$UserProfilesTableReferences
    extends BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile> {
  $$UserProfilesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProfileMetricsTable, List<ProfileMetric>>
  _profileMetricsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.profileMetrics,
    aliasName: $_aliasNameGenerator(
      db.userProfiles.id,
      db.profileMetrics.profileId,
    ),
  );

  $$ProfileMetricsTableProcessedTableManager get profileMetricsRefs {
    final manager = $$ProfileMetricsTableTableManager(
      $_db,
      $_db.profileMetrics,
    ).filter((f) => f.profileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_profileMetricsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authLevel => $composableBuilder(
    column: $table.authLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get linksSaved => $composableBuilder(
    column: $table.linksSaved,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get dataUsedMb => $composableBuilder(
    column: $table.dataUsedMb,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get storagePercent => $composableBuilder(
    column: $table.storagePercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> profileMetricsRefs(
    Expression<bool> Function($$ProfileMetricsTableFilterComposer f) f,
  ) {
    final $$ProfileMetricsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.profileMetrics,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfileMetricsTableFilterComposer(
            $db: $db,
            $table: $db.profileMetrics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authLevel => $composableBuilder(
    column: $table.authLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get linksSaved => $composableBuilder(
    column: $table.linksSaved,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get dataUsedMb => $composableBuilder(
    column: $table.dataUsedMb,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get storagePercent => $composableBuilder(
    column: $table.storagePercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get authLevel =>
      $composableBuilder(column: $table.authLevel, builder: (column) => column);

  GeneratedColumn<int> get linksSaved => $composableBuilder(
    column: $table.linksSaved,
    builder: (column) => column,
  );

  GeneratedColumn<double> get dataUsedMb => $composableBuilder(
    column: $table.dataUsedMb,
    builder: (column) => column,
  );

  GeneratedColumn<double> get storagePercent => $composableBuilder(
    column: $table.storagePercent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> profileMetricsRefs<T extends Object>(
    Expression<T> Function($$ProfileMetricsTableAnnotationComposer a) f,
  ) {
    final $$ProfileMetricsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.profileMetrics,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfileMetricsTableAnnotationComposer(
            $db: $db,
            $table: $db.profileMetrics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfilesTable,
          UserProfile,
          $$UserProfilesTableFilterComposer,
          $$UserProfilesTableOrderingComposer,
          $$UserProfilesTableAnnotationComposer,
          $$UserProfilesTableCreateCompanionBuilder,
          $$UserProfilesTableUpdateCompanionBuilder,
          (UserProfile, $$UserProfilesTableReferences),
          UserProfile,
          PrefetchHooks Function({bool profileMetricsRefs})
        > {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String> authLevel = const Value.absent(),
                Value<int> linksSaved = const Value.absent(),
                Value<double> dataUsedMb = const Value.absent(),
                Value<double> storagePercent = const Value.absent(),
                Value<String> version = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserProfilesCompanion(
                id: id,
                displayName: displayName,
                authLevel: authLevel,
                linksSaved: linksSaved,
                dataUsedMb: dataUsedMb,
                storagePercent: storagePercent,
                version: version,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String> authLevel = const Value.absent(),
                Value<int> linksSaved = const Value.absent(),
                Value<double> dataUsedMb = const Value.absent(),
                Value<double> storagePercent = const Value.absent(),
                Value<String> version = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserProfilesCompanion.insert(
                id: id,
                displayName: displayName,
                authLevel: authLevel,
                linksSaved: linksSaved,
                dataUsedMb: dataUsedMb,
                storagePercent: storagePercent,
                version: version,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserProfilesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({profileMetricsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (profileMetricsRefs) db.profileMetrics,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (profileMetricsRefs)
                    await $_getPrefetchedData<
                      UserProfile,
                      $UserProfilesTable,
                      ProfileMetric
                    >(
                      currentTable: table,
                      referencedTable: $$UserProfilesTableReferences
                          ._profileMetricsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UserProfilesTableReferences(
                            db,
                            table,
                            p0,
                          ).profileMetricsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.profileId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UserProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfilesTable,
      UserProfile,
      $$UserProfilesTableFilterComposer,
      $$UserProfilesTableOrderingComposer,
      $$UserProfilesTableAnnotationComposer,
      $$UserProfilesTableCreateCompanionBuilder,
      $$UserProfilesTableUpdateCompanionBuilder,
      (UserProfile, $$UserProfilesTableReferences),
      UserProfile,
      PrefetchHooks Function({bool profileMetricsRefs})
    >;
typedef $$ProfileMetricsTableCreateCompanionBuilder =
    ProfileMetricsCompanion Function({
      Value<int> id,
      required int profileId,
      required String label,
      required double value,
      required int sortOrder,
    });
typedef $$ProfileMetricsTableUpdateCompanionBuilder =
    ProfileMetricsCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> label,
      Value<double> value,
      Value<int> sortOrder,
    });

final class $$ProfileMetricsTableReferences
    extends BaseReferences<_$AppDatabase, $ProfileMetricsTable, ProfileMetric> {
  $$ProfileMetricsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserProfilesTable _profileIdTable(_$AppDatabase db) =>
      db.userProfiles.createAlias(
        $_aliasNameGenerator(db.profileMetrics.profileId, db.userProfiles.id),
      );

  $$UserProfilesTableProcessedTableManager get profileId {
    final $_column = $_itemColumn<int>('profile_id')!;

    final manager = $$UserProfilesTableTableManager(
      $_db,
      $_db.userProfiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProfileMetricsTableFilterComposer
    extends Composer<_$AppDatabase, $ProfileMetricsTable> {
  $$ProfileMetricsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  $$UserProfilesTableFilterComposer get profileId {
    final $$UserProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableFilterComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProfileMetricsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfileMetricsTable> {
  $$ProfileMetricsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserProfilesTableOrderingComposer get profileId {
    final $$UserProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProfileMetricsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfileMetricsTable> {
  $$ProfileMetricsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  $$UserProfilesTableAnnotationComposer get profileId {
    final $$UserProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProfileMetricsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfileMetricsTable,
          ProfileMetric,
          $$ProfileMetricsTableFilterComposer,
          $$ProfileMetricsTableOrderingComposer,
          $$ProfileMetricsTableAnnotationComposer,
          $$ProfileMetricsTableCreateCompanionBuilder,
          $$ProfileMetricsTableUpdateCompanionBuilder,
          (ProfileMetric, $$ProfileMetricsTableReferences),
          ProfileMetric,
          PrefetchHooks Function({bool profileId})
        > {
  $$ProfileMetricsTableTableManager(
    _$AppDatabase db,
    $ProfileMetricsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfileMetricsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfileMetricsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfileMetricsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<double> value = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => ProfileMetricsCompanion(
                id: id,
                profileId: profileId,
                label: label,
                value: value,
                sortOrder: sortOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String label,
                required double value,
                required int sortOrder,
              }) => ProfileMetricsCompanion.insert(
                id: id,
                profileId: profileId,
                label: label,
                value: value,
                sortOrder: sortOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProfileMetricsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({profileId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (profileId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.profileId,
                                referencedTable: $$ProfileMetricsTableReferences
                                    ._profileIdTable(db),
                                referencedColumn:
                                    $$ProfileMetricsTableReferences
                                        ._profileIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProfileMetricsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfileMetricsTable,
      ProfileMetric,
      $$ProfileMetricsTableFilterComposer,
      $$ProfileMetricsTableOrderingComposer,
      $$ProfileMetricsTableAnnotationComposer,
      $$ProfileMetricsTableCreateCompanionBuilder,
      $$ProfileMetricsTableUpdateCompanionBuilder,
      (ProfileMetric, $$ProfileMetricsTableReferences),
      ProfileMetric,
      PrefetchHooks Function({bool profileId})
    >;
typedef $$SettingItemsTableCreateCompanionBuilder =
    SettingItemsCompanion Function({
      Value<int> id,
      required String section,
      required String title,
      Value<String> subtitle,
      Value<String> kind,
      Value<String> iconKey,
      Value<bool> enabled,
      required int sortOrder,
    });
typedef $$SettingItemsTableUpdateCompanionBuilder =
    SettingItemsCompanion Function({
      Value<int> id,
      Value<String> section,
      Value<String> title,
      Value<String> subtitle,
      Value<String> kind,
      Value<String> iconKey,
      Value<bool> enabled,
      Value<int> sortOrder,
    });

class $$SettingItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingItemsTable> {
  $$SettingItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get section => $composableBuilder(
    column: $table.section,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subtitle => $composableBuilder(
    column: $table.subtitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconKey => $composableBuilder(
    column: $table.iconKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingItemsTable> {
  $$SettingItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get section => $composableBuilder(
    column: $table.section,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subtitle => $composableBuilder(
    column: $table.subtitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconKey => $composableBuilder(
    column: $table.iconKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingItemsTable> {
  $$SettingItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get section =>
      $composableBuilder(column: $table.section, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get subtitle =>
      $composableBuilder(column: $table.subtitle, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get iconKey =>
      $composableBuilder(column: $table.iconKey, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$SettingItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingItemsTable,
          SettingItem,
          $$SettingItemsTableFilterComposer,
          $$SettingItemsTableOrderingComposer,
          $$SettingItemsTableAnnotationComposer,
          $$SettingItemsTableCreateCompanionBuilder,
          $$SettingItemsTableUpdateCompanionBuilder,
          (
            SettingItem,
            BaseReferences<_$AppDatabase, $SettingItemsTable, SettingItem>,
          ),
          SettingItem,
          PrefetchHooks Function()
        > {
  $$SettingItemsTableTableManager(_$AppDatabase db, $SettingItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> section = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> subtitle = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> iconKey = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => SettingItemsCompanion(
                id: id,
                section: section,
                title: title,
                subtitle: subtitle,
                kind: kind,
                iconKey: iconKey,
                enabled: enabled,
                sortOrder: sortOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String section,
                required String title,
                Value<String> subtitle = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<String> iconKey = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                required int sortOrder,
              }) => SettingItemsCompanion.insert(
                id: id,
                section: section,
                title: title,
                subtitle: subtitle,
                kind: kind,
                iconKey: iconKey,
                enabled: enabled,
                sortOrder: sortOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingItemsTable,
      SettingItem,
      $$SettingItemsTableFilterComposer,
      $$SettingItemsTableOrderingComposer,
      $$SettingItemsTableAnnotationComposer,
      $$SettingItemsTableCreateCompanionBuilder,
      $$SettingItemsTableUpdateCompanionBuilder,
      (
        SettingItem,
        BaseReferences<_$AppDatabase, $SettingItemsTable, SettingItem>,
      ),
      SettingItem,
      PrefetchHooks Function()
    >;
typedef $$OnboardingStepsTableCreateCompanionBuilder =
    OnboardingStepsCompanion Function({
      Value<int> id,
      required String stepNumber,
      required String title,
      required String description,
      required String iconKey,
      Value<bool> showPlatforms,
      required int sortOrder,
    });
typedef $$OnboardingStepsTableUpdateCompanionBuilder =
    OnboardingStepsCompanion Function({
      Value<int> id,
      Value<String> stepNumber,
      Value<String> title,
      Value<String> description,
      Value<String> iconKey,
      Value<bool> showPlatforms,
      Value<int> sortOrder,
    });

class $$OnboardingStepsTableFilterComposer
    extends Composer<_$AppDatabase, $OnboardingStepsTable> {
  $$OnboardingStepsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stepNumber => $composableBuilder(
    column: $table.stepNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconKey => $composableBuilder(
    column: $table.iconKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get showPlatforms => $composableBuilder(
    column: $table.showPlatforms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OnboardingStepsTableOrderingComposer
    extends Composer<_$AppDatabase, $OnboardingStepsTable> {
  $$OnboardingStepsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stepNumber => $composableBuilder(
    column: $table.stepNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconKey => $composableBuilder(
    column: $table.iconKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get showPlatforms => $composableBuilder(
    column: $table.showPlatforms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OnboardingStepsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OnboardingStepsTable> {
  $$OnboardingStepsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get stepNumber => $composableBuilder(
    column: $table.stepNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get iconKey =>
      $composableBuilder(column: $table.iconKey, builder: (column) => column);

  GeneratedColumn<bool> get showPlatforms => $composableBuilder(
    column: $table.showPlatforms,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$OnboardingStepsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OnboardingStepsTable,
          OnboardingStep,
          $$OnboardingStepsTableFilterComposer,
          $$OnboardingStepsTableOrderingComposer,
          $$OnboardingStepsTableAnnotationComposer,
          $$OnboardingStepsTableCreateCompanionBuilder,
          $$OnboardingStepsTableUpdateCompanionBuilder,
          (
            OnboardingStep,
            BaseReferences<
              _$AppDatabase,
              $OnboardingStepsTable,
              OnboardingStep
            >,
          ),
          OnboardingStep,
          PrefetchHooks Function()
        > {
  $$OnboardingStepsTableTableManager(
    _$AppDatabase db,
    $OnboardingStepsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OnboardingStepsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OnboardingStepsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OnboardingStepsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> stepNumber = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> iconKey = const Value.absent(),
                Value<bool> showPlatforms = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => OnboardingStepsCompanion(
                id: id,
                stepNumber: stepNumber,
                title: title,
                description: description,
                iconKey: iconKey,
                showPlatforms: showPlatforms,
                sortOrder: sortOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String stepNumber,
                required String title,
                required String description,
                required String iconKey,
                Value<bool> showPlatforms = const Value.absent(),
                required int sortOrder,
              }) => OnboardingStepsCompanion.insert(
                id: id,
                stepNumber: stepNumber,
                title: title,
                description: description,
                iconKey: iconKey,
                showPlatforms: showPlatforms,
                sortOrder: sortOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OnboardingStepsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OnboardingStepsTable,
      OnboardingStep,
      $$OnboardingStepsTableFilterComposer,
      $$OnboardingStepsTableOrderingComposer,
      $$OnboardingStepsTableAnnotationComposer,
      $$OnboardingStepsTableCreateCompanionBuilder,
      $$OnboardingStepsTableUpdateCompanionBuilder,
      (
        OnboardingStep,
        BaseReferences<_$AppDatabase, $OnboardingStepsTable, OnboardingStep>,
      ),
      OnboardingStep,
      PrefetchHooks Function()
    >;
typedef $$BrowserPlatformsTableCreateCompanionBuilder =
    BrowserPlatformsCompanion Function({
      Value<int> id,
      required String name,
      Value<String> iconKey,
      required int sortOrder,
    });
typedef $$BrowserPlatformsTableUpdateCompanionBuilder =
    BrowserPlatformsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> iconKey,
      Value<int> sortOrder,
    });

class $$BrowserPlatformsTableFilterComposer
    extends Composer<_$AppDatabase, $BrowserPlatformsTable> {
  $$BrowserPlatformsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconKey => $composableBuilder(
    column: $table.iconKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BrowserPlatformsTableOrderingComposer
    extends Composer<_$AppDatabase, $BrowserPlatformsTable> {
  $$BrowserPlatformsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconKey => $composableBuilder(
    column: $table.iconKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BrowserPlatformsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BrowserPlatformsTable> {
  $$BrowserPlatformsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get iconKey =>
      $composableBuilder(column: $table.iconKey, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$BrowserPlatformsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BrowserPlatformsTable,
          BrowserPlatform,
          $$BrowserPlatformsTableFilterComposer,
          $$BrowserPlatformsTableOrderingComposer,
          $$BrowserPlatformsTableAnnotationComposer,
          $$BrowserPlatformsTableCreateCompanionBuilder,
          $$BrowserPlatformsTableUpdateCompanionBuilder,
          (
            BrowserPlatform,
            BaseReferences<
              _$AppDatabase,
              $BrowserPlatformsTable,
              BrowserPlatform
            >,
          ),
          BrowserPlatform,
          PrefetchHooks Function()
        > {
  $$BrowserPlatformsTableTableManager(
    _$AppDatabase db,
    $BrowserPlatformsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BrowserPlatformsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BrowserPlatformsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BrowserPlatformsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> iconKey = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
              }) => BrowserPlatformsCompanion(
                id: id,
                name: name,
                iconKey: iconKey,
                sortOrder: sortOrder,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String> iconKey = const Value.absent(),
                required int sortOrder,
              }) => BrowserPlatformsCompanion.insert(
                id: id,
                name: name,
                iconKey: iconKey,
                sortOrder: sortOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BrowserPlatformsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BrowserPlatformsTable,
      BrowserPlatform,
      $$BrowserPlatformsTableFilterComposer,
      $$BrowserPlatformsTableOrderingComposer,
      $$BrowserPlatformsTableAnnotationComposer,
      $$BrowserPlatformsTableCreateCompanionBuilder,
      $$BrowserPlatformsTableUpdateCompanionBuilder,
      (
        BrowserPlatform,
        BaseReferences<_$AppDatabase, $BrowserPlatformsTable, BrowserPlatform>,
      ),
      BrowserPlatform,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LinksTableTableManager get links =>
      $$LinksTableTableManager(_db, _db.links);
  $$LinkPreviewsTableTableManager get linkPreviews =>
      $$LinkPreviewsTableTableManager(_db, _db.linkPreviews);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$LinkTagsTableTableManager get linkTags =>
      $$LinkTagsTableTableManager(_db, _db.linkTags);
  $$CollectionsTableTableManager get collections =>
      $$CollectionsTableTableManager(_db, _db.collections);
  $$CollectionLinksTableTableManager get collectionLinks =>
      $$CollectionLinksTableTableManager(_db, _db.collectionLinks);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$ProfileMetricsTableTableManager get profileMetrics =>
      $$ProfileMetricsTableTableManager(_db, _db.profileMetrics);
  $$SettingItemsTableTableManager get settingItems =>
      $$SettingItemsTableTableManager(_db, _db.settingItems);
  $$OnboardingStepsTableTableManager get onboardingSteps =>
      $$OnboardingStepsTableTableManager(_db, _db.onboardingSteps);
  $$BrowserPlatformsTableTableManager get browserPlatforms =>
      $$BrowserPlatformsTableTableManager(_db, _db.browserPlatforms);
}
