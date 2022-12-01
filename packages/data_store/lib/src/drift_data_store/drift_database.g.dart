// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class User extends DataClass implements Insertable<User> {
  /// Article id as primary key
  final int id;
  final String name;
  final String username;
  final String profileImage;
  const User(
      {required this.id,
      required this.name,
      required this.username,
      required this.profileImage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['username'] = Variable<String>(username);
    map['profile_image'] = Variable<String>(profileImage);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      username: Value(username),
      profileImage: Value(profileImage),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      username: serializer.fromJson<String>(json['username']),
      profileImage: serializer.fromJson<String>(json['profileImage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'username': serializer.toJson<String>(username),
      'profileImage': serializer.toJson<String>(profileImage),
    };
  }

  User copyWith(
          {int? id, String? name, String? username, String? profileImage}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        profileImage: profileImage ?? this.profileImage,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('profileImage: $profileImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, username, profileImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.username == this.username &&
          other.profileImage == this.profileImage);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> username;
  final Value<String> profileImage;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.username = const Value.absent(),
    this.profileImage = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String username,
    required String profileImage,
  })  : name = Value(name),
        username = Value(username),
        profileImage = Value(profileImage);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? username,
    Expression<String>? profileImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (username != null) 'username': username,
      if (profileImage != null) 'profile_image': profileImage,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? username,
      Value<String>? profileImage}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      profileImage: profileImage ?? this.profileImage,
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
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (profileImage.present) {
      map['profile_image'] = Variable<String>(profileImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('profileImage: $profileImage')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profileImageMeta =
      const VerificationMeta('profileImage');
  @override
  late final GeneratedColumn<String> profileImage = GeneratedColumn<String>(
      'profile_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, username, profileImage];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('profile_image')) {
      context.handle(
          _profileImageMeta,
          profileImage.isAcceptableOrUnknown(
              data['profile_image']!, _profileImageMeta));
    } else if (isInserting) {
      context.missing(_profileImageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      profileImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_image'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class Organization extends DataClass implements Insertable<Organization> {
  final String id;
  final String name;
  final String username;
  final String profileImage;
  const Organization(
      {required this.id,
      required this.name,
      required this.username,
      required this.profileImage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['username'] = Variable<String>(username);
    map['profile_image'] = Variable<String>(profileImage);
    return map;
  }

  OrganizationsCompanion toCompanion(bool nullToAbsent) {
    return OrganizationsCompanion(
      id: Value(id),
      name: Value(name),
      username: Value(username),
      profileImage: Value(profileImage),
    );
  }

  factory Organization.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Organization(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      username: serializer.fromJson<String>(json['username']),
      profileImage: serializer.fromJson<String>(json['profileImage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'username': serializer.toJson<String>(username),
      'profileImage': serializer.toJson<String>(profileImage),
    };
  }

  Organization copyWith(
          {String? id, String? name, String? username, String? profileImage}) =>
      Organization(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        profileImage: profileImage ?? this.profileImage,
      );
  @override
  String toString() {
    return (StringBuffer('Organization(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('profileImage: $profileImage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, username, profileImage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Organization &&
          other.id == this.id &&
          other.name == this.name &&
          other.username == this.username &&
          other.profileImage == this.profileImage);
}

class OrganizationsCompanion extends UpdateCompanion<Organization> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> username;
  final Value<String> profileImage;
  const OrganizationsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.username = const Value.absent(),
    this.profileImage = const Value.absent(),
  });
  OrganizationsCompanion.insert({
    required String id,
    required String name,
    required String username,
    required String profileImage,
  })  : id = Value(id),
        name = Value(name),
        username = Value(username),
        profileImage = Value(profileImage);
  static Insertable<Organization> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? username,
    Expression<String>? profileImage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (username != null) 'username': username,
      if (profileImage != null) 'profile_image': profileImage,
    });
  }

  OrganizationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? username,
      Value<String>? profileImage}) {
    return OrganizationsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (profileImage.present) {
      map['profile_image'] = Variable<String>(profileImage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrganizationsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('profileImage: $profileImage')
          ..write(')'))
        .toString();
  }
}

