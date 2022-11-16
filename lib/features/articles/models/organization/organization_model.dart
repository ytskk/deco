import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_model.freezed.dart';
part 'organization_model.g.dart';

@freezed
class OrganizationQuickInfoModel with _$OrganizationQuickInfoModel {
  const factory OrganizationQuickInfoModel({
    required String name,
    required String username,
    @JsonKey(name: 'profile_image') required String profileImage,
  }) = _OrganizationModel;

  factory OrganizationQuickInfoModel.fromJson(Map<String, dynamic> json) =>
      _$OrganizationQuickInfoModelFromJson(json);
}
