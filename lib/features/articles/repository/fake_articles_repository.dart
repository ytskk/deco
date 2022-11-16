// ignore_for_file: lines_longer_than_80_chars

import 'package:dev_community/features/features.dart';

class FakeArticlesRepository implements ArticlesRepositoryInterface {
  @override
  Future<List<ArticleCardModel>> getArticles({
    int page = 1,
    String? type,
  }) async {
    final res = [
      {
        'canonical_url':
            'https://dev.to/devteam/follow-friday-python-edition-23-september-2022-5456',
        'collection_id': 18283,
        'comments_count': 1,
        'cover_image': null,
        'created_at': '2022-09-23T15:45:53Z',
        'crossposted_at': null,
        'description':
            'Happy Friday, friends! 🎉 Follow Friday is your weekly opportunity to shout out fellow DEV Community...',
        'edited_at': null,
        'id': 1201252,
        'last_comment_at': '2022-09-23T17:39:56Z',
        'organization': {
          'name': 'The DEV Team',
          'profile_image':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--CAGmUhNa--/c_fill,f_auto,fl_progressive,h_640,q_auto,w_640/https://dev-to-uploads.s3.amazonaws.com/uploads/organization/profile_image/1/0213bbaa-d5a1-4d25-9e7a-10c30b455af0.png',
          'profile_image_90':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--mbsgKaXh--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://dev-to-uploads.s3.amazonaws.com/uploads/organization/profile_image/1/0213bbaa-d5a1-4d25-9e7a-10c30b455af0.png',
          'slug': 'devteam',
          'username': 'devteam'
        },
        'path': '/devteam/follow-friday-python-edition-23-september-2022-5456',
        'positive_reactions_count': 12,
        'public_reactions_count': 12,
        'published_at': '2022-09-23T15:45:53Z',
        'published_timestamp': '2022-09-23T15:45:53Z',
        'readable_publish_date': 'Sep 23',
        'reading_time_minutes': 1,
        'slug': 'follow-friday-python-edition-23-september-2022-5456',
        'social_image': 'https://dev.to/social_previews/article/1201252.png',
        'tag_list': ['meta', 'writing', 'python'],
        'tags': 'meta, writing, python',
        'title': 'Follow Friday: Python Edition (23 September 2022)',
        'type_of': 'article',
        'url':
            'https://dev.to/devteam/follow-friday-python-edition-23-september-2022-5456',
        'user': {
          'github_username': 'erinb223',
          'name': 'Erin Bensinger',
          'profile_image':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--6nTNzTEG--/c_fill,f_auto,fl_progressive,h_640,q_auto,w_640/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/494502/2d4eb07b-a07a-46f9-91cd-1b98d862a13c.png',
          'profile_image_90':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--VG4G50pa--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/494502/2d4eb07b-a07a-46f9-91cd-1b98d862a13c.png',
          'twitter_username': 'erinposting',
          'user_id': 494502,
          'username': 'erinposting',
          'website_url': null
        }
      },
      {
        'canonical_url':
            'https://dev.to/devteam/discussion-and-comment-of-the-week-v19-20ke',
        'collection_id': 17926,
        'comments_count': 4,
        'cover_image':
            'https://res.cloudinary.com/practicaldev/image/fetch/s--76vQJtg---/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/ev70f7xggmofxn0rropu.png',
        'created_at': '2022-09-22T16:20:53Z',
        'crossposted_at': null,
        'description':
            'This weekly roundup highlights what we believe to be the most thoughtful and/or interesting...',
        'edited_at': null,
        'id': 1200373,
        'last_comment_at': '2022-09-23T08:48:02Z',
        'organization': {
          'name': 'The DEV Team',
          'profile_image':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--CAGmUhNa--/c_fill,f_auto,fl_progressive,h_640,q_auto,w_640/https://dev-to-uploads.s3.amazonaws.com/uploads/organization/profile_image/1/0213bbaa-d5a1-4d25-9e7a-10c30b455af0.png',
          'profile_image_90':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--mbsgKaXh--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://dev-to-uploads.s3.amazonaws.com/uploads/organization/profile_image/1/0213bbaa-d5a1-4d25-9e7a-10c30b455af0.png',
          'slug': 'devteam',
          'username': 'devteam'
        },
        'path': '/devteam/discussion-and-comment-of-the-week-v19-20ke',
        'positive_reactions_count': 19,
        'public_reactions_count': 19,
        'published_at': '2022-09-22T16:20:53Z',
        'published_timestamp': '2022-09-22T16:20:53Z',
        'readable_publish_date': 'Sep 22',
        'reading_time_minutes': 3,
        'slug': 'discussion-and-comment-of-the-week-v19-20ke',
        'social_image':
            'https://res.cloudinary.com/practicaldev/image/fetch/s--2dRdBj8V--/c_imagga_scale,f_auto,fl_progressive,h_500,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/ev70f7xggmofxn0rropu.png',
        'tag_list': ['bestofdev'],
        'tags': 'bestofdev',
        'title': 'Discussion and Comment of the Week - v19',
        'type_of': 'article',
        'url':
            'https://dev.to/devteam/discussion-and-comment-of-the-week-v19-20ke',
        'user': {
          'github_username': 'michael-tharrington',
          'name': 'Michael Tharrington',
          'profile_image':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--FghtiDVB--/c_fill,f_auto,fl_progressive,h_640,q_auto,w_640/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/38578/2b719be8-68c7-4456-bd5c-42f21c3bd6a8.png',
          'profile_image_90':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--fySxNi_p--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/38578/2b719be8-68c7-4456-bd5c-42f21c3bd6a8.png',
          'twitter_username': 'MichaelMadcat',
          'user_id': 38578,
          'username': 'michaeltharrington',
          'website_url': 'https://community.codenewbie.org/michaeltharrington'
        }
      },
    ];

    final fakeArticles = res.map(ArticleCardModel.fromJson).toList();

    return fakeArticles;
  }

