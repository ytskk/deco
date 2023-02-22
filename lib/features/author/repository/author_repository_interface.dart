import 'package:dev_community/features/articles/articles.dart';
import 'package:dev_community/features/author/author.dart';

abstract class AuthorRepositoryInterface {
  Future<AuthorInfoModel> getAuthorByUsername(String username);
  Future<List<ArticleQuickInfoModel>> getArticlesByUsername({
    required String username,
    int page = 1,
    bool isOrganization = false,
  });

  /// Get organization's team members.
  ///
  /// Does not support pagination.
  ///
  /// By default, it returns maximum 100 members.
  Future<List<UserModel>> getOrganizationMembers({
    required String organizationName,
  });
}
