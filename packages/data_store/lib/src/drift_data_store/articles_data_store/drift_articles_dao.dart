import 'dart:developer';

import 'package:data_store/data_store.dart';
import 'package:drift/drift.dart';

part 'drift_articles_dao.g.dart';

@DriftAccessor(
  tables: [
    Articles,
    Users,
    Organizations,
  ],
)
class DriftArticlesDao extends DatabaseAccessor<DriftDataStore>
    with _$DriftArticlesDaoMixin, ArticlesDataStoreInterface {
  DriftArticlesDao(DriftDataStore db) : super(db);

  // CREATE
  @override
  Future<int> saveArticle(ArticleWithAuthorModel article) async {
    return transaction<int>(() async {
      log(
        'saving article ${article.article.title} coverImage:${article.article.coverImage}',
        name: 'DriftArticlesDao.saveArticle',
      );
      // put article
      final articleId = await into(articles).insert(
        article.article,
        mode: InsertMode.insertOrIgnore,
      );

      // put user
      await into(users).insert(
        article.author,
        mode: InsertMode.insertOrIgnore,
      );

      // put organization if not null
      if (article.organization != null) {
        await into(organizations).insert(
          article.organization!,
          mode: InsertMode.insertOrIgnore,
        );
      }

      return articleId;
    });
  }

  @override
  Future<int> createArticle(Article article) {
    return into(articles).insert(
      article,
      mode: InsertMode.insertOrReplace,
    );
  }

  @override
  Future<int> createUser(User user) {
    return into(users).insert(
      user,
      mode: InsertMode.insertOrReplace,
    );
  }

  // READ
  @override
  Stream<List<ArticleWithAuthorModel>> allSavedArticles() {
    final articleQuery = _buildArticleWithAuthorQuery();

    return _joinArticlesWithAuthor(articleQuery);
  }

  @override
  Stream<List<ArticleWithAuthorModel>> allReadArticles() {
    final articleQuery = _buildArticleWithAuthorQuery()
      ..where(articles.isRead.equals(true));

    return _joinArticlesWithAuthor(articleQuery);
  }

  @override
  Stream<List<ArticleWithAuthorModel>> allUnreadArticles() {
    final articleQuery = _buildArticleWithAuthorQuery()
      ..where(articles.isRead.equals(false));

    return _joinArticlesWithAuthor(articleQuery);
  }

  Future<List<ArticleWithAuthorModel>> allSavedArticlesList() async {
    final articleQuery = _buildArticleWithAuthorQuery();

    return _joinArticlesWithAuthorToList(articleQuery);
  }

  @override
  Stream<bool> isArticleSaved(int articleId) {
    return (select(articles)..where((a) => a.id.equals(articleId)))
        .watchSingleOrNull()
        .map((a) => a != null);
  }

  @override
  Stream<bool> isArticleRead(int articleId) {
    return (select(articles)..where((a) => a.id.equals(articleId)))
        .watchSingleOrNull()
        .map((a) => a?.isRead ?? false);
  }

  @override
  Stream<int> watchUserArticlesCount(int userId) {
    final articleQuery = _buildArticleWithAuthorQuery()
      ..where(articles.authorUserId.equals(userId));

    return _joinArticlesWithAuthor(articleQuery)
        .map((articles) => articles.length);
  }

  @override
  Future<int> getUserArticlesCount(int userId) async {
    final articlesList = await (select(articles)
          ..where((a) => a.authorUserId.equals(userId)))
        .get();

    return articlesList.length;
  }

  @override
  Future<int> getOrganizationArticlesCount(String organizationId) async {
    final articlesList = await (select(articles)
          ..where(
              (tbl) => tbl.authorOrganizationId.equalsNullable(organizationId)))
        .get();

    return articlesList.length;
  }

  // UPDATE

  // DELETE
  @override
  Future<void> deleteArticle(int id) async {
    return transaction(() async {
      // get current article by id.
      final article = await savedArticleById(id);

      // get user articles count by id.
      final userArticlesCount = await getUserArticlesCount(article.author.id);

      // if user has only one article, delete user.
      if (userArticlesCount == 1) {
        log(
          'Deleting user ${article.author.id}',
          name: 'DriftArticlesDao.deleteArticle',
        );
        await deleteUser(article.author.id);
      }

      if (article.organization != null) {
        // get organization articles count by id.
        final organizationArticlesCount =
            await getOrganizationArticlesCount(article.organization!.id);

        // if organization has only one article, delete organization.
        if (organizationArticlesCount == 1) {
          log(
            'Deleting organization ${article.organization!.id}',
            name: 'DriftArticlesDao.deleteArticle',
          );
          await deleteOrganization(article.organization!.id);
        }
      }

      log(
        'Deleting article $id',
        name: 'DriftArticlesDao.deleteArticle',
      );
      // delete article
      await (delete(articles)..where((a) => a.id.equals(id))).go();
    });
  }

  @override
  Future<void> deleteUser(int id) {
    return (delete(users)..where((u) => u.id.equals(id))).go();
  }

  @override
  Future<void> deleteOrganization(String id) {
    return (delete(organizations)..where((u) => u.id.equals(id))).go();
  }

  @override
  Future<ArticleWithAuthorModel> markAsRead(ArticleWithAuthorModel article) {
    // TODO: implement markAsRead
    throw UnimplementedError();
  }

  @override
  Future<ArticleWithAuthorModel> markAsUnread(ArticleWithAuthorModel article) {
    // TODO: implement markAsUnread
    throw UnimplementedError();
  }

  @override
  Future<ArticleWithAuthorModel> savedArticleById(int id) async {
    final articleQuery = _buildArticleWithAuthorQuery()
      ..where(articles.id.equals(id));

    final articlesList = await _joinArticlesWithAuthor(articleQuery).first;

    return articlesList.first;
  }

  @override
  Future<ArticleWithAuthorModel> savedArticleByPath(String path) async {
    final articleQuery = _buildArticleWithAuthorQuery()
      ..where(articles.path.equals(path));

    final articlesList = await _joinArticlesWithAuthor(articleQuery).first;

    return articlesList.first;
  }

  @override
  Future<ArticleWithAuthorModel> setReadValue(Article article,
      {required bool value}) {
    // TODO: implement setReadValue
    throw UnimplementedError();
  }

  @override
  Future<void> toggleRead(int articleId) async {
    final article = await savedArticleById(articleId);
    await update(articles)
        .replace(article.article.copyWith(isRead: !article.article.isRead));
  }
  // Helper methods

  /// Joins articles table with users and organizations tables by foreign keys.
  JoinedSelectStatement<HasResultSet, dynamic> _buildArticleWithAuthorQuery() {
    final articlesQuery = select(articles).join([
      leftOuterJoin(users, users.id.equalsExp(articles.authorUserId)),
    ]).join([
      leftOuterJoin(
        organizations,
        organizations.id.equalsExp(articles.authorOrganizationId),
      ),
    ]);

    return articlesQuery;
  }

  /// Combine tables to get article with author data.
  Stream<List<ArticleWithAuthorModel>> _joinArticlesWithAuthor(
      JoinedSelectStatement<HasResultSet, dynamic> query) {
    return query.watch().map((rows) {
      return rows.map((row) {
        return ArticleWithAuthorModel(
          article: row.readTable(articles),
          author: row.readTable(users),
          organization: row.readTableOrNull(organizations),
        );
      }).toList();
    });
  }

  Future<List<ArticleWithAuthorModel>> _joinArticlesWithAuthorToList(
    JoinedSelectStatement<HasResultSet, dynamic> query,
  ) async {
    final articlesList = await query.get();

    return articlesList
        .map(
          (row) => ArticleWithAuthorModel(
            article: row.readTable(articles),
            author: row.readTable(users),
            organization: row.readTableOrNull(organizations),
          ),
        )
        .toList();
  }
}
