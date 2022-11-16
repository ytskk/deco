import 'package:dev_community/constants/constants.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  const IconLabel({
    super.key,
    required this.icon,
    required this.label,
    this.style,
    this.spacing = smallSpacing,
    this.iconSize = defaultIconSize,
    this.iconFirst = true,
  });

  final IconData icon;
  final String label;
  final TextStyle? style;
  final double spacing;
  final double iconSize;
  final bool iconFirst;

  @override
  Widget build(BuildContext context) {
    final labelStyle = style ?? Theme.of(context).textTheme.labelMedium;
    final children = <Widget>[
      Icon(
        icon,
        color: labelStyle!.secondary.color,
        size: iconSize,
      ),
      SizedBox(width: spacing),
      Text(
        label,
        style: labelStyle.secondary,
      ),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: iconFirst ? children : children.reversed.toList(),
    );
  }
}
