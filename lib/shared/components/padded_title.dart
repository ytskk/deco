import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';

class PaddedTitle extends StatelessWidget {
  const PaddedTitle({
    required this.title,
    this.style,
  });

  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style:
            style ?? Theme.of(context).textTheme.labelLarge!.medium.secondary,
      ),
    );
  }
}
