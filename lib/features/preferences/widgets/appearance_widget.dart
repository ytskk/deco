import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppearanceWidget extends ConsumerWidget {
  const AppearanceWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TableGroup(
          title: AppStrings.preferencesAppearanceTitle,
          children: [
            const _AppearanceThemeMode(),
            TableGroupRow(
              title: const Text(AppStrings.preferencesAutomaticTitle),
              trailing: Switch.adaptive(
                activeColor: primaryColor,
                value: ref.watch(appThemePreferencesProvider).themeMode ==
                    ThemeMode.system,
                onChanged: (value) {
                  final platformBrightness =
                      MediaQuery.platformBrightnessOf(context);

                  /// If [themeMode] is not automatic, sets platform preferred
                  /// mode.
                  final themeMode = value
                      ? ThemeMode.system
                      : platformBrightness == Brightness.dark
                          ? ThemeMode.dark
                          : ThemeMode.light;

                  ref
                      .read(appThemePreferencesProvider.notifier)
                      .updateThemeMode(themeMode);
                },
              ),
            ),
            TableGroupRow(
              title: const Text(AppStrings.preferencesUseDimColorsTitle),
              trailing: Switch.adaptive(
                activeColor: primaryColor,
                value: ref.watch(appThemePreferencesProvider).useDimColors,
                onChanged: (onChanged) {
                  ref
                      .read(appThemePreferencesProvider.notifier)
                      .updateUseDimColors(onChanged);
                },
              ),
            ),
            // TableGroupRow(
            //   title: const Text(AppStrings.preferencesAppStyleTitle),
            //   onTap: () {
            //     context.pushNamed(
            //       PathNames.preferencesAppStyle,
            //       // extra: PathExtra(fullscreenDialog: true),
            //     );
            //   },
            //   trailing: Text(
            //     ref.watch(appThemePreferencesProvider).appStyleType.title,
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}

class _AppearanceThemeModeItem extends StatelessWidget {
  const _AppearanceThemeModeItem({
    required this.title,
    this.onTap,
    required this.isSelected,
    required this.containerColor,
    required this.contentColor,
  });

  final String title;
  final VoidCallback? onTap;
  final bool isSelected;
  final Color containerColor;
  final Color contentColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CupertinoButton(
      onPressed: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 128,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: theme.colorScheme.onBackground.withOpacity(0.1),
                width: 0.5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _AppearanceThemeModeContentItem(
                  contentColor: contentColor,
                ),
                const SizedBox(height: 4),
                _AppearanceThemeModeContentItem(
                  contentColor: contentColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(title),
          const SizedBox(height: 8),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.colorScheme.onBackground.withOpacity(0.3),
                    width: 1.3,
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isSelected ? 1.0 : 0.0,
                child: AnimatedScale(
                  scale: isSelected ? 1.0 : 0.6,
                  duration: const Duration(milliseconds: 420),
                  curve: Curves.ease,
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.primary,
                    ),
                    child: Icon(
                      Icons.check,
                      color: theme.colorScheme.background,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AppearanceThemeModeContentItem extends StatelessWidget {
  const _AppearanceThemeModeContentItem({
    required this.contentColor,
  });

  final Color contentColor;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.85,
      child: Container(
        height: 16,
        decoration: BoxDecoration(
          color: contentColor,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _AppearanceThemeMode extends ConsumerWidget {
  const _AppearanceThemeMode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final providedThemeMode = ref.watch(appThemePreferencesProvider).themeMode;

    return Row(
      children: [
        const Spacer(flex: 4),
        _AppearanceThemeModeItem(
          title: AppStrings.preferencesAppearanceLightTitle,
          isSelected: providedThemeMode == ThemeMode.light ||
              providedThemeMode == ThemeMode.system &&
                  platformBrightness == Brightness.light,
          onTap: () {
            ref
                .read(appThemePreferencesProvider.notifier)
                .updateThemeMode(ThemeMode.light);
            HapticFeedback.lightImpact();
          },
          containerColor: CupertinoColors.secondarySystemBackground,
          contentColor: const Color(0xFF000000),
        ),
        // const SizedBox(width: 32.0),
        const Spacer(flex: 3),
        _AppearanceThemeModeItem(
          title: AppStrings.preferencesAppearanceDarkTitle,
          isSelected: providedThemeMode == ThemeMode.dark ||
              providedThemeMode == ThemeMode.system &&
                  platformBrightness == Brightness.dark,
          onTap: () {
            ref
                .read(appThemePreferencesProvider.notifier)
                .updateThemeMode(ThemeMode.dark);
            HapticFeedback.lightImpact();
          },
          containerColor: ref.watch(appThemePreferencesProvider).useDimColors
              ? Colors.black
              : CupertinoColors.darkBackgroundGray,
          contentColor: const Color(0xFFFFFFFF),
        ),
        const Spacer(flex: 4),
      ],
    );
  }
}