  static List<ArticleCardModel> mockArticles({int count = 1}) {
    final articlesCount = count.clamp(0, 5);

    final articles = [
      {
        'canonical_url':
            'https://dev.to/devteam/follow-friday-python-edition-23-september-2022-5456',
        'collection_id': 18283,
        'comments_count': 1,
        'cover_image':
            'https://images.unsplash.com/photo-1661961111247-e218f67d1cd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1744&q=80',
        'created_at': '2022-09-23T15:45:53Z',
        'crossposted_at': null,
        'description':
            'Happy Friday, friends! 🎉 Follow Friday is your weekly opportunity to shout out fellow DEV Community...',
        'edited_at': null,
        'id': 1201252,
        'last_comment_at': '2022-09-23T17:39:56Z',
        'organization': {
          'name': 'The DEV Team',
          'profile_image':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--CAGmUhNa--/c_fill,f_auto,fl_progressive,h_640,q_auto,w_640/https://dev-to-uploads.s3.amazonaws.com/uploads/organization/profile_image/1/0213bbaa-d5a1-4d25-9e7a-10c30b455af0.png',
          'profile_image_90':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--mbsgKaXh--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://dev-to-uploads.s3.amazonaws.com/uploads/organization/profile_image/1/0213bbaa-d5a1-4d25-9e7a-10c30b455af0.png',
          'slug': 'devteam',
          'username': 'devteam'
        },
        'path': '/devteam/follow-friday-python-edition-23-september-2022-5456',
        'positive_reactions_count': 12,
        'public_reactions_count': 12,
        'published_at': '2022-09-23T15:45:53Z',
        'published_timestamp': '2022-09-23T15:45:53Z',
        'readable_publish_date': 'Sep 23',
        'reading_time_minutes': 1,
        'slug': 'follow-friday-python-edition-23-september-2022-5456',
        'social_image': 'https://dev.to/social_previews/article/1201252.png',
        'tag_list': ['meta', 'writing', 'python'],
        'tags': 'meta, writing, python',
        'title': 'Follow Friday: Python Edition (23 September 2022)',
        'type_of': 'article',
        'url':
            'https://dev.to/devteam/follow-friday-python-edition-23-september-2022-5456',
        'user': {
          'github_username': 'erinb223',
          'name': 'Erin Bensinger',
          'profile_image':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--6nTNzTEG--/c_fill,f_auto,fl_progressive,h_640,q_auto,w_640/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/494502/2d4eb07b-a07a-46f9-91cd-1b98d862a13c.png',
          'profile_image_90':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--VG4G50pa--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/494502/2d4eb07b-a07a-46f9-91cd-1b98d862a13c.png',
          'twitter_username': 'erinposting',
          'user_id': 494502,
          'username': 'erinposting',
          'website_url': null
        }
      },
      {
        'canonical_url':
            'https://dev.to/devteam/discussion-and-comment-of-the-week-v19-20ke',
        'collection_id': 17926,
        'comments_count': 4,
        'cover_image': null,
        'created_at': '2021-09-22T16:20:53Z',
        'crossposted_at': null,
        'description':
            'This weekly roundup highlights what we believe to be the most thoughtful and/or interesting...',
        'edited_at': null,
        'id': 1200373,
        'last_comment_at': '2022-09-23T08:48:02Z',
        'organization': {
          'name': 'The DEV Team',
          'profile_image':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--CAGmUhNa--/c_fill,f_auto,fl_progressive,h_640,q_auto,w_640/https://dev-to-uploads.s3.amazonaws.com/uploads/organization/profile_image/1/0213bbaa-d5a1-4d25-9e7a-10c30b455af0.png',
          'profile_image_90':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--mbsgKaXh--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://dev-to-uploads.s3.amazonaws.com/uploads/organization/profile_image/1/0213bbaa-d5a1-4d25-9e7a-10c30b455af0.png',
          'slug': 'devteam',
          'username': 'devteam'
        },
        'path': '/devteam/discussion-and-comment-of-the-week-v19-20ke',
        'positive_reactions_count': 19,
        'public_reactions_count': 19,
        'published_at': '2022-09-22T16:20:53Z',
        'published_timestamp': '2022-09-22T16:20:53Z',
        'readable_publish_date': 'Sep 22',
        'reading_time_minutes': 3,
        'slug': 'discussion-and-comment-of-the-week-v19-20ke',
        'social_image':
            'https://res.cloudinary.com/practicaldev/image/fetch/s--2dRdBj8V--/c_imagga_scale,f_auto,fl_progressive,h_500,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/ev70f7xggmofxn0rropu.png',
        'tag_list': ['bestofdev'],
        'tags': 'bestofdev',
        'title': 'Discussion and Comment of the Week - v19',
        'type_of': 'article',
        'url':
            'https://dev.to/devteam/discussion-and-comment-of-the-week-v19-20ke',
        'user': {
          'github_username': 'michael-tharrington',
          'name': 'Michael Tharrington',
          'profile_image':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--FghtiDVB--/c_fill,f_auto,fl_progressive,h_640,q_auto,w_640/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/38578/2b719be8-68c7-4456-bd5c-42f21c3bd6a8.png',
          'profile_image_90':
              'https://res.cloudinary.com/practicaldev/image/fetch/s--fySxNi_p--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/38578/2b719be8-68c7-4456-bd5c-42f21c3bd6a8.png',
          'twitter_username': 'MichaelMadcat',
          'user_id': 38578,
          'username': 'michaeltharrington',
          'website_url': 'https://community.codenewbie.org/michaeltharrington'
        }
      },
    ];

    final articleCardModelList =
        articles.take(articlesCount).map(ArticleCardModel.fromJson).toList();

    return articleCardModelList;
  }

  @override
  Future<ArticleDetailsModel> getArticleDetails({required String slug}) {
    // TODO: implement getArticleDetails
    throw UnimplementedError();
  }

  @override
  Future<ArticleCardModel> getArticleCard({required String slug}) {
    // TODO: implement getArticleCard
    throw UnimplementedError();
  }
}
