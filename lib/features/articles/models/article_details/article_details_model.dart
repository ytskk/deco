import 'package:dev_community/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_details_model.freezed.dart';
part 'article_details_model.g.dart';

@freezed
class ArticleDetailsModel with _$ArticleDetailsModel {
  const factory ArticleDetailsModel({
    required int id,
    required String title,
    required String description,
    @JsonKey(name: 'readable_publish_date') required String readablePublishDate,
    required String url,
    required String slug,
    required String path,
    @JsonKey(name: 'comments_count') required int commentsCount,
    @JsonKey(name: 'public_reactions_count') required int publicReactionsCount,
    @JsonKey(name: 'collection_id') int? collectionId,
    @JsonKey(name: 'positive_reactions_count')
        required int positiveReactionsCount,
    @JsonKey(name: 'cover_image') String? coverImage,
    @JsonKey(name: 'canonical_url') String? canonicalUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'reading_time_minutes') required int readingTimeMinutes,
    @JsonKey(name: 'tags') List<String>? tags,
    @JsonKey(name: 'user') required UserQuickInfoModel user,
    @JsonKey(name: 'body_html') required String bodyHtml,
    @JsonKey(name: 'body_markdown') required String bodyMarkdown,
    OrganizationQuickInfoModel? organization,
  }) = _ArticleDetailsModel;

  factory ArticleDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleDetailsModelFromJson(json);
}
