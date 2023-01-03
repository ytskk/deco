import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';

class TableGroupRow extends StatelessWidget {
  const TableGroupRow({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  Widget? _buildTitleChild(Widget? title, ThemeData theme) {
    if (title != null) {
      return DefaultTextStyle(
        style: theme.textTheme.bodyMedium!,
        child: title,
      );
    }

    return title;
  }

  Widget? _buildSubtitleChild(Widget? title, ThemeData theme) {
    if (title != null) {
      return DefaultTextStyle(
        style: theme.textTheme.bodyMedium!.copyWith(
          color: theme.colorScheme.inverseSurface,
        ),
        child: title,
      );
    }

    return title;
  }

  /// Adds transparent effect to text style and icon theme.
  Widget? _buildTrailingChild(Widget? trailing, ThemeData theme) {
    if (trailing != null) {
      return DefaultTextStyle(
        style: theme.textTheme.labelLarge!.secondary,
        child: IconTheme(
          data:
              IconThemeData(color: theme.textTheme.labelLarge!.secondary.color),
          child: trailing,
        ),
      );
    }

    return trailing;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: leading,
      minLeadingWidth: 0,
      dense: true,
      horizontalTitleGap: 8,
      title: _buildTitleChild(title, theme),
      subtitle: _buildSubtitleChild(subtitle, theme),
      trailing: _buildTrailingChild(trailing, theme),
      onTap: onTap,
      selectedColor: theme.colorScheme.primary,
    );
  }
}
