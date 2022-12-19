// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_quick_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticleQuickInfoModel _$ArticleQuickInfoModelFromJson(
    Map<String, dynamic> json) {
  return _ArticleQuickInfoModel.fromJson(json);
}

/// @nodoc
mixin _$ArticleQuickInfoModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'readable_publish_date')
  String get readablePublishDate => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments_count')
  int get commentsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'public_reactions_count')
  int get publicReactionsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'collection_id')
  int? get collectionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'positive_reactions_count')
  int get positiveReactionsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_image')
  String? get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'canonical_url')
  String? get canonicalUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'reading_time_minutes')
  int get readingTimeMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag_list')
  List<String>? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserQuickInfoModel get user => throw _privateConstructorUsedError;
  OrganizationQuickInfoModel? get organization =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleQuickInfoModelCopyWith<ArticleQuickInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleQuickInfoModelCopyWith<$Res> {
  factory $ArticleQuickInfoModelCopyWith(ArticleQuickInfoModel value,
          $Res Function(ArticleQuickInfoModel) then) =
      _$ArticleQuickInfoModelCopyWithImpl<$Res, ArticleQuickInfoModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      @JsonKey(name: 'readable_publish_date') String readablePublishDate,
      String url,
      String slug,
      String path,
      @JsonKey(name: 'comments_count') int commentsCount,
      @JsonKey(name: 'public_reactions_count') int publicReactionsCount,
      @JsonKey(name: 'collection_id') int? collectionId,
      @JsonKey(name: 'positive_reactions_count') int positiveReactionsCount,
      @JsonKey(name: 'cover_image') String? coverImage,
      @JsonKey(name: 'canonical_url') String? canonicalUrl,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'reading_time_minutes') int readingTimeMinutes,
      @JsonKey(name: 'tag_list') List<String>? tags,
      @JsonKey(name: 'user') UserQuickInfoModel user,
      OrganizationQuickInfoModel? organization});

  $UserQuickInfoModelCopyWith<$Res> get user;
  $OrganizationQuickInfoModelCopyWith<$Res>? get organization;
}

