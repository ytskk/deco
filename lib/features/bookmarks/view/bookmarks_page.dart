import 'package:dev_community/features/features.dart';
import 'package:dev_community/shared/shared.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        actions: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final database = ref.watch(dataStoreProvider);

              return IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: () async {
                  await database.deleteEverything();
                },
              );
            },
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final database = ref.watch(dataStoreProvider);

              return IconButton(
                icon: const Icon(Icons.storage_rounded),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DriftDbViewer(database),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: const BookmarkList(),
    );
  }
}
