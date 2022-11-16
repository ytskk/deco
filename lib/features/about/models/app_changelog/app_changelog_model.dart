import 'dart:ui';

import 'package:dev_community/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_changelog_model.freezed.dart';
part 'app_changelog_model.g.dart';

@freezed
class AppChangelogModel with _$AppChangelogModel {
  const factory AppChangelogModel({
    required String name,
    required String icon,
    required DateTime date,
    @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
        required Color color,
    required List<AppChangeItemModel> changes,
  }) = _AppChangelogModel;

  factory AppChangelogModel.fromJson(Map<String, dynamic> json) =>
      _$AppChangelogModelFromJson(json);
}

Color _colorFromJson(String hex) =>
    Color(int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000);

String _colorToJson(Color color) => '#${color.value.toRadixString(16)}';
