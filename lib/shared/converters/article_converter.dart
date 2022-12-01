import 'package:data_store/data_store.dart';
import 'package:dev_community/features/features.dart';

class ArticleConverter {
  static ArticleWithAuthorModel toArticleWithAuthor(
    ArticleDetailsModel articleDetails,
  ) {
    return ArticleWithAuthorModel(
      article: Article(
        id: articleDetails.id,
        title: articleDetails.title,
        content: articleDetails.bodyMarkdown,
        createdAt: articleDetails.createdAt,
        readingTimeMinutes: articleDetails.readingTimeMinutes,
        authorUserId: articleDetails.user.id,
        authorOrganizationId: articleDetails.organization?.username,
        isRead: false,
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
}
