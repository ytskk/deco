import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class AuthorInfo extends StatelessWidget {
  const AuthorInfo({
    super.key,
    required this.author,
  });

  final AuthorInfoModel author;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (author.summary != null ||
              author.story != null ||
              author.tagLine != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (author.summary != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(author.summary!.trim()),
                    ),
                  if (author.story != null)
                    ExpandableText(
                      author.story!,
                      style: theme.textTheme.bodyMedium,
                      expandText: 'More',
                      animation: true,
                      collapseOnTextTap: true,
                      collapseText: 'Less',
                      linkColor: theme.colorScheme.primary,
                      animationDuration: const Duration(milliseconds: 250),
                      animationCurve: Curves.easeOut,
                    ),
                  if (author.tagLine != null)
                    Text(
                      author.tagLine!,
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                ],
              ),
            ),
          Wrap(
            spacing: 8,
            children: [
              if (author.location != null && author.location!.isNotEmpty)
                IconLabel(
                  icon: Icons.location_on_outlined,
                  label: author.location!,
                  style: theme.textTheme.labelMedium,
                ),
              IconLabel(
                icon: Icons.calendar_month_rounded,
                label: '${AppStrings.authorInfoJoined} ${author.joinedAt}',
                style: theme.textTheme.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
