import 'package:dev_community/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_card_model.freezed.dart';
part 'article_card_model.g.dart';

@freezed
class ArticleCardModel with _$ArticleCardModel {
  const factory ArticleCardModel({
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
    @JsonKey(name: 'tag_list') List<String>? tags,
    @JsonKey(name: 'user') required UserQuickInfoModel user,
    OrganizationQuickInfoModel? organization,
  }) = _ArticleCardModel;

  factory ArticleCardModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleCardModelFromJson(json);

  factory ArticleCardModel.fromDetails(ArticleDetailsModel articleDetails) {
    return ArticleCardModel(
      id: articleDetails.id,
      title: articleDetails.title,
      description: articleDetails.description,
      readablePublishDate: articleDetails.readablePublishDate,
      url: articleDetails.url,
      slug: articleDetails.slug,
      path: articleDetails.path,
      commentsCount: articleDetails.commentsCount,
      publicReactionsCount: articleDetails.publicReactionsCount,
      collectionId: articleDetails.collectionId,
      positiveReactionsCount: articleDetails.positiveReactionsCount,
      coverImage: articleDetails.coverImage,
      canonicalUrl: articleDetails.canonicalUrl,
      createdAt: articleDetails.createdAt,
      readingTimeMinutes: articleDetails.readingTimeMinutes,
      tags: articleDetails.tags,
      user: articleDetails.user,
      organization: articleDetails.organization,
    );
  }
}
