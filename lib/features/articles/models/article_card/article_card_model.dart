/// {@template article_card_model}
///
/// Model for article card widgets.
///
/// {@endtemplate}
class ArticleCardModel {
  /// {@macro article_card_model}
  const ArticleCardModel({
    required this.id,
    required this.authorId,
    this.organizationId,
    required this.title,
    this.coverImage,
    required this.authorsString,
    this.tags,
    required this.createdAt,
    this.positiveReactionsCount,
    this.commentsCount,
    required this.readingTimeMinutes,
    required this.url,
  });

  final int id;
  final int authorId;
  final String? organizationId;
  final String title;
  final String? coverImage;
  final String authorsString;
  final List<String>? tags;
  final DateTime createdAt;
  final int? positiveReactionsCount;
  final int? commentsCount;
  final int readingTimeMinutes;
  final String url;
}
