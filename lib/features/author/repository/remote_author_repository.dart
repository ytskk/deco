import 'dart:developer';

import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authorRepositoryProvider = Provider<AuthorRepositoryInterface>((ref) {
  final clientApi = ref.watch(clientApiProvider);

  return RemoteAuthorRepository(dio: clientApi);
});

class RemoteAuthorRepository implements AuthorRepositoryInterface {
  const RemoteAuthorRepository({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<AuthorInfoModel> getAuthorByUsername(String username) async {
    // trying to get user with [username]
    final userRes = await _dio.get(
      ApiConstants.userByUsername,
      queryParameters: {
        'url': username,
      },
    );

    // if user was found, return it
    if (userRes.statusCode != 404) {
      return AuthorInfoModel.fromUserModel(
        UserModel.fromJson(userRes.data as Map<String, dynamic>),
      );
    }

    // trying to get organization with [username]
    final organizationRes = await _dio.get(
      StringUtils.joinBy(
        [
          ApiConstants.organizationByUsername,
          username,
        ],
        separator: '/',
      ),
      queryParameters: {
        'url': username,
      },
    );

    // if organization was found, return it
    if (organizationRes.statusCode != 404) {
      return AuthorInfoModel.fromOrganizationModel(
        OrganizationModel.fromJson(
          organizationRes.data as Map<String, dynamic>,
        ),
      );
    }

    // if user and organization was not found, return null
    return Future.error('Author not found');
  }

  @override
  Future<List<ArticleQuickInfoModel>> getArticlesByUsername({
    required String username,
    int page = 1,
    bool isOrganization = false,
  }) async {
    final res = await _dio.get(
      ApiConstants.articles,
      queryParameters: {
        'username': username,
        'page': page,
      },
    );

    final articles = res.data as List;

    return articles
        .map(
          (article) => ArticleQuickInfoModel.fromJson(
            article as Map<String, dynamic>,
          ),
        )
        .toList();
    // final requestConfiguration = _generateRequestParams(
    //   username: username,
    //   page: page,
    //   isOrganization: isOrganization,
    // );
    // log(
    //   'articles: ',
    //   name: 'RemoteAuthorRepository.getArticlesByUsername',
    // );

    // final res = await _dio.get(
    //   requestConfiguration['path'] as String,
    //   queryParameters:
    //       requestConfiguration['queryParameters'] as Map<String, dynamic>,
    // );

    // final articles = res.data as List;

    // return articles
    //     .map((e) => ArticleQuickInfoModel.fromJson(e as Map<String, dynamic>))
    //     .toList();
  }

  @override
  Future<List<UserModel>> getOrganizationMembers({
    required String organizationName,
  }) async {
    const maxMembers = 100;
    try {
      final res = await _dio.get(
        ApiConstants.organizationMembers(organizationName: organizationName),
        queryParameters: {
          'per_page': maxMembers,
        },
      );

      final members = res.data as List<dynamic>;

      return members
          .map(
            (member) => UserModel.fromJson(
              member as Map<String, dynamic>,
            ),
          )
          .toList();
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  Map _generateRequestParams({
    required String username,
    required int page,
    required bool isOrganization,
  }) {
    final request = <String, dynamic>{};

    if (isOrganization) {
      request['queryParameters'] = {
        'page': page,
      };
      request['path'] = StringUtils.joinBy(
        [
          ApiConstants.organizationByUsername,
          username,
          ApiConstants.articles,
        ],
        separator: '/',
      );

      return request;
    }

    // if its not organization, then its user
    request['path'] = ApiConstants.articles;
    request['queryParameters'] = {
      'page': page,
      'username': username,
    };

    return request;
  }
}
