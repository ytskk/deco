import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar.medium(
              title: const Text(AppStrings.preferencesAppBarTitle),
            )
          ];
        },
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          children: [
            const AppearanceWidget(),
            TableGroup(
              title: AppStrings.preferencesDevelopmentTitle,
              children: [
                TableGroupRow(
                  title: const Text(
                    AppStrings.preferencesDevelopmentComponentsTitle,
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {
                    context.pushNamed(PathNames.preferencesComponents);
                  },
                ),
                TableGroupRow(
                  title: const Text(
                    AppStrings.preferencesDevelopmentTagsSelection,
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {
                    context.pushNamed(PathNames.tagsSelect);
                  },
                ),
              ],
            ),
            TableGroup(
              children: [
                TableGroupRow(
                  title: const Text(
                    AppStrings.preferencesAboutTitle,
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {
                    context.pushNamed(PathNames.about);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
