import 'package:dev_community/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_change_item_model.freezed.dart';
part 'app_change_item_model.g.dart';

@freezed
class AppChangeItemModel with _$AppChangeItemModel {
  const factory AppChangeItemModel({
    AppChangeStatus? status,
    required String name,
    List<String>? content,
  }) = _AppChangeItemModel;

  factory AppChangeItemModel.fromJson(Map<String, dynamic> json) =>
      _$AppChangeItemModelFromJson(json);
}
