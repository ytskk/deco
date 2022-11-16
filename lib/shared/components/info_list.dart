import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';

class InfoList extends StatelessWidget {
  /// Creates an information list with [title] and [description].
  ///
  /// Both texts are centered.
  ///
  /// Typically used to display information about the current page or state.
  const InfoList({
    super.key,
    this.icon,
    required this.title,
    this.description,
    this.titleStyle,
  });

  final Widget? icon;
  final String title;
  final TextStyle? titleStyle;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final maxContentWidth = MediaQuery.of(context).size.width / 1.22;

    return ConstrainedContentBox(
      child: Column(
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(height: 24),
          ],
          Text(
            title,
            style: textTheme.displayMedium?.bold,
            textAlign: TextAlign.center,
          ),
          if (description != null) ...[
            const SizedBox(
              height: 2,
            ),
            Text(
              description!,
              style: textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
