import 'dart:developer';
import 'dart:io';

import 'package:data_store/src/drift_data_store/drift_data_store.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Articles,
    Users,
    Organizations,
  ],
  daos: [
    DriftArticlesDao,
  ],
)
class DriftDataStore extends _$DriftDataStore {
  DriftDataStore() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          // await m.createAll();
          await m.alterTable(TableMigration(articles));
          await m.alterTable(TableMigration(users));
          await m.alterTable(TableMigration(organizations));
        },
        onUpgrade: (Migrator m, int from, int to) async {
          log('onUpgrade: from: $from, to: $to');
          // if (from == 1 && to == 2) {
          //   await m.addColumn(articles, articles.url);
          // }
          // if (from == 2 && to == 3) {
          //   await m.addColumn(articles, articles.path);
          // }
        },
      );

  Future<void> deleteEverything() async {
    await customStatement('PRAGMA foreign_keys = OFF');
    try {
      await transaction(() async {
        for (final table in allTables) {
          await delete(table).go();
        }
      });
    } finally {
      await customStatement('PRAGMA foreign_keys = OFF');
    }
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
