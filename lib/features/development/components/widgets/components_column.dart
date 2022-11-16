import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';

class ComponentsColumn extends StatelessWidget {
  const ComponentsColumn({
    super.key,
    required this.title,
    required this.child,
    this.description,
    this.titlePadding = EdgeInsets.zero,
    this.trailing,
    this.trailingFlex = 0,
  });

  final String title;
  final Widget child;
  final String? description;
  final EdgeInsets titlePadding;
  final Widget? trailing;
  final int trailingFlex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: titlePadding,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.displaySmall?.medium,
                      ),
                      if (description != null) ...[
                        Text(
                          description!,
                          style: theme.textTheme.bodyMedium?.secondary,
                        ),
                        const SizedBox(height: 12),
                      ],
                    ],
                  ),
                ),
                // const Spacer(),
                if (trailing != null)
                  Expanded(
                    flex: trailingFlex,
                    child: trailing!,
                  ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}
