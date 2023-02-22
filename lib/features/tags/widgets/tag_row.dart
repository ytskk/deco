import 'package:flutter/material.dart';

class TagRow extends StatelessWidget {
  const TagRow({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    final tagStyle = Theme.of(context).textTheme.displaySmall;

    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(
              tag,
              style: tagStyle,
            ),
          ],
        ),
      ),
    );
  }
}
