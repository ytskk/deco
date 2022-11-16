abstract class ApiConstants {
  static const String baseUrl = 'https://dev.to/api/';
  static const String articles = 'articles';
  static const String articlesLatest = 'latest';
  static const String tags = 'tags';
  static const String userByUsername = 'users/by_username';
  static const String organizationByUsername = 'organizations';
  static String organizationMembers({
    required String organizationName,
  }) =>
      'organizations/$organizationName/users';
}