/// @nodoc
class _$ArticleQuickInfoModelCopyWithImpl<$Res,
        $Val extends ArticleQuickInfoModel>
    implements $ArticleQuickInfoModelCopyWith<$Res> {
  _$ArticleQuickInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? readablePublishDate = null,
    Object? url = null,
    Object? slug = null,
    Object? path = null,
    Object? commentsCount = null,
    Object? publicReactionsCount = null,
    Object? collectionId = freezed,
    Object? positiveReactionsCount = null,
    Object? coverImage = freezed,
    Object? canonicalUrl = freezed,
    Object? createdAt = null,
    Object? readingTimeMinutes = null,
    Object? tags = freezed,
    Object? user = null,
    Object? organization = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      readablePublishDate: null == readablePublishDate
          ? _value.readablePublishDate
          : readablePublishDate // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      publicReactionsCount: null == publicReactionsCount
          ? _value.publicReactionsCount
          : publicReactionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      collectionId: freezed == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      positiveReactionsCount: null == positiveReactionsCount
          ? _value.positiveReactionsCount
          : positiveReactionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      canonicalUrl: freezed == canonicalUrl
          ? _value.canonicalUrl
          : canonicalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      readingTimeMinutes: null == readingTimeMinutes
          ? _value.readingTimeMinutes
          : readingTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserQuickInfoModel,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as OrganizationQuickInfoModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserQuickInfoModelCopyWith<$Res> get user {
    return $UserQuickInfoModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrganizationQuickInfoModelCopyWith<$Res>? get organization {
    if (_value.organization == null) {
      return null;
    }

    return $OrganizationQuickInfoModelCopyWith<$Res>(_value.organization!,
        (value) {
      return _then(_value.copyWith(organization: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ArticleQuickInfoModelCopyWith<$Res>
    implements $ArticleQuickInfoModelCopyWith<$Res> {
  factory _$$_ArticleQuickInfoModelCopyWith(_$_ArticleQuickInfoModel value,
          $Res Function(_$_ArticleQuickInfoModel) then) =
      __$$_ArticleQuickInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      @JsonKey(name: 'readable_publish_date') String readablePublishDate,
      String url,
      String slug,
      String path,
      @JsonKey(name: 'comments_count') int commentsCount,
      @JsonKey(name: 'public_reactions_count') int publicReactionsCount,
      @JsonKey(name: 'collection_id') int? collectionId,
      @JsonKey(name: 'positive_reactions_count') int positiveReactionsCount,
      @JsonKey(name: 'cover_image') String? coverImage,
      @JsonKey(name: 'canonical_url') String? canonicalUrl,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'reading_time_minutes') int readingTimeMinutes,
      @JsonKey(name: 'tag_list') List<String>? tags,
      @JsonKey(name: 'user') UserQuickInfoModel user,
      OrganizationQuickInfoModel? organization});

  @override
  $UserQuickInfoModelCopyWith<$Res> get user;
  @override
  $OrganizationQuickInfoModelCopyWith<$Res>? get organization;
}

/// @nodoc
class __$$_ArticleQuickInfoModelCopyWithImpl<$Res>
    extends _$ArticleQuickInfoModelCopyWithImpl<$Res, _$_ArticleQuickInfoModel>
    implements _$$_ArticleQuickInfoModelCopyWith<$Res> {
  __$$_ArticleQuickInfoModelCopyWithImpl(_$_ArticleQuickInfoModel _value,
      $Res Function(_$_ArticleQuickInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? readablePublishDate = null,
    Object? url = null,
    Object? slug = null,
    Object? path = null,
    Object? commentsCount = null,
    Object? publicReactionsCount = null,
    Object? collectionId = freezed,
    Object? positiveReactionsCount = null,
    Object? coverImage = freezed,
    Object? canonicalUrl = freezed,
    Object? createdAt = null,
    Object? readingTimeMinutes = null,
    Object? tags = freezed,
    Object? user = null,
    Object? organization = freezed,
  }) {
    return _then(_$_ArticleQuickInfoModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      readablePublishDate: null == readablePublishDate
          ? _value.readablePublishDate
          : readablePublishDate // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      publicReactionsCount: null == publicReactionsCount
          ? _value.publicReactionsCount
          : publicReactionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      collectionId: freezed == collectionId
          ? _value.collectionId
          : collectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      positiveReactionsCount: null == positiveReactionsCount
          ? _value.positiveReactionsCount
          : positiveReactionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      canonicalUrl: freezed == canonicalUrl
          ? _value.canonicalUrl
          : canonicalUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      readingTimeMinutes: null == readingTimeMinutes
          ? _value.readingTimeMinutes
          : readingTimeMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserQuickInfoModel,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as OrganizationQuickInfoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ArticleQuickInfoModel implements _ArticleQuickInfoModel {
  const _$_ArticleQuickInfoModel(
      {required this.id,
      required this.title,
      required this.description,
      @JsonKey(name: 'readable_publish_date')
          required this.readablePublishDate,
      required this.url,
      required this.slug,
      required this.path,
      @JsonKey(name: 'comments_count')
          required this.commentsCount,
      @JsonKey(name: 'public_reactions_count')
          required this.publicReactionsCount,
      @JsonKey(name: 'collection_id')
          this.collectionId,
      @JsonKey(name: 'positive_reactions_count')
          required this.positiveReactionsCount,
      @JsonKey(name: 'cover_image')
          this.coverImage,
      @JsonKey(name: 'canonical_url')
          this.canonicalUrl,
      @JsonKey(name: 'created_at')
          required this.createdAt,
      @JsonKey(name: 'reading_time_minutes')
          required this.readingTimeMinutes,
      @JsonKey(name: 'tag_list')
          final List<String>? tags,
      @JsonKey(name: 'user')
          required this.user,
      this.organization})
      : _tags = tags;

  factory _$_ArticleQuickInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_ArticleQuickInfoModelFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey(name: 'readable_publish_date')
  final String readablePublishDate;
  @override
  final String url;
  @override
  final String slug;
  @override
  final String path;
  @override
  @JsonKey(name: 'comments_count')
  final int commentsCount;
  @override
  @JsonKey(name: 'public_reactions_count')
  final int publicReactionsCount;
  @override
  @JsonKey(name: 'collection_id')
  final int? collectionId;
  @override
  @JsonKey(name: 'positive_reactions_count')
  final int positiveReactionsCount;
  @override
  @JsonKey(name: 'cover_image')
  final String? coverImage;
  @override
  @JsonKey(name: 'canonical_url')
  final String? canonicalUrl;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'reading_time_minutes')
  final int readingTimeMinutes;
  final List<String>? _tags;
  @override
  @JsonKey(name: 'tag_list')
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'user')
  final UserQuickInfoModel user;
  @override
  final OrganizationQuickInfoModel? organization;

  @override
  String toString() {
    return 'ArticleQuickInfoModel(id: $id, title: $title, description: $description, readablePublishDate: $readablePublishDate, url: $url, slug: $slug, path: $path, commentsCount: $commentsCount, publicReactionsCount: $publicReactionsCount, collectionId: $collectionId, positiveReactionsCount: $positiveReactionsCount, coverImage: $coverImage, canonicalUrl: $canonicalUrl, createdAt: $createdAt, readingTimeMinutes: $readingTimeMinutes, tags: $tags, user: $user, organization: $organization)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleQuickInfoModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.readablePublishDate, readablePublishDate) ||
                other.readablePublishDate == readablePublishDate) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.publicReactionsCount, publicReactionsCount) ||
                other.publicReactionsCount == publicReactionsCount) &&
            (identical(other.collectionId, collectionId) ||
                other.collectionId == collectionId) &&
            (identical(other.positiveReactionsCount, positiveReactionsCount) ||
                other.positiveReactionsCount == positiveReactionsCount) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.canonicalUrl, canonicalUrl) ||
                other.canonicalUrl == canonicalUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.readingTimeMinutes, readingTimeMinutes) ||
                other.readingTimeMinutes == readingTimeMinutes) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.organization, organization) ||
                other.organization == organization));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      readablePublishDate,
      url,
      slug,
      path,
      commentsCount,
      publicReactionsCount,
      collectionId,
      positiveReactionsCount,
      coverImage,
      canonicalUrl,
      createdAt,
      readingTimeMinutes,
      const DeepCollectionEquality().hash(_tags),
      user,
      organization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleQuickInfoModelCopyWith<_$_ArticleQuickInfoModel> get copyWith =>
      __$$_ArticleQuickInfoModelCopyWithImpl<_$_ArticleQuickInfoModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticleQuickInfoModelToJson(
      this,
    );
  }
}

