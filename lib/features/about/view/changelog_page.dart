import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/core/core.dart';
import 'package:dev_community/features/about/models/app_changelog_mock.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/utils/utils.dart';
import 'package:flutter/material.dart';

class ChangelogPage extends StatelessWidget {
  const ChangelogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appbarTitleTextStyle = Theme.of(context).textTheme.titleLarge;

    final changelog = List<AppChangelogModel>.from(
      changelogMock.map(AppChangelogModel.fromJson),
    ).reversed.toList();

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar.medium(
              title: Text(
                AppStrings.aboutChangelogAppBarTitle,
                style: appbarTitleTextStyle,
              ),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final item = changelog[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 24, 8, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        VersionTitle(item: item),
                        const SizedBox(height: 8),
                        VersionChangesList(item: item),
                      ],
                    ),
                  );
                },
                childCount: changelog.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VersionChangesList extends StatelessWidget {
  const VersionChangesList({
    super.key,
    required this.item,
  });

  final AppChangelogModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: item.changes
            .map(
              (changeItem) => VersionChangeItem(
                item: changeItem,
              ),
            )
            .toList(),
      ),
    );
  }
}

class VersionChangeItem extends StatelessWidget {
  const VersionChangeItem({
    super.key,
    required this.item,
  });

  final AppChangeItemModel item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item.status != null) ...[
                // To align with text
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: ChangeItemStatusBadge(status: item.status),
                ),
                const SizedBox(width: 8),
              ],
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: item.content == null
                        ? theme.textTheme.bodyLarge
                        : theme.textTheme.bodyLarge!.semibold,
                  ),
                  if (item.content != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: item.content!
                            .map(
                              (changeItem) => Text(
                                changeItem,
                                style: theme.textTheme.bodySmall!.secondary,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChangeItemStatusBadge extends StatelessWidget {
  const ChangeItemStatusBadge({
    super.key,
    this.status,
  });

  final AppChangeStatus? status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final badgeText = _matchBadgeText(status);
    final badgeColor = _matchBadgeColor(context, status);

    final textStyle = Theme.of(context).textTheme.labelMedium!.copyWith(
          color: theme.colorScheme.background,
        );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: badgeColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 1,
        ),
        child: Text(
          badgeText,
          style: textStyle,
        ),
      ),
    );
  }

  String _matchBadgeText(AppChangeStatus? status) {
    switch (status) {
      case AppChangeStatus.improved:
        return 'Improved';
      case AppChangeStatus.fixed:
        return 'Fixed';
      case AppChangeStatus.newFeature:
      default:
        return 'New';
    }
  }

  Color _matchBadgeColor(BuildContext context, AppChangeStatus? status) {
    switch (status) {
      case AppChangeStatus.improved:
        return badgeOrange(context);
      case AppChangeStatus.fixed:
        return badgeGrey(context);
      case AppChangeStatus.newFeature:
      default:
        return badgeGreen(context);
    }
  }
}

class VersionTitle extends StatelessWidget {
  const VersionTitle({
    super.key,
    required this.item,
  });

  final AppChangelogModel item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(
              '${item.icon} ${item.name}',
              style: textTheme.displaySmall!.medium,
            ),
            const Spacer(),
            Text(
              StringUtils.formatDate(item.date),
              style: textTheme.labelMedium!.secondary,
            ),
          ],
        ),
      ),
    );
  }
}

Color badgeGreen(BuildContext context) => DynamicColor(
      color: Colors.green,
      darkColor: Colors.green.shade300,
    ).resolveFrom(context);

Color badgeOrange(BuildContext context) => const DynamicColor(
      color: Colors.orange,
      darkColor: Colors.orangeAccent,
    ).resolveFrom(context);

Color badgeGrey(BuildContext context) => DynamicColor(
      color: Colors.grey,
      darkColor: Colors.blueGrey.shade200,
    ).resolveFrom(context);
