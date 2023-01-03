import 'package:data_store/data_store.dart';

/// Data store interface for articles
abstract class ArticlesDataStoreInterface {
  // CREATE

  /// Saves provided article to db. If there is already article with same id,
  /// updates all fields, except id.
  Future<int> saveArticle(ArticleWithAuthorModel article);

  /// Creates article in db. If there is already article with same id,
  /// replaces it.
  Future<int> createArticle(Article article);

  /// Creates user in db. If user with same id already exists, updates all
  /// fields, except id.
  Future<int> createUser(User user);

  // READ

  /// Return all saved articles in db. Article data with content (in MD)
  /// and read status.
  Stream<List<ArticleWithAuthorModel>> allSavedArticles();

  /// Return all saved and read articles in db.
  Stream<List<ArticleWithAuthorModel>> allReadArticles();

  /// Return all saved and unread articles in db.
  Stream<List<ArticleWithAuthorModel>> allUnreadArticles();

  /// Return all saved articles in db. Article data with content (in MD)
  /// and read status.
  Future<List<ArticleWithAuthorModel>> allSavedArticlesList();

  /// Return single saved article by provided id.
  Future<ArticleWithAuthorModel> savedArticleById(int id);

  /// Return single saved article by provided id.
  Future<ArticleWithAuthorModel> savedArticleByPath(String path);

  ///Checks is article exists in db
  Stream<bool> isArticleSaved(int articleId);

  ///Checks is article read
  Stream<bool> isArticleRead(int articleId);

  /// Returns stream of all saved articles for user with provided [userId].
  Stream<int> watchUserArticlesCount(int userId);

  /// Returns future of all saved articles for user with provided [userId].
  Future<int> getUserArticlesCount(int userId);

  /// Returns stream of all saved articles for organization with provided
  /// [organizationId].
  Future<int> getOrganizationArticlesCount(String organizationId);

  // UPDATE

  /// Changes article read status to opposite.
  Future<void> toggleRead(int articleId);

  /// Changes article read status true.
  Future<ArticleWithAuthorModel> markAsRead(ArticleWithAuthorModel article);

  /// Changes article read status false.
  Future<ArticleWithAuthorModel> markAsUnread(ArticleWithAuthorModel article);

  /// Changes article read status to [value].
  Future<ArticleWithAuthorModel> setReadValue(
    Article article, {
    required bool value,
  });

  // DELETE
  /// Deletes article by provided id from db.
  Future<void> deleteArticle(int id);

  /// Deletes user by provided id from db.
  Future<void> deleteUser(int id);

  /// Deletes organization by provided id from db.
  Future<void> deleteOrganization(String id);
}