abstract class _ArticleQuickInfoModel implements ArticleQuickInfoModel {
  const factory _ArticleQuickInfoModel(
          {required final int id,
          required final String title,
          required final String description,
          @JsonKey(name: 'readable_publish_date')
              required final String readablePublishDate,
          required final String url,
          required final String slug,
          required final String path,
          @JsonKey(name: 'comments_count')
              required final int commentsCount,
          @JsonKey(name: 'public_reactions_count')
              required final int publicReactionsCount,
          @JsonKey(name: 'collection_id')
              final int? collectionId,
          @JsonKey(name: 'positive_reactions_count')
              required final int positiveReactionsCount,
          @JsonKey(name: 'cover_image')
              final String? coverImage,
          @JsonKey(name: 'canonical_url')
              final String? canonicalUrl,
          @JsonKey(name: 'created_at')
              required final DateTime createdAt,
          @JsonKey(name: 'reading_time_minutes')
              required final int readingTimeMinutes,
          @JsonKey(name: 'tag_list')
              final List<String>? tags,
          @JsonKey(name: 'user')
              required final UserQuickInfoModel user,
          final OrganizationQuickInfoModel? organization}) =
      _$_ArticleQuickInfoModel;

  factory _ArticleQuickInfoModel.fromJson(Map<String, dynamic> json) =
      _$_ArticleQuickInfoModel.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'readable_publish_date')
  String get readablePublishDate;
  @override
  String get url;
  @override
  String get slug;
  @override
  String get path;
  @override
  @JsonKey(name: 'comments_count')
  int get commentsCount;
  @override
  @JsonKey(name: 'public_reactions_count')
  int get publicReactionsCount;
  @override
  @JsonKey(name: 'collection_id')
  int? get collectionId;
  @override
  @JsonKey(name: 'positive_reactions_count')
  int get positiveReactionsCount;
  @override
  @JsonKey(name: 'cover_image')
  String? get coverImage;
  @override
  @JsonKey(name: 'canonical_url')
  String? get canonicalUrl;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'reading_time_minutes')
  int get readingTimeMinutes;
  @override
  @JsonKey(name: 'tag_list')
  List<String>? get tags;
  @override
  @JsonKey(name: 'user')
  UserQuickInfoModel get user;
  @override
  OrganizationQuickInfoModel? get organization;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleQuickInfoModelCopyWith<_$_ArticleQuickInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
