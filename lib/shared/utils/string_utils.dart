import 'package:jiffy/jiffy.dart';

extension StringExtension on String {
  String toCapitalized() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

/// Returns null if the string is empty.
///
/// Useful to next manipulations.
String? nullIfEmptyString(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return value;
}

abstract class StringUtils {
  static String joinBy(
    List<String> text, {
    String separator = ' ',
  }) {
    return text.join(separator);
  }

  /// Returns a relative date string for the given [date].
  ///
  /// For example, if the [date] is less then 30 day ago, it will return
  /// a string like day and time ago (Sep 23 (4 hours ago)).
  ///
  /// Else it will return just a day (Sep 23).
  ///
  /// If the [date] in another year, returns full date (Sep 23, 2022).
  static String relativeDate(DateTime date) {
    // if article is published in last years, show full date.
    if (date.year != DateTime.now().year) {
      return Jiffy(date).format('MMM d, yyyy');
    }

    final articlePublishAgeInDays = DateTime.now().difference(date).inDays;

    if (articlePublishAgeInDays < 30) {
      return '${Jiffy(date).format('MMM d')} (${Jiffy(date).fromNow().toCapitalized()})';
    }

    return Jiffy(date).format('MMM d');
  }

  static String formatDate(
    DateTime date, {
    String format = 'MMM d, yyyy',
  }) {
    return Jiffy(date).format(format);
  }

  /// Returns author string, author will always contain [userName], if
  /// [organizationName] is not null, it will be added to the string and
  /// separated with [separator].
  static String prepareAuthors({
    required String userName,
    String? organizationName,
    String separator = ' for ',
  }) {
    if (organizationName != null) {
      return StringUtils.joinBy(
        [
          userName,
          organizationName,
        ],
        separator: separator,
      );
    }

    return userName;
  }
}
