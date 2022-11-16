import 'package:dev_community/constants/app_strings.dart';
import 'package:dev_community/features/articles/articles.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticleAuthors extends StatelessWidget {
  const ArticleAuthors({
    super.key,
    required this.author,
    this.organization,
  });

  final UserQuickInfoModel author;
  final OrganizationQuickInfoModel? organization;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          indent: 16,
          endIndent: 16,
          thickness: 1,
        ),
        const SizedBox(height: 24),
        PaddedTitle(
          title: organization != null
              ? AppStrings.articleDetailsInfoAuthorsTitle
              : AppStrings.articleDetailsInfoAuthorTitle,
          style: Theme.of(context).textTheme.bodyLarge?.semibold,
        ),
        const SizedBox(height: 8),
        _AuthorRow(
          title: author.name,
          imageUrl: author.profileImage,
          username: author.username,
          onPressed: () {
            context.pushNamed(
              PathNames.username,
              params: {
                PathNames.username: author.username,
              },
            );
          },
        ),
        if (organization != null)
          _AuthorRow(
            title: organization!.name,
            imageUrl: organization!.profileImage,
            username: organization!.username,
            onPressed: () {
              context.pushNamed(
                PathNames.username,
                params: {
                  PathNames.username: organization!.username,
                },
              );
            },
          ),
      ],
    );
  }
}

class _AuthorRow extends StatelessWidget {
  const _AuthorRow({
    required this.title,
    required this.imageUrl,
    this.onPressed,
    this.username,
  });

  final String title;
  final String imageUrl;
  final String? username;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AccountAvatar(
        url: imageUrl,
        accountName: username,
      ),
      title: Text(title),
      onTap: onPressed,
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
