import 'dart:developer';

import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TagArticlesPage extends StatelessWidget {
  const TagArticlesPage({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final systemOverlayStyle = theme.brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: systemOverlayStyle,
        leading: FloatingButton(
          child: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ArticlesList(type: name),
    );
  }
}
