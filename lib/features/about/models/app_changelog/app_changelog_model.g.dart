// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_changelog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppChangelogModel _$$_AppChangelogModelFromJson(Map<String, dynamic> json) =>
    _$_AppChangelogModel(
      name: json['name'] as String,
      icon: json['icon'] as String,
      date: DateTime.parse(json['date'] as String),
      color: _colorFromJson(json['color'] as String),
      changes: (json['changes'] as List<dynamic>)
          .map((e) => AppChangeItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AppChangelogModelToJson(
        _$_AppChangelogModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'date': instance.date.toIso8601String(),
      'color': _colorToJson(instance.color),
      'changes': instance.changes,
    };
