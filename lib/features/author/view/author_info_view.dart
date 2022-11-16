import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/features/features.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AuthorInfoView extends StatelessWidget {
  const AuthorInfoView({
    super.key,
    required this.author,
  });

  final AuthorInfoModel author;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AuthorInfo(author: author),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: _buildAuthorLinks(),
        ),
      ],
    );
  }

  List<Widget> _buildAuthorLinks() {
    final linksData = [
      AuthorLinkData(
        icon: AppIcons.devLogo,
        text: 'DEV',
        onPressed: () {
          final url = 'https://dev.to/${author.username}';
          launchUrlString(
            url,
            mode: LaunchMode.externalApplication,
          );
        },
      ),
      if (author.twitterUsername != null)
        AuthorLinkData(
          icon: AppIcons.twitter,
          text: 'Twitter',
          onPressed: () {
            final url = 'https://twitter.com/${author.twitterUsername}';
            launchUrlString(
              url,
              mode: LaunchMode.externalApplication,
            );
          },
        ),
      if (author.githubUsername != null)
        AuthorLinkData(
          icon: AppIcons.github,
          text: 'Github',
          onPressed: () {
            final url = 'https://github.com/${author.githubUsername}';
            launchUrlString(
              url,
              mode: LaunchMode.externalApplication,
            );
          },
        ),
      if (author.websiteUrl != null)
        AuthorLinkData(
          icon: AppIcons.globe,
          text: 'Website',
          onPressed: () {
            final url = author.websiteUrl!;

            launchUrlString(
              url,
              mode: LaunchMode.externalApplication,
            );
          },
        ),
    ];

    final links = <Widget>[];

    linksData.take(linksData.length).forEach(
          (linkData) => links.add(
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 72),
              child: AuthorLinkButton(data: linkData),
            ),
          ),
        );

    return links;
  }
}
