import 'dart:developer';

import 'package:dev_community/constants/app_strings.dart';
import 'package:dev_community/core/adaptive_widgets/adaptive_builder.dart';
import 'package:dev_community/core/adaptive_widgets/adaptive_dropdown.dart';
import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_down_button/pull_down_button.dart';

class ComponentsPage extends StatelessWidget {
  const ComponentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Components'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final dropdownValue = ref.watch(dropdownProvider);

              return ComponentsColumn(
                title: AppStrings.componentsArticleCardTitle,
                description: AppStrings.componentsArticleCardDescription,
                child: Column(
                  children: [
                    ArticleCardAlternative(
                      article: FakeArticlesRepository.mockArticles().first,
                      showCoverImage: dropdownValue.index != 0,
                    ),
                    ArticleCardAlternative(
                      article:
                          FakeArticlesRepository.mockArticles(count: 2).last,
                    ),
                  ],
                ),
              );
            },
          ),
          ComponentsColumn(
            title: 'Tag',
            child: Wrap(
              spacing: 8,
              children: [
                DefaultTabController(
                  length: 15,
                  child: TagTabBar(
                    onTap: (index) {
                      log('tapped to $index');
                    },
                    tabs: List.generate(
                      15,
                      (index) => TagTabItem(
                        title: 'Tag ${index + 1}',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final dropdownValue = ref.watch(dropdownProvider);

              return ComponentsColumn(
                title: 'Adaptive Dropdown',
                child: AdaptiveDropdown<CardType>(
                  // type: AdaptiveWidgetType.cupertino,
                  value: dropdownValue,
                  itemBuilder: (context, item, showMenu) => ListTile(
                    title: Text('Article style'),
                    trailing: IconLabel(
                      iconFirst: false,
                      icon: Icons.chevron_right_rounded,
                      iconSize: 24,
                      label: item.title,
                      spacing: 0,
                    ),
                    onTap: () async {
                      await showMenu(context);
                    },
                  ),
                  onChanged: (value) =>
                      ref.read(dropdownProvider.notifier).update(
                            (state) => value!,
                          ),
                  items: CardType.values.map(
                    (e) {
                      return DropdownValue(
                        value: e,
                        title: e.title,
                      );
                    },
                  ).toList(),
                ),
              );
            },
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final dropdownValue = ref.watch(dropdownProvider);

              return ComponentsColumn(
                title: 'Adaptive Dropdown',
                child: AdaptiveDropdown<CardType>(
                  type: AdaptiveWidgetType.cupertino,
                  value: dropdownValue,
                  itemBuilder: (context, item, showMenu) => ListTile(
                    title: Text('Article style'),
                    trailing: Text(item.title),
                    onTap: () async {
                      await showMenu(context);
                    },
                  ),
                  onChanged: (value) =>
                      ref.read(dropdownProvider.notifier).update(
                            (state) => value!,
                          ),
                  items: CardType.values.map(
                    (e) {
                      return DropdownValue(
                        value: e,
                        title: e.title,
                      );
                    },
                  ).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

enum CardType {
  withoutImage('Without Image'),
  withImage('With Image');

  const CardType(this.title);
  final String title;
}

final dropdownProvider = StateProvider<CardType>((ref) {
  return CardType.withImage;
});
