enum TableOfContentHeadings { h2, h3, h4 }

/// {@template article_details_table_of_content_item}
/// A single item in the table of content.
/// {@endtemplate}
class ArticleDetailsTableOfContentItem {
  /// {@macro article_details_table_of_content_item}
  const ArticleDetailsTableOfContentItem({
    required this.heading,
    required this.title,
  });

  /// Heading level of the item.
  final TableOfContentHeadings heading;

  /// Title of the item.
  final String title;
}
