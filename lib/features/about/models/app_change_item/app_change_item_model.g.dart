// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_change_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppChangeItemModel _$$_AppChangeItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_AppChangeItemModel(
      status: $enumDecodeNullable(_$AppChangeStatusEnumMap, json['status']),
      name: json['name'] as String,
      content:
          (json['content'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_AppChangeItemModelToJson(
        _$_AppChangeItemModel instance) =>
    <String, dynamic>{
      'status': _$AppChangeStatusEnumMap[instance.status],
      'name': instance.name,
      'content': instance.content,
    };

const _$AppChangeStatusEnumMap = {
  AppChangeStatus.newFeature: 'new',
  AppChangeStatus.improved: 'improved',
  AppChangeStatus.fixed: 'fixed',
};
