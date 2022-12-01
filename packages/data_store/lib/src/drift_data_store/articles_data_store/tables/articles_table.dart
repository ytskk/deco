import 'package:data_store/src/drift_data_store/drift_data_store.dart';
import 'package:drift/drift.dart';

/// Store articles model.
class Articles extends Table {
  /// Article id as primary key
  IntColumn get id => integer()();
  TextColumn get title => text()();

  /// Article content in markdown.
  TextColumn get content => text()();
  TextColumn get coverImage => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get readingTimeMinutes => integer()();
  TextColumn get tags => text().map(const StringListConverter()).nullable()();
  IntColumn get authorUserId => integer().references(Users, #id)();
  TextColumn get authorOrganizationId =>
      text().references(Organizations, #id).nullable()();
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  DateTimeColumn get readAt => dateTime().nullable()();
  TextColumn get url => text()();
  TextColumn get path => text()();

  @override
  Set<Column> get primaryKey => {id};
}
