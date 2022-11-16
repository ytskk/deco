// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ArticleDetailsModel _$$_ArticleDetailsModelFromJson(
        Map<String, dynamic> json) =>
    _$_ArticleDetailsModel(
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
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      user: UserQuickInfoModel.fromJson(json['user'] as Map<String, dynamic>),
      bodyHtml: json['body_html'] as String,
      bodyMarkdown: json['body_markdown'] as String,
      organization: json['organization'] == null
          ? null
          : OrganizationQuickInfoModel.fromJson(
              json['organization'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ArticleDetailsModelToJson(
        _$_ArticleDetailsModel instance) =>
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
      'tags': instance.tags,
      'user': instance.user,
      'body_html': instance.bodyHtml,
      'body_markdown': instance.bodyMarkdown,
      'organization': instance.organization,
    };
