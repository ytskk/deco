/// {@template article_details_table_of_content_map}
/// Stores the table of content heading items like a map.
/// {@endtemplate}
class ArticleDetailsTableOfContentMap {
  /// {@macro article_details_table_of_content_map}
  const ArticleDetailsTableOfContentMap({
    this.h2 = const [],
    this.h3 = const [],
    this.h4 = const [],
  });

  /// Represents the h2 heading items.
  final List<String> h2;

  /// Represents the h3 heading items.
  final List<String> h3;

  /// Represents the h4 heading items.
  final List<String> h4;

  /// Returns a new instance of [ArticleDetailsTableOfContentMap] with the
  /// added a new [values] to [heading].
  ///
  /// Uses [copyWith].
  ArticleDetailsTableOfContentMap copyWithNewValuesTo(
    String heading,
    List<String> values,
  ) {
    switch (heading) {
      case 'h2':
        return copyWith(h2: [...h2, ...values]);
      case 'h3':
        return copyWith(h3: [...h3, ...values]);
      case 'h4':
        return copyWith(h4: [...h4, ...values]);
      default:
        return this;
    }
  }

  /// Returns a new instance of [ArticleDetailsTableOfContentMap] with the
  /// new headings values if provided.
  ArticleDetailsTableOfContentMap copyWith({
    List<String>? h2,
    List<String>? h3,
    List<String>? h4,
  }) {
    return ArticleDetailsTableOfContentMap(
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      h4: h4 ?? this.h4,
    );
  }

  @override
  String toString() {
    return 'ArticleDetailsTableOfContentMap(h2: $h2, h3: $h3, h4: $h4)';
  }
}
