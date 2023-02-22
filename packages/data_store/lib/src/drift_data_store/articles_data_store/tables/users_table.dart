import 'package:drift/drift.dart';

/// Users table model.
class Users extends Table {
  /// Article id as primary key
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get username => text()();
  TextColumn get profileImage => text()();

  @override
  Set<Column> get primaryKey => {id};
}
