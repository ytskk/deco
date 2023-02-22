import 'package:data_store/src/drift_data_store/drift_database.dart';

/// {@template author_with_model}
/// Data joined from articles, users and organizations tables.
/// {@endtemplate}
class ArticleWithAuthorModel {
  /// {@macro author_with_model}
  const ArticleWithAuthorModel({
    required this.article,
    required this.author,
    this.organization,
  });

  /// Represents article data.
  final Article article;

  /// Author of this article.
  final User author;

  /// Organization of this article (optional).
  final Organization? organization;
}
