import 'package:drift/drift.dart';

/// Represents organization
class Organizations extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get username => text()();
  TextColumn get profileImage => text()();

  @override
  Set<Column> get primaryKey => {id};
}
