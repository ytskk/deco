import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TagTabBar extends StatelessWidget {
  const TagTabBar({
    super.key,
    required this.tabs,
    this.onTap,
    this.controller,
  });

  final TabController? controller;
  final ValueChanged<int>? onTap;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      child: TabBar(
        controller: controller,
        isScrollable: true,
        onTap: onTap,
        tabs: tabs,
      ),
      builder: (context, ref, child) {
        final appStyleType =
            ref.watch(appThemePreferencesProvider).appStyleType;

        if (appStyleType == AppStyleType.devto) {
          return _wrapWithBottomBorder(context, child!);
        }

        return child!;
      },
    );
  }

  Widget _wrapWithBottomBorder(
    BuildContext context,
    Widget child,
  ) {
    final dividerColor = Theme.of(context).dividerColor;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: dividerColor,
            width: 0.85,
          ),
        ),
      ),
      child: child,
    );
  }
}
