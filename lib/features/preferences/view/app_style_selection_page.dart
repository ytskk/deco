import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStyleSelectionPage extends ConsumerWidget {
  const AppStyleSelectionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.preferencesAppStyleAppBarTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DescriptionText(
              description: AppStrings.preferencesAppStyleDescriptionText,
            ),
            TableGroup(
              children: [
                for (final appStyle in AppStyleType.values)
                  TableGroupRow(
                    title: Text(appStyle.title),
                    trailing: AnimatedCrossFade(
                      alignment: Alignment.center,
                      crossFadeState:
                          ref.watch(appThemePreferencesProvider).appStyleType ==
                                  appStyle
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 300),
                      firstChild: Icon(
                        Icons.check,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      secondChild: const SizedBox.shrink(),
                    ),
                    onTap: () {
                      ref
                          .read(appThemePreferencesProvider.notifier)
                          .updateAppStyleType(appStyle);
                      // Navigator.of(context).pop();
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
