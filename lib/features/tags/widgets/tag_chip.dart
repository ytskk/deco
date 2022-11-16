import 'package:dev_community/features/features.dart';
import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  const TagChip({
    super.key,
    required this.tag,
    this.onTap,
    required this.isSelected,
  }) : isEnabled = onTap != null;

  final TagModel tag;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final ChipThemeData defaults =
        _TagModelDefault(context, isEnabled, tag.isSelected);

    return RawChip(
      onPressed: onTap,
      isEnabled: isEnabled,
      selected: isSelected,
      showCheckmark: false,
      defaultProperties: defaults,
      label: Text(tag.name),
    );
  }
}

class _TagModelDefault extends ChipThemeData {
  const _TagModelDefault(
    this.context,
    // Rarely used, ok to pass as positional.
    // ignore: avoid_positional_boolean_parameters
    this.isEnabled,
    this.isSelected,
  );

  final BuildContext context;
  final bool isEnabled;
  final bool isSelected;

  @override
  Color? get selectedColor => isEnabled
      ? Theme.of(context).colorScheme.primary
      : Theme.of(context).colorScheme.primary.withOpacity(0.52);

  @override
  Color? get backgroundColor =>
      Theme.of(context).colorScheme.onBackground.withOpacity(0.08);

  @override
  TextStyle? get labelStyle => Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: isSelected
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onBackground,
      );
}
