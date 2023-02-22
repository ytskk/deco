// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_quick_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticleQuickInfoModel _$$_ArticleQuickInfoModelFromJson(
        Map<String, dynamic> json) =>
    _$_ArticleQuickInfoModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      readablePublishDate: json['readable_publish_date'] as String,
      url: json['url'] as String,
      slug: json['slug'] as String,
      path: json['path'] as String,
      commentsCount: json['comments_count'] as int,
      publicReactionsCount: json['public_reactions_count'] as int,
      collectionId: json['collection_id'] as int?,
      positiveReactionsCount: json['positive_reactions_count'] as int,
      coverImage: json['cover_image'] as String?,
      canonicalUrl: json['canonical_url'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      readingTimeMinutes: json['reading_time_minutes'] as int,
      tags: (json['tag_list'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      user: UserQuickInfoModel.fromJson(json['user'] as Map<String, dynamic>),
      organization: json['organization'] == null
          ? null
          : OrganizationQuickInfoModel.fromJson(
              json['organization'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ArticleQuickInfoModelToJson(
        _$_ArticleQuickInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'readable_publish_date': instance.readablePublishDate,
      'url': instance.url,
      'slug': instance.slug,
      'path': instance.path,
      'comments_count': instance.commentsCount,
      'public_reactions_count': instance.publicReactionsCount,
      'collection_id': instance.collectionId,
      'positive_reactions_count': instance.positiveReactionsCount,
      'cover_image': instance.coverImage,
      'canonical_url': instance.canonicalUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'reading_time_minutes': instance.readingTimeMinutes,
      'tag_list': instance.tags,
      'user': instance.user,
      'organization': instance.organization,
    };
