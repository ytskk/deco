import 'package:data_store/data_store.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';

abstract class ArticleConverter {
  static ArticleWithAuthorModel toArticleWithAuthor(
    ArticleDetailsModel articleDetails,
  ) {
    return ArticleWithAuthorModel(
      article: Article(
        id: articleDetails.id,
        title: articleDetails.title,
        content: articleDetails.bodyMarkdown,
        createdAt: articleDetails.createdAt,
        coverImage: articleDetails.coverImage,
        readingTimeMinutes: articleDetails.readingTimeMinutes,
        authorUserId: articleDetails.user.id,
        authorOrganizationId: articleDetails.organization?.username,
        isRead: false,
        tags: articleDetails.tags,
        url: articleDetails.url,
        path: articleDetails.path,
      ),
      author: User(
        id: articleDetails.user.id,
        name: articleDetails.user.name,
        username: articleDetails.user.username,
        profileImage: articleDetails.user.profileImage,
      ),
      organization: articleDetails.organization != null
          ? Organization(
              id: articleDetails.organization!.username,
              name: articleDetails.organization!.name,
              username: articleDetails.organization!.username,
              profileImage: articleDetails.organization!.profileImage,
            )
          : null,
    );
  }

  static ArticleCardModel articleQuickInfoToArticleCardModel(
    ArticleQuickInfoModel article,
  ) {
    return ArticleCardModel(
      id: article.id,
      authorId: article.user.id,
      authorsString: StringUtils.prepareAuthors(
        userName: article.user.name,
        organizationName: article.organization?.name,
      ),
      coverImage: article.coverImage,
      positiveReactionsCount: article.positiveReactionsCount,
      commentsCount: article.commentsCount,
      title: article.title,
      tags: article.tags,
      createdAt: article.createdAt,
      readingTimeMinutes: article.readingTimeMinutes,
      url: article.url,
    );
  }

  static ArticleCardModel articleWithAuthorToArticleCard(
    ArticleWithAuthorModel article,
  ) {
    return ArticleCardModel(
      id: article.article.id,
      authorId: article.article.authorUserId,
      authorsString: StringUtils.prepareAuthors(
        userName: article.author.name,
        organizationName: article.organization?.name,
      ),
      coverImage: article.article.coverImage,
      title: article.article.title,
      createdAt: article.article.createdAt,
      readingTimeMinutes: article.article.readingTimeMinutes,
      url: article.article.url,
      tags: article.article.tags,
    );
  }

  static ArticleDetailsModel articleWithAuthorToArticleDetails(
    ArticleWithAuthorModel article,
  ) {
    return ArticleDetailsModel(
      id: article.article.id,
      title: article.article.title,
      description: '',
      readablePublishDate: '',
      url: '',
      slug: '',
      path: '',
      commentsCount: 0,
      publicReactionsCount: 0,
      positiveReactionsCount: 0,
      createdAt: article.article.createdAt,
      readingTimeMinutes: article.article.readingTimeMinutes,
      user: UserQuickInfoModel(
        id: article.article.authorUserId,
        name: article.author.name,
        username: article.author.username,
        profileImage: article.author.profileImage,
      ),
      bodyHtml: '',
      bodyMarkdown: article.article.content,
    );
  }
}
