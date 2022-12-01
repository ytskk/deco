import 'package:drift/drift.dart';

/// {@template string_list_converter}
///
/// Converter for [List<String>] to [String] and vice versa.
///
/// {@endtemplate}
class StringListConverter extends TypeConverter<List<String>, String> {
  /// {@macro string_list_converter}
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    return fromDb.split(',').toList();
  }

  @override
  String toSql(List<String> value) {
    return value.join(',');
  }
}
