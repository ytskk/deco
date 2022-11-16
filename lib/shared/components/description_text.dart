import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    super.key,
    required this.description,
    this.usePadding = true,
  });

  final String description;
  final bool usePadding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final child = Text(
      description,
      style: theme.textTheme.labelMedium,
    );

    if (usePadding) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: child,
      );
    }

    return child;
  }
}