class $OrganizationsTable extends Organizations
    with TableInfo<$OrganizationsTable, Organization> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrganizationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profileImageMeta =
      const VerificationMeta('profileImage');
  @override
  late final GeneratedColumn<String> profileImage = GeneratedColumn<String>(
      'profile_image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, username, profileImage];
  @override
  String get aliasedName => _alias ?? 'organizations';
  @override
  String get actualTableName => 'organizations';
  @override
  VerificationContext validateIntegrity(Insertable<Organization> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('profile_image')) {
      context.handle(
          _profileImageMeta,
          profileImage.isAcceptableOrUnknown(
              data['profile_image']!, _profileImageMeta));
    } else if (isInserting) {
      context.missing(_profileImageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Organization map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Organization(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      profileImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_image'])!,
    );
  }

  @override
  $OrganizationsTable createAlias(String alias) {
    return $OrganizationsTable(attachedDatabase, alias);
  }
}

class Article extends DataClass implements Insertable<Article> {
  /// Article id as primary key
  final int id;
  final String title;

  /// Article content in markdown.
  final String content;
  final String? coverImage;
  final DateTime createdAt;
  final int readingTimeMinutes;
  final List<String>? tags;
  final int authorUserId;
  final String? authorOrganizationId;
  final bool isRead;
  final DateTime? readAt;
  final String url;
  final String path;
  const Article(
      {required this.id,
      required this.title,
      required this.content,
      this.coverImage,
      required this.createdAt,
      required this.readingTimeMinutes,
      this.tags,
      required this.authorUserId,
      this.authorOrganizationId,
      required this.isRead,
      this.readAt,
      required this.url,
      required this.path});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || coverImage != null) {
      map['cover_image'] = Variable<String>(coverImage);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['reading_time_minutes'] = Variable<int>(readingTimeMinutes);
    if (!nullToAbsent || tags != null) {
      final converter = $ArticlesTable.$convertertagsn;
      map['tags'] = Variable<String>(converter.toSql(tags));
    }
    map['author_user_id'] = Variable<int>(authorUserId);
    if (!nullToAbsent || authorOrganizationId != null) {
      map['author_organization_id'] = Variable<String>(authorOrganizationId);
    }
    map['is_read'] = Variable<bool>(isRead);
    if (!nullToAbsent || readAt != null) {
      map['read_at'] = Variable<DateTime>(readAt);
    }
    map['url'] = Variable<String>(url);
    map['path'] = Variable<String>(path);
    return map;
  }

  ArticlesCompanion toCompanion(bool nullToAbsent) {
    return ArticlesCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      coverImage: coverImage == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImage),
      createdAt: Value(createdAt),
      readingTimeMinutes: Value(readingTimeMinutes),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      authorUserId: Value(authorUserId),
      authorOrganizationId: authorOrganizationId == null && nullToAbsent
          ? const Value.absent()
          : Value(authorOrganizationId),
      isRead: Value(isRead),
      readAt:
          readAt == null && nullToAbsent ? const Value.absent() : Value(readAt),
      url: Value(url),
      path: Value(path),
    );
  }

  factory Article.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Article(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      coverImage: serializer.fromJson<String?>(json['coverImage']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      readingTimeMinutes: serializer.fromJson<int>(json['readingTimeMinutes']),
      tags: serializer.fromJson<List<String>?>(json['tags']),
      authorUserId: serializer.fromJson<int>(json['authorUserId']),
      authorOrganizationId:
          serializer.fromJson<String?>(json['authorOrganizationId']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      readAt: serializer.fromJson<DateTime?>(json['readAt']),
      url: serializer.fromJson<String>(json['url']),
      path: serializer.fromJson<String>(json['path']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'coverImage': serializer.toJson<String?>(coverImage),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'readingTimeMinutes': serializer.toJson<int>(readingTimeMinutes),
      'tags': serializer.toJson<List<String>?>(tags),
      'authorUserId': serializer.toJson<int>(authorUserId),
      'authorOrganizationId': serializer.toJson<String?>(authorOrganizationId),
      'isRead': serializer.toJson<bool>(isRead),
      'readAt': serializer.toJson<DateTime?>(readAt),
      'url': serializer.toJson<String>(url),
      'path': serializer.toJson<String>(path),
    };
  }

  Article copyWith(
          {int? id,
          String? title,
          String? content,
          Value<String?> coverImage = const Value.absent(),
          DateTime? createdAt,
          int? readingTimeMinutes,
          Value<List<String>?> tags = const Value.absent(),
          int? authorUserId,
          Value<String?> authorOrganizationId = const Value.absent(),
          bool? isRead,
          Value<DateTime?> readAt = const Value.absent(),
          String? url,
          String? path}) =>
      Article(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        coverImage: coverImage.present ? coverImage.value : this.coverImage,
        createdAt: createdAt ?? this.createdAt,
        readingTimeMinutes: readingTimeMinutes ?? this.readingTimeMinutes,
        tags: tags.present ? tags.value : this.tags,
        authorUserId: authorUserId ?? this.authorUserId,
        authorOrganizationId: authorOrganizationId.present
            ? authorOrganizationId.value
            : this.authorOrganizationId,
        isRead: isRead ?? this.isRead,
        readAt: readAt.present ? readAt.value : this.readAt,
        url: url ?? this.url,
        path: path ?? this.path,
      );
  @override
  String toString() {
    return (StringBuffer('Article(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('coverImage: $coverImage, ')
          ..write('createdAt: $createdAt, ')
          ..write('readingTimeMinutes: $readingTimeMinutes, ')
          ..write('tags: $tags, ')
          ..write('authorUserId: $authorUserId, ')
          ..write('authorOrganizationId: $authorOrganizationId, ')
          ..write('isRead: $isRead, ')
          ..write('readAt: $readAt, ')
          ..write('url: $url, ')
          ..write('path: $path')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      title,
      content,
      coverImage,
      createdAt,
      readingTimeMinutes,
      tags,
      authorUserId,
      authorOrganizationId,
      isRead,
      readAt,
      url,
      path);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Article &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.coverImage == this.coverImage &&
          other.createdAt == this.createdAt &&
          other.readingTimeMinutes == this.readingTimeMinutes &&
          other.tags == this.tags &&
          other.authorUserId == this.authorUserId &&
          other.authorOrganizationId == this.authorOrganizationId &&
          other.isRead == this.isRead &&
          other.readAt == this.readAt &&
          other.url == this.url &&
          other.path == this.path);
}

class ArticlesCompanion extends UpdateCompanion<Article> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<String?> coverImage;
  final Value<DateTime> createdAt;
  final Value<int> readingTimeMinutes;
  final Value<List<String>?> tags;
  final Value<int> authorUserId;
  final Value<String?> authorOrganizationId;
  final Value<bool> isRead;
  final Value<DateTime?> readAt;
  final Value<String> url;
  final Value<String> path;
  const ArticlesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.coverImage = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.readingTimeMinutes = const Value.absent(),
    this.tags = const Value.absent(),
    this.authorUserId = const Value.absent(),
    this.authorOrganizationId = const Value.absent(),
    this.isRead = const Value.absent(),
    this.readAt = const Value.absent(),
    this.url = const Value.absent(),
    this.path = const Value.absent(),
  });
  ArticlesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    this.coverImage = const Value.absent(),
    required DateTime createdAt,
    required int readingTimeMinutes,
    this.tags = const Value.absent(),
    required int authorUserId,
    this.authorOrganizationId = const Value.absent(),
    this.isRead = const Value.absent(),
    this.readAt = const Value.absent(),
    required String url,
    required String path,
  })  : title = Value(title),
        content = Value(content),
        createdAt = Value(createdAt),
        readingTimeMinutes = Value(readingTimeMinutes),
        authorUserId = Value(authorUserId),
        url = Value(url),
        path = Value(path);
  static Insertable<Article> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? coverImage,
    Expression<DateTime>? createdAt,
    Expression<int>? readingTimeMinutes,
    Expression<String>? tags,
    Expression<int>? authorUserId,
    Expression<String>? authorOrganizationId,
    Expression<bool>? isRead,
    Expression<DateTime>? readAt,
    Expression<String>? url,
    Expression<String>? path,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (coverImage != null) 'cover_image': coverImage,
      if (createdAt != null) 'created_at': createdAt,
      if (readingTimeMinutes != null)
        'reading_time_minutes': readingTimeMinutes,
      if (tags != null) 'tags': tags,
      if (authorUserId != null) 'author_user_id': authorUserId,
      if (authorOrganizationId != null)
        'author_organization_id': authorOrganizationId,
      if (isRead != null) 'is_read': isRead,
      if (readAt != null) 'read_at': readAt,
      if (url != null) 'url': url,
      if (path != null) 'path': path,
    });
  }

  ArticlesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<String?>? coverImage,
      Value<DateTime>? createdAt,
      Value<int>? readingTimeMinutes,
      Value<List<String>?>? tags,
      Value<int>? authorUserId,
      Value<String?>? authorOrganizationId,
      Value<bool>? isRead,
      Value<DateTime?>? readAt,
      Value<String>? url,
      Value<String>? path}) {
    return ArticlesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      coverImage: coverImage ?? this.coverImage,
      createdAt: createdAt ?? this.createdAt,
      readingTimeMinutes: readingTimeMinutes ?? this.readingTimeMinutes,
      tags: tags ?? this.tags,
      authorUserId: authorUserId ?? this.authorUserId,
      authorOrganizationId: authorOrganizationId ?? this.authorOrganizationId,
      isRead: isRead ?? this.isRead,
      readAt: readAt ?? this.readAt,
      url: url ?? this.url,
      path: path ?? this.path,
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
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (coverImage.present) {
      map['cover_image'] = Variable<String>(coverImage.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (readingTimeMinutes.present) {
      map['reading_time_minutes'] = Variable<int>(readingTimeMinutes.value);
    }
    if (tags.present) {
      final converter = $ArticlesTable.$convertertagsn;
      map['tags'] = Variable<String>(converter.toSql(tags.value));
    }
    if (authorUserId.present) {
      map['author_user_id'] = Variable<int>(authorUserId.value);
    }
    if (authorOrganizationId.present) {
      map['author_organization_id'] =
          Variable<String>(authorOrganizationId.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (readAt.present) {
      map['read_at'] = Variable<DateTime>(readAt.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('coverImage: $coverImage, ')
          ..write('createdAt: $createdAt, ')
          ..write('readingTimeMinutes: $readingTimeMinutes, ')
          ..write('tags: $tags, ')
          ..write('authorUserId: $authorUserId, ')
          ..write('authorOrganizationId: $authorOrganizationId, ')
          ..write('isRead: $isRead, ')
          ..write('readAt: $readAt, ')
          ..write('url: $url, ')
          ..write('path: $path')
          ..write(')'))
        .toString();
  }
}

class $ArticlesTable extends Articles with TableInfo<$ArticlesTable, Article> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _coverImageMeta =
      const VerificationMeta('coverImage');
  @override
  late final GeneratedColumn<String> coverImage = GeneratedColumn<String>(
      'cover_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _readingTimeMinutesMeta =
      const VerificationMeta('readingTimeMinutes');
  @override
  late final GeneratedColumn<int> readingTimeMinutes = GeneratedColumn<int>(
      'reading_time_minutes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> tags =
      GeneratedColumn<String>('tags', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<List<String>?>($ArticlesTable.$convertertagsn);
  static const VerificationMeta _authorUserIdMeta =
      const VerificationMeta('authorUserId');
  @override
  late final GeneratedColumn<int> authorUserId = GeneratedColumn<int>(
      'author_user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  static const VerificationMeta _authorOrganizationIdMeta =
      const VerificationMeta('authorOrganizationId');
  @override
  late final GeneratedColumn<String> authorOrganizationId = GeneratedColumn<
          String>('author_organization_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES organizations (id)'));
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead =
      GeneratedColumn<bool>('is_read', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_read" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _readAtMeta = const VerificationMeta('readAt');
  @override
  late final GeneratedColumn<DateTime> readAt = GeneratedColumn<DateTime>(
      'read_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        content,
        coverImage,
        createdAt,
        readingTimeMinutes,
        tags,
        authorUserId,
        authorOrganizationId,
        isRead,
        readAt,
        url,
        path
      ];
  @override
  String get aliasedName => _alias ?? 'articles';
  @override
  String get actualTableName => 'articles';
  @override
  VerificationContext validateIntegrity(Insertable<Article> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('cover_image')) {
      context.handle(
          _coverImageMeta,
          coverImage.isAcceptableOrUnknown(
              data['cover_image']!, _coverImageMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('reading_time_minutes')) {
      context.handle(
          _readingTimeMinutesMeta,
          readingTimeMinutes.isAcceptableOrUnknown(
              data['reading_time_minutes']!, _readingTimeMinutesMeta));
    } else if (isInserting) {
      context.missing(_readingTimeMinutesMeta);
    }
    context.handle(_tagsMeta, const VerificationResult.success());
    if (data.containsKey('author_user_id')) {
      context.handle(
          _authorUserIdMeta,
          authorUserId.isAcceptableOrUnknown(
              data['author_user_id']!, _authorUserIdMeta));
    } else if (isInserting) {
      context.missing(_authorUserIdMeta);
    }
    if (data.containsKey('author_organization_id')) {
      context.handle(
          _authorOrganizationIdMeta,
          authorOrganizationId.isAcceptableOrUnknown(
              data['author_organization_id']!, _authorOrganizationIdMeta));
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    }
    if (data.containsKey('read_at')) {
      context.handle(_readAtMeta,
          readAt.isAcceptableOrUnknown(data['read_at']!, _readAtMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Article map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Article(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      coverImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cover_image']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      readingTimeMinutes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}reading_time_minutes'])!,
      tags: $ArticlesTable.$convertertagsn.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])),
      authorUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}author_user_id'])!,
      authorOrganizationId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}author_organization_id']),
      isRead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_read'])!,
      readAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}read_at']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path'])!,
    );
  }

  @override
  $ArticlesTable createAlias(String alias) {
    return $ArticlesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertertags =
      const StringListConverter();
  static TypeConverter<List<String>?, String?> $convertertagsn =
      NullAwareTypeConverter.wrap($convertertags);
}

abstract class _$DriftDataStore extends GeneratedDatabase {
  _$DriftDataStore(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  late final $OrganizationsTable organizations = $OrganizationsTable(this);
  late final $ArticlesTable articles = $ArticlesTable(this);
  late final DriftArticlesDao driftArticlesDao =
      DriftArticlesDao(this as DriftDataStore);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, organizations, articles];
}
