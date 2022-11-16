import 'package:flutter/material.dart';

class TagTabItem extends StatelessWidget {
  const TagTabItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: title,
      height: 36,
    );
  }
}
