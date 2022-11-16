import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ArticlesListAppbar extends StatelessWidget with PreferredSizeWidget {
  const ArticlesListAppbar({
    super.key,
    required this.tabController,
    required this.types,
  });

  final TabController tabController;
  final List<String> types;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            context.pushNamed(PathNames.preferences);
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Row(
          children: [
            Expanded(
              child: TagTabBar(
                onTap: (value) {
                  HapticFeedback.lightImpact();
                },
                controller: tabController,
                tabs: types
                    .map(
                      (type) => TagTabItem(
                        title: type.toCapitalized(),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(16 + kToolbarHeight);
}
